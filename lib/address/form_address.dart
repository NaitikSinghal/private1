import 'dart:convert';

import 'package:flutter/material.dart';
import '../constt.dart';
import '../screens/menu_screen.dart';
import 'package:http/http.dart' as http;
class FormAddress extends StatefulWidget {
  const FormAddress({Key? key}) : super(key: key);

  @override
  State<FormAddress> createState() => _FormAddressState();
}

class _FormAddressState extends State<FormAddress> {
  TextEditingController _House_no = TextEditingController();

  TextEditingController _Area = TextEditingController();

  TextEditingController _Landmark = TextEditingController();

  TextEditingController _City = TextEditingController();

  TextEditingController _State = TextEditingController();

  TextEditingController _Pincode = TextEditingController();

  TextEditingController _Name = TextEditingController();

  TextEditingController _PhoneNumber = TextEditingController();

  final _form = GlobalKey<FormState>();

  void _saveForm() {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    }
  }

  bool _homePressed = false;
  bool _shopPressed = false;
  bool _hotelPressed = false;
  bool _otherPressed = false;
  bool _alreadyPressed = false;

  bool _agree = false;
  bool _city = false;
  bool _state = false;
  bool _pincode = false;
  bool _name = false;
  bool _number = false;

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Address'),
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
        child: Form(
          key: _form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only( top: 10, left: 14,),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            child: Icon(
                              Icons.location_on,
                              size: 20,
                            ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text(
                            'Your Location',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: new TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only( top: 5, left: 20,),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text(
                            'Your Address Here',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: new TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.edit,
                              size: 20,
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15, left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Address Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 20.0, top: 15.0),
                  child: Text("Flat, House no., Floor, Tower", style: TextStyle(fontSize: 14,),)
                ),
              ),      
              Container(
                padding: const EdgeInsets.only(top: 3.0, left: 18.0, right: 18.0),
                child: TextFormField(
                  controller: _House_no,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                    contentPadding: EdgeInsets.all(8),
                    isDense: true,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 20.0, top: 15.0),
                  child: Text("Area, Street, Sector, Village", style: TextStyle(fontSize: 14,),)
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 3.0, left: 18.0, right: 18.0),
                child: TextFormField(
                  controller: _Area,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                    contentPadding: EdgeInsets.all(8),
                    isDense: true,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 20.0, top: 15.0),
                  child: Text("Landmark", style: TextStyle(fontSize: 14,),)
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 3.0, left: 18.0, right: 18.0),
                child: TextFormField(
                  controller: _Landmark,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                    contentPadding: EdgeInsets.all(8),
                    isDense: true,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 20.0, top: 15.0),
                  child: Text("Town/City", style: TextStyle(fontSize: 14,),)
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 3.0, left: 18.0, right: 18.0),
                child: TextFormField( 
                  validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please enter your town/city';
                    } else {
                      setState(() {
                      _city = true;
                    });
                    }
                  return null;
                  },
                  controller: _City,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                    contentPadding: EdgeInsets.all(8),
                    isDense: true,
                  ),
                ),
              ),
              Align(       
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 20.0, top: 15.0),
                  child: Text("State", style: TextStyle(fontSize: 14,),)
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 3.0, left: 18.0, right: 18.0),
                child: TextFormField(
                  validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please enter your state';
                    } else {
                      setState(() {
                      _state = true;
                    });
                    }
                  return null;
                  },
                  controller: _State,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                    contentPadding: EdgeInsets.all(8),
                    isDense: true,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 20.0, top: 15.0),
                  child: Text("Pincode", style: TextStyle(fontSize: 14,),)
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 3.0, left: 18.0, right: 18.0,),
                child: TextFormField(
                  validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please enter your pincode';
                    } else {
                      setState(() {
                      _pincode = true;_pincode = true;
                    });
                    }
                  return null;
                  },
                  controller: _Pincode,
                  maxLength: 6,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    counterText: "",
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                    contentPadding: EdgeInsets.all(8),
                    isDense: true,
                  ),
                ),
              ),
        
              Container(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Contact Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
        
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 20.0, top: 15.0),
                  child: Text("Name", style: TextStyle(fontSize: 14,),)
                ),
              ),      
              Container(
                padding: const EdgeInsets.only(top: 3.0, left: 18.0, right: 18.0),
                child: TextFormField(
                  validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please enter your name';
                    } else {
                      setState(() {
                      _name = true;
                    });
                    }
                    return null;
                  },
                  controller: _Name,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                    contentPadding: EdgeInsets.all(8),
                    isDense: true,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 20.0, top: 15.0),
                  child: Text("Phone Number", style: TextStyle(fontSize: 14,),)
                ),
              ),      
              Container(
                padding: const EdgeInsets.only(top: 3.0, left: 18.0, right: 18.0,),
                child: TextFormField(
                  validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please enter your number';
                    } else {
                      setState(() {
                      _number = true;
                    });
                    }
                  return null;
                  },
                  controller: _PhoneNumber,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    counterText: "",
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                    contentPadding: EdgeInsets.all(8),
                    isDense: true,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15, left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Save as',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only( top: 5,left: 12, right: 12),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 80.0,
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _homePressed = !_homePressed;
                              _shopPressed = false;
                              _hotelPressed = false;
                              _otherPressed = false;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.black),
                            backgroundColor: !_hotelPressed && _homePressed && !_shopPressed && !_otherPressed?  Color(0xff7bc144) : Colors.white,
                          ),
                          child: Text('Home', style: TextStyle(color: Colors.black),),
                        ),
                      ),
                      Container(
                        width: 80.0,
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _shopPressed = !_shopPressed;
                              _homePressed = false;
                              _hotelPressed = false;
                              _otherPressed = false;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.black),
                            backgroundColor: !_hotelPressed && !_homePressed && _shopPressed && !_otherPressed?  Color(0xff7bc144): Colors.white,
                          ),
                          child: Text('Shop', style: TextStyle(color: Colors.black),),
                        ),
                      ),
                      Container(
                        width: 80.0,
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _hotelPressed = !_hotelPressed;
                              _homePressed = false;
                              _shopPressed = false;
                              _otherPressed = false;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.black),
                            backgroundColor: _hotelPressed && !_homePressed && !_shopPressed && !_otherPressed?  Color(0xff7bc144) : Colors.white,
                          ),
                          child: Text('Hotel', style: TextStyle(color: Colors.black),),
                        ),
                      ),
                      Container(
                        width: 80.0,
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _otherPressed = !_otherPressed;
                              _homePressed = false;
                              _shopPressed = false;
                              _hotelPressed = false;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.black),
                            backgroundColor: !_hotelPressed && !_homePressed && !_shopPressed && _otherPressed ?  Color(0xff7bc144) : Colors.white,
                          ),
                          child: Text('Other', style: TextStyle(color: Colors.black),),
                        ),
                      )
                    ],
                  ),
                ),
              ),
        
              Row(
                children: [
                  Material(
                    child: Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Checkbox(
                        activeColor: Color.fromARGB(255, 123, 193, 68),
                        value: _agree,
                        onChanged: (value) {
                          setState(() {
                            _agree = value ?? false;
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    child: const Text(
                      'Make this my default address',
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
        
              Padding(
                padding: const EdgeInsets.only(left:20.0, right: 20, bottom: 20, top: 5),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 123, 193, 68),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
                  onPressed: _agree ? () async {
                    _saveForm();
                  String saveAsOption = '';
                  if (_homePressed) {
                    saveAsOption = 'home';
                  } else if (_shopPressed) {
                    saveAsOption = 'shop';
                  } else if (_hotelPressed) {
                    saveAsOption = 'hotel';
                  } else if (_otherPressed) {
                    saveAsOption = 'other';
                  }

                    final url = 'http://43.204.227.170:9000/api/address/create/'; 
                    final body = jsonEncode(<String, dynamic>{
                      "flat_or_house_or_floor_or_tower_or_building": _House_no.text,
                      "area_or_street_or_sector_or_village": _Area.text,
                      "landmark": _Landmark.text,
                      "town_or_city": _City.text,
                      "state": _State.text,
                      "pincode": _Pincode.text,
                      "name": _Name.text,
                      "phone_number": _PhoneNumber.text,
                      "save_as": saveAsOption, 
                      "user": _PhoneNumber.text
                    });

                    final headers = <String, String>{
                      'Content-Type': 'application/json',
                    };

                    final response = await http.post(Uri.parse(url), headers: headers, body: body);

                    if(response.statusCode == 201){
                    showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                    insetPadding: EdgeInsets.symmetric(horizontal: 80, vertical: 120),
                    contentPadding: EdgeInsets.zero,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    //contentPadding: EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                      title: Image.asset('assets/saved.gif', ),
                      content: const Text(
                        "Address Saved\nSuccessfully", 
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MenuScreen()));
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 40,
                              height: 25,
                              decoration: new BoxDecoration(
                                border: Border.all(),
                                borderRadius: new BorderRadius.circular(10.0),
                                color: Color.fromARGB(255, 108, 230, 124),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: const Text("Ok",style: TextStyle(color: Colors.black),)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                    }
                    else{
                      
                      showDialog(context: context, builder: (ctx) => AlertDialog(
                        title: Text('Error'),
                        
                        content: Text("Failed to save the address."),
                        actions: <Widget>[
                          TextButton(onPressed: (){
                            Navigator.of(ctx).pop();
                          }, child: Text("OK")),
                        ],
                      ));

                    }
                   
                  } : null,
                  
                  child: Text("Save Address", style: kText1,) 
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