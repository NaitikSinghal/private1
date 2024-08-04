import 'package:gropare/models/PhoneNumberProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:gropare/screens/address_or_skip.dart';
import '../constt.dart';
import 'phone_auth.dart';
import 'package:pinput/pinput.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// OTPVerifyScreen is the OTP Verification Screen

class OTPVerifyScreen extends StatefulWidget {

  @override
  State<OTPVerifyScreen> createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  //final FirebaseAuth auth = FirebaseAuth.instance;
    @override
  void initState() {
    super.initState();
    var phoneNumberProvider = Provider.of<PhoneNumberProvider>(context, listen: false);
    sendOTP(phoneNumberProvider.phoneNumber);
  }
  TextEditingController _otp = TextEditingController();
    var url = 'http://43.204.227.6000/';

  
  final _form = GlobalKey<FormState>();

  bool _saveForm() {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return false;
    }
    return true;
  }

   Future<void> sendOTP(String mobileNumber) async {
    var phoneNumberProvider = Provider.of<PhoneNumberProvider>(context, listen: false);
    var mobileNumber= phoneNumberProvider.phoneNumber;
    
    var sendOtpUrl = url + 'api/send/';
    var sendOtpBody = {"phone_number": mobileNumber};
    var headers = {'Content-Type': 'application/json'};

    try {
      var sendOtpResponse = await http.post(Uri.parse(sendOtpUrl), body: json.encode(sendOtpBody), headers: headers);

      if (sendOtpResponse.statusCode == 200 || sendOtpResponse.statusCode == 201) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('OTP Sent'),
              content: Text('OTP has been sent to your mobile number.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('OTP Sending Failed'),
              content: Text('Failed to send OTP. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred. Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> validateOTP(String otp, String mobileNumber) async {
    var phoneNumberProvider = Provider.of<PhoneNumberProvider>(context, listen: false);
    var mobileNumber= phoneNumberProvider.phoneNumber;
    var validateOtpUrl = url + 'api/validate/';
    var validateOtpBody = {'otp': otp, 'phone_number': mobileNumber};
    var headers = {'Content-Type': 'application/json'};

    try {
      var validateOtpResponse = await http.post(Uri.parse(validateOtpUrl), body: json.encode(validateOtpBody), headers: headers);

      if (validateOtpResponse.statusCode == 202) {
        var responseJson = json.decode(validateOtpResponse.body);

          Navigator.push(context, MaterialPageRoute(builder: (context) => AddressOrSkip()));

      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('incorrect OTP'),
              content: Text('Failed to verify the OTP. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred. Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> resendOTP(String mobileNumber) async {
    var phoneNumberProvider = Provider.of<PhoneNumberProvider>(context, listen: false);
    var mobileNumber= phoneNumberProvider.phoneNumber;
    var sendOtpUrl = url + 'api/send/';
    var sendOtpBody = {'phone_number': mobileNumber};
    var headers = {'Content-Type': 'application/json'};

    try {
      var sendOtpResponse = await http.post(Uri.parse(sendOtpUrl), body: json.encode(sendOtpBody), headers: headers);

      if (sendOtpResponse.statusCode == 200) {
        // OTP sent successfully
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('OTP Resent'),
              content: Text('OTP has been resent to your mobile number.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('OTP Resending Failed'),
              content: Text('Failed to resend OTP. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred. Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
  @override
  Widget build(BuildContext context) {

    final phoneNumberProvider = Provider.of<PhoneNumberProvider>(context);
    var mobileNumber = phoneNumberProvider.phoneNumber;

    var code = "";

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
        margin: EdgeInsets.only(left: 25, right: 25, top: 60),
        alignment: Alignment.center,
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
                    'assets/splashlogo.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                // Text for Enter OTP
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter OTP",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Text of sent verification code to number
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "We have sent verification code to\n "+"+91 "+ mobileNumber +" via SMS",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // Using Pinput for the otp boxes
                Pinput(
                  length: 6,
                  defaultPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: TextStyle(fontSize: 18),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 2,
                          spreadRadius: 0.0,
                          offset: Offset(0.5, 2.5),
                        )
                      ]
                    )
                  ),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter otp';
                    }
                    if(text.length<=5) {
                      return 'Please enter a valid otp';
                    }
                    return null;
                    },
                  onChanged: (value) {
                    code = value;
                  },
                  showCursor: true,
                  onCompleted: (pin) => validateOTP(pin, phoneNumberProvider.phoneNumber)
                ),
                SizedBox(height: 20,),
                // Text of Resend otp
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      resendOTP(phoneNumberProvider.phoneNumber);
                    },
                    child: Text(
                      "RESEND OTP",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff7bc144),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                SizedBox(
                  height: 340,
                ),
                // Created button for verify the otp in order to move to menu screen
                SizedBox(
                  width: double.infinity,
                  height: 50,
                   child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      primary: Color(0xff7bc144),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                      onPressed:()  {
                        // if(_saveForm()==true) {
                           Navigator.push(context,MaterialPageRoute(builder: (context) =>  AddressOrSkip()),);
                        // }                      
                      },
                      child: Text("PROCEED", style: kText1,)),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
