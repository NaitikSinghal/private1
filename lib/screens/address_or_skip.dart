import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gropare/screens/menu_screen.dart';
import '../address/select_address.dart';
import '../constt.dart';

class AddressOrSkip extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25, top: 70),
        alignment: Alignment.topRight,
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo of Gropare
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/splashlogo.png',
                  height: 100,
                  width: 100,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/loc.jpg',
                  height: 200,
                  width: 200,
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Enable Location",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 5,),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "We would like to access your location so you can",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "view Fruits, Offer & Deals near you.",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 30,),
              SizedBox(
                width: double.infinity,
                height: 50,
                 child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  primary: Color(0xff7bc144),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
                  onPressed: () async {
                    Navigator.push(context,MaterialPageRoute(builder: (context) =>  SelectAddress()),);
                  },
                  child: Text("Select Your Location", style: kText,)
                ),
              ),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) =>  MenuScreen()),);
                },
                child: Align(
                  alignment: Alignment.center,
                    child: Text(
                      "Skip For Now",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Color(0xff7bc144),
                      ),
                      textAlign: TextAlign.left,
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}