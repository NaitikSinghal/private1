import 'package:flutter/material.dart';
import 'package:gropare/screens/category.dart';
import '../../constt.dart';
import '../../screens/menu_screen.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
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
          title: Column(
          children: [
            Transform(
              transform:  Matrix4.translationValues(-30.0, 12.0, 0.0),
              child: Text('Sanath', style: kText, )
            ),
              Transform(
                transform:  Matrix4.translationValues(-60.0, 20.0, 0.0),
                child: Flexible(
                  child: Container(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text(
                      'Your Address',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        actions: [
          Transform(
            transform:  Matrix4.translationValues(0.0, 30.0, 0.0),
            child: IconButton(
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 30, // Changing Drawer Icon Size
              ),
              onPressed: () {},
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          )
        ],
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => MenuScreen()),);
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
          trailing: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen()),);
            },
            child: const Icon(Icons.arrow_forward_ios, color: Colors.black,)
          ),
          // onTap: settings,
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
