import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gropare/address/form_address.dart';

import '../view/current_location.dart';
import '../view/search_location.dart';

class SelectAddress extends StatelessWidget {

  // String house_no;
  // String area;
  // String landmark;
  // String city;
  // String state;
  // String pincode;
  // String name;
  // String phone_number;

  // SelectAddress({
  //   Key? key,
  //   required this.house_no,
  //   required this.area,
  //   required this.landmark,
  //   required this.city,
  //   required this.state,
  //   required this.pincode,
  //   required this.name,
  //   required this.phone_number,

  //   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Address'),
        backgroundColor:  Color.fromARGB(255, 123, 193, 68),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 15, left: 40),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Add a new address',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top:15, bottom: 5, left: 15, right: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(width: 1.0, color: Colors.black),
                    right: BorderSide(width: 1.0, color: Colors.black),
                    top: BorderSide(width: 1.0, color: Colors.black),
                    bottom: BorderSide(width: 1.0, color: Colors.black),
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 2,
                      spreadRadius: 0.0,
                      offset: Offset(1.5, 1.0),
                    )
                  ]
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) =>  CurrentLocationScreen()),);
                          },
                          child: Text('Use current location', style: TextStyle(
                            fontSize: 18
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Divider(
                      color: Colors.black,
                    )
                  ),
                ),       
                Text("or", style: TextStyle(fontSize: 18,),),        
                Expanded(
                  child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Divider(
                      color: Colors.black,
                    )
                  ),
                ),
              ]
            ),
            Container(
                margin: EdgeInsets.only(top:5, bottom: 5, left: 15, right: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(width: 1.0, color: Colors.black),
                    right: BorderSide(width: 1.0, color: Colors.black),
                    top: BorderSide(width: 1.0, color: Colors.black),
                    bottom: BorderSide(width: 1.0, color: Colors.black),
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 2,
                      spreadRadius: 0.0,
                      offset: Offset(1.5, 1.0),
                    )
                  ]
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) =>  FormAddress()),);
                          },
                          child: Text('Enter Manually', style: TextStyle(
                            fontSize: 18
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, left: 40),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Saved Addresses',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 40),
              child: Align(
                alignment: Alignment.topLeft,
                // child: Text(
                //   'Name: $name \n$house_no $area \n$landmark $city \n$state $pincode\nPhone Number: $phone_number',
                //   style: TextStyle(
                //     color: Colors.black,
                //   ),
                // ),
              ),
            ),
          ]
        ),
      )
    );
  }
}