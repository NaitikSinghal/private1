import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gropare/screens/address_or_skip.dart';
import 'package:gropare/screens/otp_verify_screen.dart';
import '../screens/menu_screen.dart';
import '../constt.dart';

class PersonalDetailScreen extends StatefulWidget {
  const PersonalDetailScreen({super.key});

  @override
  State<PersonalDetailScreen> createState() => _PersonalDetailScreenState();
}

class _PersonalDetailScreenState extends State<PersonalDetailScreen> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _email = TextEditingController();

  final _form = GlobalKey<FormState>();
  bool _saveForm() {
    final isValid = _form.currentState?.validate();
    if (isValid!) {
      return true;
    } else {
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = new FocusNode();
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 25, right: 25),
          child: SizedBox(
            width: double.infinity,
            height: 50,
              child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 123, 193, 68),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                if(_saveForm()) {
                  Navigator.push(context,MaterialPageRoute(builder: (context) =>  AddressOrSkip()),);
                }
              },
              child: Text("CONTINUE", style: kText,)
            ),
          ),
        ),
      ),
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
          child: Form(
            key: _form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo of Gropare
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'assets/logo.png',
                    height: 100,
                    width: 100,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter Personal Details",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: Offset(0,1),
                    //     blurRadius: 3.0,
                    //     color: Colors.black.withOpacity(0.2),
                    //   ),
                    // ],
                  ),
                  child: TextFormField(
                        validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please enter your first name';
                          }
                        return null;
                        },
                        //controller: _PhoneNumber,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: "First Name",
                          labelStyle: TextStyle(color: myFocusNode.hasFocus ? Colors.grey : Color.fromARGB(255, 63, 14, 73)),
                          counterText: "",
                          hintText: "",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0),),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: BorderSide(width: 1.2, color: Color.fromARGB(255, 63, 14, 73),),),
                          //enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 63, 14, 73),),),
                          contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                          //isDense: true,
                        ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: Offset(0,1),
                    //     blurRadius: 3.0,
                    //     color: Colors.black.withOpacity(0.2),
                    //   ),
                    // ],
                  ),
                  child: TextFormField(
                    validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter your last name';
                      }
                    return null;
                    },
                    //controller: _PhoneNumber,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: "Last Name",
                      labelStyle: TextStyle(color: myFocusNode.hasFocus ? Colors.grey : Color.fromARGB(255, 63, 14, 73)),
                      counterText: "",
                      hintText: "",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), ),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: BorderSide(width: 1.2, color: Color.fromARGB(255, 63, 14, 73),),),
                      //enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 63, 14, 73),),),
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                      //isDense: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: Offset(0,1),
                    //     blurRadius: 3.0,
                    //     color: Colors.black.withOpacity(0.2),
                    //   ),
                    // ],
                  ),
                  child: TextFormField(
                    validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter your email id';
                      } else if(!RegExp(r'\S+@\S+\.\S+').hasMatch(text)) {
                        return "Please Enter a Valid Email";
                      } 
                    return null;
                    },
                    //controller: _PhoneNumber,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email Id",
                      labelStyle: TextStyle(color: myFocusNode.hasFocus ? Colors.grey : Color.fromARGB(255, 63, 14, 73)),
                      counterText: "",
                      hintText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0), 
                        borderSide: BorderSide(width: 2, color: Colors.black),
                      ),
                      
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0), 
                        borderSide: BorderSide( width: 1.2, color: Color.fromARGB(255, 63, 14, 73),),),
                      //enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 63, 14, 73),),),
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                      //isDense: true,
                    ),
                  ),
                ),
                
              ]
            ),
          ),
        ),
      ),
    );
  }
}