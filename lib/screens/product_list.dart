import 'package:flutter/material.dart';
import 'package:gropare/models/cart_model.dart';
import 'package:gropare/models/db_helper.dart';
import 'package:gropare/screens/product_details.dart';
import 'package:gropare/screens/cart.dart';
import 'package:provider/provider.dart';
import '../models/cart_provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  DBHelper? dbHelper = DBHelper();

  List<String> productName = ['apple','banana','strawberry','kiwi','mango',];
  List<String> productUnit = ['kg','dz','kg','kg','kg'];
  List<int> productPrice = [100,120,130,140,100];
  List<String> productdesc = ['1kg - 5apple','1dz - 12banana','1kg - strawberry','1kg - 5kiwi','1kg - 3mango'];
  List<String> productImage = [
    'https://gropare-inventory-images.s3.ap-south-1.amazonaws.com/TixyZRh.jpeg',
    'https://gropare-inventory-images.s3.ap-south-1.amazonaws.com/3HwAfgQ.jpeg',
    'https://gropare-inventory-images.s3.ap-south-1.amazonaws.com/lapQ3Nd.jpeg',
    'https://gropare-inventory-images.s3.ap-south-1.amazonaws.com/cXrpzNE.jpeg',
    'https://gropare-inventory-images.s3.ap-south-1.amazonaws.com/vJ7UJZI.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>( context);
    return Container(
      height: 600,

      child:ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: productName.length,
      itemBuilder: (context,index) {
        return Column(
          children: [
            Divider(
              endIndent: 15,
              indent: 15,
              color: Color.fromARGB(68, 130, 107, 107),
              height: 1,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 120,
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: Image(
                    image: NetworkImage(productImage[index].toString()),
                    height: 90,
                    width: 90,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(
                          productName[index].toString(),
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 7),
                        Text(
                          productdesc[index].toString(),
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                        SizedBox(height: 8),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FruitDetailScreen(),));
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Color.fromARGB(255, 123, 193, 68),),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            minimumSize: Size(130, 35),
                            padding: EdgeInsets.only(right: 8)
                          ),
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                              color: Color.fromARGB(255, 123, 193, 68),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: Column(
                      children: [
                        SizedBox(height: 11),
                        Text(
                         '₹'+ productPrice[index].toString()+'/'+productUnit[index],
                          style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 23),
                        ElevatedButton(
                          
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: EdgeInsets.only(left:8, right: 14 ),
                            primary: Color.fromARGB(255, 123, 193, 68),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            minimumSize: Size(130, 35),
                          ),
                          onPressed: () {
                                print(index);
                                print(index);
                                print(productName[index].toString());
                                print( productPrice[index].toString());
                                print( productPrice[index]);
                                print('1');
                                print(productUnit[index].toString());
                                print(productImage[index].toString());

                             dbHelper!.insert(
                              Cart(
                                id: index,
                                productId: index.toString(),
                                productName: productName[index].toString(),
                                initialPrice: productPrice[index], 
                                productPrice: productPrice[index], 
                                quantity: 1, 
                                unitTag: productUnit[index].toString(),
                                image: productImage[index].toString(),
                                productdesc: productdesc[index].toString())
        
                             ).then((value) {
                              print('Product is added to cart');
                              cart.addTotalPrice(double.parse(productPrice[index].toString()));
                              final snackBar = SnackBar(backgroundColor: Color.fromARGB(255, 123, 193, 68),content: Text('Product is added to cart'), duration: Duration(seconds: 1),);

                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                             }).onError((error, stackTrace) {
                              print('error'+error.toString());
                              final snackBar = SnackBar(backgroundColor: Color.fromARGB(255, 123, 193, 68),
                              content: Text('Product is already added in cart'),
                              duration: Duration(seconds: 1));

                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                             });
                          },
                          child: Text(
                            'Add',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              indent: 15,
              endIndent: 15,
              height: 1,
              thickness: 1,
            ),
            SizedBox(height: 7,)
          ],
        );
      }
      ),
    );
  }
}

