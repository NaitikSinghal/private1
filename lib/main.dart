import 'package:flutter/material.dart';
import 'package:gropare/models/cart_provider.dart';
import 'package:gropare/screens/product_list.dart';
import 'package:provider/provider.dart';
import 'package:gropare/screens/menu_screen.dart';
import 'package:gropare/screens/splash_screen.dart';

import 'models/PhoneNumberProvider.dart';

void main() {

  runApp(
    
     MultiProvider(
        providers: [
        ChangeNotifierProvider<CartProvider>(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider<PhoneNumberProvider>(
          create: (_) => PhoneNumberProvider(),
        ),
      ],child: MyApp()));

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return Builder(builder: (BuildContext context){
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      primaryColor: Color.fromARGB(255, 123, 193, 68),
    ),
    home: Splash(),
  );

  });
  }
}
