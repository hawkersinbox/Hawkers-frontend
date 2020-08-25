import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hawkers/Models/Product.dart' as Model;
import 'package:hawkers/Provider/getProduct.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:hawkers/Widgets/navigationBar.dart';

class ProductList extends StatefulWidget {
  static const routeName = '/Products';
  final Model.Products products;
  final category;
  final subCategory;

  const ProductList({Key key, this.products, this.category, this.subCategory}) : super(key: key);

  @override

  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool isLoading = true;
  @override
  void initState() {
    getProduct();

    super.initState();
  }

  getProduct() async {
    await Provider.of<GetProduct>(context, listen: false)
        .getProduct(widget.category.toString());

    setState(() {
      isLoading = false;
    });
  }
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Products',style:TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,

          color:Colors.black
        )),
        centerTitle: true,
      ),
      bottomNavigationBar:NavigationBar() ,
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      ): Padding(
        padding: const EdgeInsets.all(40.0),
        child:Consumer<GetProduct>(
          builder: (ctx, data, _)=> Container(
          child:Column(
            children: [


              Container(
                child: Expanded(
          child: ListView.builder(
          itemCount: data.products.length,
            itemBuilder: (ctx, index) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(data.products[index].category,style:TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color:Colors.black
                            )),

                            Text(data.products[index].subcategory,style:TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color:Colors.grey
                            )),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color:Colors.black,
                          size: 21,
                        )
                      ],
                    ),
                    Divider(height: 30,color: Colors.black,thickness: 1,)
                  ],
                ),
              )
        )),
              Container(
                child: SizedBox(
                  height:45,
                  width:ScreenUtil().setWidth(700),
                  child: RaisedButton(
                    onPressed: (){
                     // _addProduct();


                    },
                    shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular((3)) ),
                    color:Colors.lightGreen,
                    child: Text('Add Product',style: TextStyle(fontSize: 21,
                        fontWeight: FontWeight.w600,
                        color:Colors.white),),




                  ),
                ),
              ),

            ],
          )
        ),
      ),
    )
    );
  }
}
