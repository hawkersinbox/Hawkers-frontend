import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hawkers/Models/priceRange.dart';
import 'package:hawkers/Models/subcategory.dart';
import 'package:hawkers/Provider/AccessToken.dart';
import 'package:hawkers/Provider/getProduct.dart';
import 'package:hawkers/Screens/product/productReview.dart';
import 'package:hawkers/Services/api.dart';
import 'package:hawkers/Widgets/navigationBar.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

List<PriceRange> priceRangeList = [
  PriceRange(display: "Rs1-Rs100", max: 100, min: 1),
  PriceRange(display: "Rs101-Rs500", max: 500, min: 101),
  PriceRange(display: "Rs501-Rs2000", max: 2000, min: 501),
  PriceRange(display: "Rs2001-Rs5000", max: 5000, min: 2001),
];

class AddProducts extends StatefulWidget {
  static const routeName = '/Add-Products';

  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  // TextEditingController _imageUrlController = new TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  RestApi restApi = RestApi();
  TextEditingController _productnameController = new TextEditingController();
  TextEditingController _mfgController = new TextEditingController();
  TextEditingController _commentController = new TextEditingController();

  bool _isLoadingCategory = true;
  PriceRange selectedPriceRange = priceRangeList[0];
  bool _isLoading = false;
  _addProduct() async {
    //    "category_id": 2,
    // "sub_category_id":1,
    // "name": "harry potter",
    // "upper_price": 100,
    // "lower_price": 25,
    // "description": "one of best book",
    // "image_url": " "
    final category =
        Provider.of<ProductProvider>(context, listen: false).selectedCategory;
    final subCategory = Provider.of<ProductProvider>(context, listen: false)
        .selectedSubCategory;

    if (category != null &&
        subCategory != null &&
        _productnameController.text != '' &&
        _mfgController.text != '') {
      final body = jsonEncode({
        "category_id": category.id,
        "sub_category_id": subCategory.id,
        "name": _productnameController.text,
        "upper_price": selectedPriceRange.min,
        "lower_price": selectedPriceRange.max,
        "description": _commentController.text,
        "image_url": " "
      });

      setState(() {
        _isLoading = true;
      });

      var responseData;
      try {
        final response = await restApi.addProduct(body);
        responseData = jsonDecode(response.body);
      } catch (e) {}

      if (responseData["success"]) {
        _productnameController.clear();
        _commentController.clear();
        _mfgController.clear();

        final snackBar = SnackBar(content: Text('${responseData["message"]}'));
        _scaffoldKey.currentState.showSnackBar(snackBar);
      } else {
        final snackBar = SnackBar(content: Text('${responseData["message"]}'));
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
      setState(() {
        _isLoading = false;
      });
    } else {
      final snackBar = SnackBar(content: Text('Invalid Input'));
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  // String _valCategory;
  // List<dynamic> _dataCategory = List();
  // Future<void> getCategory() async {
  //   final response =
  //       await http.get(_baseUrl, headers: {"Accept": "application/json"});
  //   var listData = jsonDecode(response.body);

  //   print("data: $listData");

  //   setState(() {
  //     _dataCategory = listData;
  //   });
  //   print("data: $listData ");
  // }

  @override
  void initState() {
    // TODO: implement initState

    getSharedPrefrences();

    super.initState();
  }

  getCategory(String access_token) async {
    await Provider.of<ProductProvider>(context, listen: false).getCategory(access_token);
    setState(() {
      _isLoadingCategory = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Add Products',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationBar(),
      body: _isLoadingCategory
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SpinKitCircle(
                    color: Colors.blue,
                    size: 25,
                  ),
                ),
              ],
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Category*',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w700)),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            //   color: Colors.white10,
                            border: Border.all(color: Colors.black, width: 0),
                            borderRadius: BorderRadius.circular(3)),
                        height: 45,
                        child: Consumer<ProductProvider>(
                          builder: (ctx, data, child) => Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: DropdownButtonFormField(
                              iconSize: 40,
                              value: data.selectedCategory,
                              items: data.categories.map((item) {
                                return DropdownMenuItem(
                                  child: Text(item.category),
                                  value: item,
                                );
                              }).toList(),
                              onChanged: (value) {
                                data.selectCategory(value);
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Sub Category*',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w700)),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            //   color: Colors.white10,
                            border: Border.all(color: Colors.black, width: 0),
                            borderRadius: BorderRadius.circular(3)),
                        height: 45,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Consumer<ProductProvider>(
                            builder: (ctx, data, child) => Padding(
                              padding: const EdgeInsets.all(.0),
                              child: DropdownButtonFormField(
                                iconSize: 40,
                                value: data.selectedSubCategory,
                                items: data.subCategories.map((item) {
                                  return DropdownMenuItem(
                                    child: Text(item.subCategory),
                                    value: item,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  data.selectSubCategory(value);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Field('Product Name', _productnameController),
                      SizedBox(
                        height: 20,
                      ),
                      Field('MFG/Farm Location', _mfgController),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Price Range',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w700)),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            //   color: Colors.white10,
                            border: Border.all(color: Colors.black, width: 0),
                            borderRadius: BorderRadius.circular(3)),
                        height: 45,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: DropdownButtonFormField(
                            iconSize: 40,
                            value: selectedPriceRange,
                            items: priceRangeList.map((item) {
                              return DropdownMenuItem(
                                child: Text(item.display),
                                value: item,
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedPriceRange = value;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Field('Comment', _commentController),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(Icons.file_upload,
                              size: 45, color: Colors.black),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Upload Image',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                          height: 45,
                          width: 200,
                          child: RaisedButton(
                            onPressed: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              _addProduct();
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>ProductReview()));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular((3))),
                            color: Colors.lightGreen,
                            child: _isLoading
                                ? Center(
                                    child: SpinKitCircle(
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  )
                                : Text(
                                    'Save',
                                    style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget Field(
    String name,
    TextEditingController controller,
  ) {
    return Container(
        child: Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(name,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w700)),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
            height: 45,
            decoration: BoxDecoration(
                //   color: Colors.white10,
                border: Border.all(color: Colors.black, width: 0),
                borderRadius: BorderRadius.circular(3)),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                controller: controller,
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black, fontSize: 21),
                //     color:Colors.grey,

                decoration: InputDecoration(
                  border: InputBorder.none,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
            )),
      ],
    ));
  }

  void getSharedPrefrences() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

    _prefs.then((SharedPreferences sharedPreferences) {
      String accessToken = sharedPreferences.getString("access_token");
      print("access_token: $accessToken");
      getCategory(accessToken);
    })
    .whenComplete(() {
      print("Complete!");
    })
    .catchError((error){
      print("Error: ${error.toString()}");
    });
  }
}
