import 'package:flutter/material.dart';
import 'package:hawkers/Provider/AccessToken.dart';
import 'package:hawkers/Screens/product/addProducts.dart';
import 'package:provider/provider.dart';
import 'package:hawkers/Models/Product.dart' as Model;
import 'package:hawkers/Provider/getProduct.dart';
import 'package:hawkers/Widgets/navigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductList extends StatefulWidget {
  static const routeName = '/Products';
  final Model.Product products;
  final category;
  final subCategory;

  const ProductList({Key key, this.products, this.category, this.subCategory})
      : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool isLoading = true;

  @override
  void initState() {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

    _prefs.then((SharedPreferences sharedPreferences) {
      String accessToken = sharedPreferences.getString("access_token");
      print("access_token: $accessToken");
      getProduct(accessToken);
    })
        .whenComplete(() {
      print("Complete!");
    })
        .catchError((error){
      print("Error: ${error.toString()}");
    });
    super.initState();
  }

  getProduct(String access_token) async {
    await Provider.of<ProductProvider>(context, listen: false).getProduct(access_token);
    setState(() {
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Products',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationBar(),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(40.0),
              child: Consumer<ProductProvider>(
                builder: (ctx, data, _) => Container(
                  child: Column(
                    children: [
                      Container(
                        child: Expanded(
                          child: ListView.builder(
                            itemCount: data.products.length,
                            itemBuilder: (ctx, index) => Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.products[index].name.toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          data.products[index].category
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.black,
                                        size: 21,
                                      ),
                                      onTap: (){
                                        // TODO Product Review Screen...


                                      },
                                    )
                                  ],
                                ),
                                Divider(
                                  height: 30,
                                  color: Colors.black,
                                  thickness: 1,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: SizedBox(
                          height: 45,
                          // width:ScreenUtil().setWidth(700),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                      context, AddProducts.routeName)
                                  .then((value) {
                                Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

                                _prefs.then((SharedPreferences sharedPreferences) {
                                  String accessToken = sharedPreferences.getString("access_token");
                                  print("access_token: $accessToken");
                                  getProduct(accessToken);
                                })
                                    .whenComplete(() {
                                  print("Complete!");
                                })
                                    .catchError((error){
                                  print("Error: ${error.toString()}");
                                });
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular((3))),
                            color: Colors.lightGreen,
                            child: Text(
                              'Add Product',
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
}
