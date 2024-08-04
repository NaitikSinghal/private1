import 'package:flutter/material.dart';
import '../../constt.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          AppBar(
            toolbarHeight: 120,
            leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                        icon: const Icon(
                          Icons.account_circle_sharp,
                          color: Colors.white,
                          size: 40, // Changing Drawer Icon Size
                        ),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            title: Text('Sanath', style: kText,),
            automaticallyImplyLeading: false,
            backgroundColor:  Color.fromARGB(255, 123, 193, 68),
          ),
          ListTile(
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            title: Text(
              'Shop By Category',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black
              ),
            ),
            onTap: () {
              // Navigator.of(context)
              //     .pushReplacementNamed(OrdersScreen.routeName);
            },
          ),
          ListTile(
            title: Text(
              'My Account',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black
              ),
            ),
            onTap: () {
              // Navigator.of(context)
              //     .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
          ListTile(
            title: Text(
              'My Order',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black
              ),
            ),
            onTap: () {
              // Navigator.of(context)
              //     .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
          ListTile(
            title: Text(
              'Offers',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black
              ),
            ),
            onTap: () {
              // Navigator.of(context)
              //     .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
          ListTile(
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black
              ),
            ),
            onTap: () {
              // Navigator.of(context)
              //     .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
          // ListTile(
          //   title: Text(
          //     'My Account',
          //     style: TextStyle(
          //       fontSize: 18,
          //       color: Colors.black
          //     ),
          //   ),
          //   onTap: () {
          //     // Navigator.of(context)
          //     //     .pushReplacementNamed(UserProductsScreen.routeName);
          //   },
          // ),
          ListTile(
            title: Text(
              'Help & Support',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black
              ),
            ),
            onTap: () {
              // Navigator.of(context)
              //     .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black
              ),
            ),
            onTap: () {
              // Navigator.of(context)
              //     .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
