import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../constt.dart';
import '../screens/cart.dart';
import '../screens/category.dart';
import '../screens/menu_screen.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
 bottomNavigationBar: BottomAppBar(
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector( onTap: () {
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
            SizedBox.fromSize(
              size: Size(70, 56),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite_border_outlined, size: 28,), // <-- Icon
                  Text("Favorite"), // <-- Text
                  ],
                ),
            ),
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
    
      appBar: AppBar(
        elevation: 0,
        title: Text('My Account', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              height: 80,
              width: 80,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 123, 193, 68),
                  //borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Align(alignment: Alignment.center, child: Text('S', style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold) )),
            ),
            SizedBox(height: 10,),
            Text('Sanath', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)  ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone, size: 18,),
                Text('1234567890', style: TextStyle(color: Colors.black, fontSize: 16, ) ),
                SizedBox(width: 10,),
                Icon(Icons.edit, size: 24, ),
              ],
            ),
            SizedBox(height: 20,),
            Divider(indent: 20, color: Colors.grey , endIndent: 20,),
            ListTile(
              title: Text(
                'My Orders',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black
                ),
              ),
              visualDensity: VisualDensity(vertical: -4),
              // leading: Icon(Icons.),
              leading: Icon(Icons.folder_shared_outlined, color: Colors.black,),
              trailing: GestureDetector(
                onTap: () {
                  // Navigator.of(context).pop();
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen()),);
                },
                child: const Icon(Icons.arrow_forward_ios, color: Colors.black,)
              ),
              onTap: () {
                
              },
            ),
            Divider(indent: 20, color: Colors.grey , endIndent: 20,),
            ListTile(
              title: Text(
                'Favorites',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black
                ),
              ),
              visualDensity: VisualDensity(vertical: -4),
              leading: Icon(Icons.favorite_border_outlined, size: 22,color: Colors.black,),
              trailing: GestureDetector(
                onTap: () {
                  // Navigator.of(context).pop();
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen()),);
                },
                child: const Icon(Icons.arrow_forward_ios, color: Colors.black,)
              ),
              onTap: () {} 
            ),
            Divider(indent: 20, color: Colors.grey , endIndent: 20,),
            ListTile(
              title: Text(
                'Saved Addresses',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black
                ),
              ),
              visualDensity: VisualDensity(vertical: -4),
              leading: Icon(Icons.location_on_outlined, size: 22,color: Colors.black,),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
              onTap: () {
                // Navigator.of(context)
                //     .pushReplacementNamed(UserProductsScreen.routeName);
              },
            ),
            Divider(indent: 20, color: Colors.grey , endIndent: 20,),
            ListTile(
              title: Text(
                'Payment Methods',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black
                ),
              ),
              visualDensity: VisualDensity(vertical: -4),
              leading: Icon(Icons.payment_outlined, size: 22,color: Colors.black,),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
              onTap: () {
                // Navigator.of(context)
                //     .pushReplacementNamed(UserProductsScreen.routeName);
              },
            ),
            Divider(indent: 20, color: Colors.grey , endIndent: 20,),
            ListTile(
              title: Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black
                ),
              ),
              visualDensity: VisualDensity(vertical: -4),
              leading: Icon(Icons.notifications_outlined, size: 22,color: Colors.black,),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
              onTap: () {
                // Navigator.of(context)
                //     .pushReplacementNamed(UserProductsScreen.routeName);
              },
            ),
            Divider(indent: 20, color: Colors.grey , endIndent: 20,),
            ListTile(
              title: Text(
                'Language',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black
                ),
              ),
              visualDensity: VisualDensity(vertical: -4),
              leading: Icon(Icons.language_outlined, size: 22,color: Colors.black,),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
              onTap: () {
                // Navigator.of(context)
                //     .pushReplacementNamed(UserProductsScreen.routeName);
              },
            ),
            Divider(indent: 20, color: Colors.grey , endIndent: 20,),
            ListTile(
              title: Text(
                'About',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black
                ),
              ),
              visualDensity: VisualDensity(vertical: -4),
              leading: Icon(Icons.feedback_outlined, size: 22,color: Colors.black,),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
              onTap: () {
                // Navigator.of(context)
                //     .pushReplacementNamed(UserProductsScreen.routeName);
              },
            ),
            Divider(indent: 20, color: Colors.grey , endIndent: 20,),
            ListTile(
              title: Text(
                'Feedback',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black
                ),
              ),
              visualDensity: VisualDensity(vertical: -4),
              leading: Icon(Icons.chat_outlined, size: 22,color: Colors.black,),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
              onTap: () {
                // Navigator.of(context)
                //     .pushReplacementNamed(UserProductsScreen.routeName);
              },
            ),
            Divider(indent: 20, color: Colors.grey , endIndent: 20,),
          ],
        ),
      ),
    );
  }
}