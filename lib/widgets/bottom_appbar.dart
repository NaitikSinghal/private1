import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import '../models/cart_provider.dart';
import '../screens/cart.dart';
import '../screens/category.dart';
import 'package:provider/provider.dart';

class bottom_appbar extends StatelessWidget {
  const bottom_appbar({super.key});

  @override
  Widget build(BuildContext context) {
       return  BottomAppBar(
        surfaceTintColor: Colors.white,
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox.fromSize(
              size: Size(70, 56),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.home_outlined, color: Color.fromARGB(255, 123, 193, 68),size: 28,), // <-- Icon
                  Text("Home"), // <-- Text
                  ],
                ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(),));
              },
              child: SizedBox.fromSize(
                size: Size(74, 56),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.category_outlined, size: 28,), // <-- Icon
                    Text("Category"), // <-- Text
                    ],
                  ),
              ),
            ),
            SizedBox.fromSize(
              size: Size(70, 56),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.local_offer_outlined, size: 28,), // <-- Icon
                  Text("Offers"), // <-- Text
                  ],
                ),
            ),
            // SizedBox.fromSize(
            //   size: Size(70, 56),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       Icon(Icons.favorite_border_outlined, size: 28,), // <-- Icon
            //       Text("Favorite"), // <-- Text
            //       ],
            //     ),
            // ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) =>  CartScreen()));
              },
              child: SizedBox.fromSize(
                size: Size(70, 56),
                child: Padding(
                  padding: EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.shopping_cart_outlined, size: 28,), // <-- Icon
                    Text("Cart"), // <-- Text
                    ],
                  ),
                ),
              ),
            ),
        
          ]
          ),
      );
    
  }
}