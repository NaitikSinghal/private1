
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gropare/screens/menu_screen.dart';
import 'package:gropare/screens/cart.dart';

import '../models/category_data.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  List<String> imgList = [
    'https://media.istockphoto.com/id/184276818/photo/red-apple.jpg?s=612x612&w=0&k=20&c=NvO-bLsG0DJ_7Ii8SSVoKLurzjmV0Qi4eGfn6nW3l5w=',
    'https://media.istockphoto.com/id/184276818/photo/red-apple.jpg?s=612x612&w=0&k=20&c=NvO-bLsG0DJ_7Ii8SSVoKLurzjmV0Qi4eGfn6nW3l5w=',
    'https://media.istockphoto.com/id/184276818/photo/red-apple.jpg?s=612x612&w=0&k=20&c=NvO-bLsG0DJ_7Ii8SSVoKLurzjmV0Qi4eGfn6nW3l5w=',
    'https://media.istockphoto.com/id/184276818/photo/red-apple.jpg?s=612x612&w=0&k=20&c=NvO-bLsG0DJ_7Ii8SSVoKLurzjmV0Qi4eGfn6nW3l5w=',
    'https://media.istockphoto.com/id/184276818/photo/red-apple.jpg?s=612x612&w=0&k=20&c=NvO-bLsG0DJ_7Ii8SSVoKLurzjmV0Qi4eGfn6nW3l5w=',
    'https://media.istockphoto.com/id/184276818/photo/red-apple.jpg?s=612x612&w=0&k=20&c=NvO-bLsG0DJ_7Ii8SSVoKLurzjmV0Qi4eGfn6nW3l5w=',
    'https://media.istockphoto.com/id/184276818/photo/red-apple.jpg?s=612x612&w=0&k=20&c=NvO-bLsG0DJ_7Ii8SSVoKLurzjmV0Qi4eGfn6nW3l5w=',
    'https://media.istockphoto.com/id/184276818/photo/red-apple.jpg?s=612x612&w=0&k=20&c=NvO-bLsG0DJ_7Ii8SSVoKLurzjmV0Qi4eGfn6nW3l5w=',
    'https://media.istockphoto.com/id/184276818/photo/red-apple.jpg?s=612x612&w=0&k=20&c=NvO-bLsG0DJ_7Ii8SSVoKLurzjmV0Qi4eGfn6nW3l5w=',
    'https://media.istockphoto.com/id/184276818/photo/red-apple.jpg?s=612x612&w=0&k=20&c=NvO-bLsG0DJ_7Ii8SSVoKLurzjmV0Qi4eGfn6nW3l5w=',
    'https://media.istockphoto.com/id/184276818/photo/red-apple.jpg?s=612x612&w=0&k=20&c=NvO-bLsG0DJ_7Ii8SSVoKLurzjmV0Qi4eGfn6nW3l5w=',
    
  ];
  List<String> imgText = [
    'All Fruits',
    'Apple',
    'Banana',
    'Mango',
    'Citrous Fruits',
    'Exotic Fruits',
    'Orange',
    'Berries',
    'Tropical Fruits',
    'Stone Fruits',
    'Organic Fruits',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       bottomNavigationBar: BottomAppBar(
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MenuScreen(),));
              },
              child: SizedBox.fromSize(
                size: Size(70, 56),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.home_outlined, size: 28,), // <-- Icon
                    Text("Home"), // <-- Text
                    ],
                  ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(),));
              },
              child: SizedBox.fromSize(
                size: Size(74, 56),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.category_outlined, size: 28,color: Color.fromARGB(255, 123, 193, 68),), // <-- Icon
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
            GestureDetector(
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
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       SizedBox.fromSize(
      //         size: Size(70, 56),
      //         child: ClipOval(
      //         child: Material(
      //           //color: Colors.black,
      //           child: InkWell(
      //             splashColor: Colors.grey, 
      //             onTap: () {
      //               Navigator.push(context, MaterialPageRoute(builder: (context) => MenuScreen()),);
      //             }, 
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: <Widget>[
      //                 Icon(Icons.home_outlined, size: 28,), // <-- Icon
      //                 Text("Home"), // <-- Text
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox.fromSize(
      //         size: Size(74, 56),
      //         child: ClipOval(
      //         child: Material(
      //           //color: Colors.black,
      //           child: InkWell(
      //             splashColor: Colors.grey, 
      //             onTap: () {}, 
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: <Widget>[
      //                 Icon(Icons.category_outlined, size: 28,), // <-- Icon
      //                 Text("Category"), // <-- Text
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox.fromSize(
      //         size: Size(70, 56),
      //         child: ClipOval(
      //         child: Material(
      //           //color: Colors.black,
      //           child: InkWell(
      //             splashColor: Colors.grey, 
      //             onTap: () {}, 
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: <Widget>[
      //                 Icon(Icons.local_offer_outlined, size: 28,), // <-- Icon
      //                 Text("Offers"), // <-- Text
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox.fromSize(
      //         size: Size(70, 56),
      //         child: ClipOval(
      //         child: Material(
      //           //color: Colors.black,
      //           child: InkWell(
      //             splashColor: Colors.grey, 
      //             onTap: () {}, 
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: <Widget>[
      //                 Icon(Icons.favorite_border_outlined, size: 28,), // <-- Icon
      //                 Text("Favorite"), // <-- Text
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox.fromSize(
      //         size: Size(70, 56),
      //         child: ClipOval(
      //         child: Material(
      //           //color: Colors.black,
      //           child: InkWell(
      //             splashColor: Colors.grey, 
      //             onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));}, 
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: <Widget>[
      //                 Icon(Icons.shopping_cart_outlined, size: 28,), // <-- Icon
      //                 Text("Cart"), // <-- Text
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ]
      //     ),
      // ),
      appBar: AppBar(
        elevation: 0,
        title: Text('All Categories', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
        backgroundColor:  Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:20, left: 20, right: 20,),
        child: GridView.builder(
          itemCount: categoryItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            crossAxisCount: 3,
            //childAspectRatio: 1.0
          ), 
          itemBuilder: (context, index) {
            return Card(
              elevation: 0,
              child: Container(
                //height: 290,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black,),
                  shape: BoxShape.circle,
                  //borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(image: NetworkImage(categoryItems[index].image), fit: BoxFit.cover),
                ),
                // child: Stack(
                //   children: [
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.stretch,
                //       children: [
                //         Expanded(
                //           child: Align(
                //             alignment: Alignment.center,
                //             child: Image.network(
                //               imgList[index],
                //               fit: BoxFit.fill,
                //             ),
                //           ),
                //         ),
                //         // Text(
                //         //   imgText[index],
                //         //   style: TextStyle(
                //         //     fontSize: 18,
                //         //     fontWeight: FontWeight.bold,
                //         //   ),
                //         // ),
                //       ],
                //     )
                //   ],
                // ),
                // child: Align(
                //   alignment: Alignment.bottomCenter, 
                //   child: Text(imgText[index])
                // ),
              ),
            );
          },
        ),
      ),
    );
  }
}