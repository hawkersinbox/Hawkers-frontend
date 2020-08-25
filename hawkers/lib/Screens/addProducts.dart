import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'package:hawkers/Screens/products.dart';
import 'package:hawkers/Widgets/navigationBar.dart';
import 'package:provider/provider.dart';
import 'package:hawkers/Provider/productsProvider.dart';

import 'package:http/http.dart' as http;

class AddProducts extends StatefulWidget {
  static const routeName = '/Add-Products';
//  final Model.Category categories;
//  final category;
//  final subCategory;
//  final index;
//
//  const AddProducts(
//      {Key key, this.categories, this.category, this.subCategory, this.index})
//      : super(key: key);
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  TextEditingController _imageUrlController = new TextEditingController();
  TextEditingController _productnameController = new TextEditingController();
  TextEditingController _mfgController = new TextEditingController();
  TextEditingController _commentController = new TextEditingController();

  String _mfg;
  String _productname;
  String _imageUrl;
  bool loading = false;

  _addProduct() async {
    _mfg = _mfgController.text;
    _productname = _productnameController.text;
    _imageUrl = _imageUrlController.text;

    if (_mfg != '' && _productname != '' && _imageUrl != '') {
      String body = json.encode({
        "name": _productname,
        "description": _mfg,
        "image_url": _imageUrl,
      });
      setState(() {
        loading = true;
      });
      final response =
          await Provider.of<Product>(context, listen: false).product(body);
      setState(() {
        loading = false;
      });

      Navigator.of(context).pushNamed(ProductList.routeName);
    }
  }

  String _baseUrl =
      "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/category";
  String _valCategory;
  List<dynamic> _dataCategory = List();
  Future<void> getCategory() async {
    final response =
        await http.get(_baseUrl, headers: {"Accept": "application/json"});
    var listData = jsonDecode(response.body);

    print("data: $listData");

    setState(() {
      _dataCategory = listData;
    });
    print("data: $listData ");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategory();
  }

//  getCategory() async {
//    await Provider.of<Categories>(context, listen: false)
//        .getCategory(widget.category.toString());
//
//    setState(() {
//      loading = false;
//    });
//  }
  Widget build(BuildContext context) {
    int _value = 1;
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
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
      body: SingleChildScrollView(
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
                  child: Padding(
                    padding: const EdgeInsets.all(.0),
                    child: DropdownButtonFormField(
                        iconSize: 40,
                        value: _valCategory,
                        items: _dataCategory.map((item) {
                          return DropdownMenuItem(
                            child: Text(item['category']),
                            value: item['category'],
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _valCategory = value;
                          });
                        }),
                  )),
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
                  padding: const EdgeInsets.all(.0),
                  child: DropdownButtonFormField(
                    iconSize: 40,
                    style: TextStyle(
                        fontSize: 21,
                        //  fontWeight: FontWeight.w600,
                        color: Colors.black),
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text("Grains"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Fruits"),
                        value: 2,
                      ),
                      DropdownMenuItem(child: Text("others"), value: 3),
                    ],
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
                  padding: const EdgeInsets.all(.0),
                  child: DropdownButtonFormField(
                    iconSize: 40,
                    style: TextStyle(
                        fontSize: 21,
                        //  fontWeight: FontWeight.w600,
                        color: Colors.black),
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text("Rs1-Rs100"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Rs100-Rs500"),
                        value: 2,
                      ),
                      DropdownMenuItem(child: Text("Rs500-Rs1000"), value: 3),
                      DropdownMenuItem(child: Text("Rs1000-Rs2500"), value: 4),
                      DropdownMenuItem(child: Text(">2500"), value: 5)
                    ],
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
                  Icon(Icons.file_upload, size: 45, color: Colors.black),
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
              Container(
                child: SizedBox(
                  height: 45,
                  width: ScreenUtil().setWidth(700),
                  child: RaisedButton(
                    onPressed: () {
                      _addProduct();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular((3))),
                    color: Colors.lightGreen,
                    child: Text(
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
          )),
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
}
