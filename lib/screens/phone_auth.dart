import 'package:flutter/material.dart';
import '../models/PhoneNumberProvider.dart';
import 'otp_verify_screen.dart';
import '../constt.dart';
import 'package:provider/provider.dart';

// Phone Auth is phone number authentication screen

class MyPhone extends StatefulWidget {
  static String verify = "";
  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
// Created TextEditing Controller for the Input of Phone Number 
  TextEditingController countryController = TextEditingController();
  var phonenum = "";
  bool agree = false;

  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
  }

  final _form = GlobalKey<FormState>();

  bool _saveForm() {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return false;
    }
    return true;
  }

  // TextEditingController _phoneNumberController = TextEditingController();

// Event handler for when the user enters their phone number


  @override
  Widget build(BuildContext context) {
    final phoneNumberProvider = Provider.of<PhoneNumberProvider>(context);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25, top: 70),
        alignment: Alignment.topRight,
        child: SingleChildScrollView(
          child: Form(
            key: _form,
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
                // Text of Login/Signup
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Login/Signup",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Text of entering mobile number
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Please enter your mobile number",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 40,
                        child: TextField(
                          controller: countryController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Text(
                        "|",
                        style: TextStyle(fontSize: 33, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      // User Input Textfield for entering the number
                      Expanded(
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                          phoneNumberProvider.setPhoneNumber(value);
                        });
                          },
                          validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Phone number is required';
                          }
                          if(text.length<=9) {
                            return 'Please enter a valid number';
                          }
                          return null;
                          },
                          
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 4),
                            border: InputBorder.none,
                            counterText: "",
                            hintText: "Enter mobile number",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 365,
                ),
                // Checkbox for terms & conditions (if it is checked then button will be visible)
                Row(
                children: [
                  Material(
                    child: Checkbox(
                      //activeColor: Color.fromARGB(255, 63, 14, 73),
                      value: agree,
                      onChanged: (value) {
                        setState(() {
                       
                          agree = value ?? false;
                        });
                      },
                    ),
                  ),
                  const Text(
                    'I agree to the Privacy Policy and Terms & \nConditions',
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              // Button for submitting the number in order to get the otp
                SizedBox(
                  width: double.infinity,
                  height: 50,
                   child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    primary: Color(0xff7bc144),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
                    onPressed: agree ? () async {
                      _saveForm();
                     
                      
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>  OTPVerifyScreen()),);
                        
                           
                    }: null,
                    child: Text("PROCEED", style: kText1,)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


