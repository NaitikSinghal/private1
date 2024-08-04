import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gropare/screens/language_screen.dart';
import 'package:gropare/screens/phone_auth.dart';
import 'package:gropare/screens/otp_verify_screen.dart';

class Splash extends StatefulWidget {

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  
// Method For Delay of 2.5 seconds for the splash screen
    void initState(){
    Future.delayed(Duration(milliseconds: 2500), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LanguageScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Image.asset('assets/splashimg.png', alignment: Alignment.bottomCenter,),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 170,
                width: 170,
                child: Image(
                  image: new ExactAssetImage('assets/splashlogo.png'),
                  fit: BoxFit.contain,
                )
            ),
          ],
        ),
      ),
    );
  }
}