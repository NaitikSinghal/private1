import 'dart:convert';
import 'dart:ffi';
import 'package:gropare/address/form_address.dart';
import 'package:gropare/address/select_address.dart';
import 'package:gropare/models/PhoneNumberProvider.dart';
import 'package:gropare/widgets/empty_cart.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../models/cart_provider.dart';

final Razorpay _razorpay = Razorpay();

void _openRazorpayCheckout(BuildContext context) {

  CartProvider cartProvider = Provider.of<CartProvider>(context, listen: false);
  double totalPrice = cartProvider.totalPrice;
  int amount = (totalPrice * 100).toInt();
  var options = {
    'key': 'rzp_test_huQ5JQvYeIV7g8', 
    'amount':  amount, 
    'name': 'Gropare',
    'description': 'Payment for order',
    'prefill': {'contact': '1234567890', 'email': 'customer@example.com'},
    'external': {
      'wallets': ['paytm']
    }
  };



  try {
    _razorpay.open(options);
  } catch (e) {
    print('Error: $e');
  }
}

@override
void initState() {
 
  _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
  _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
}

void _handlePaymentSuccess(PaymentSuccessResponse response) {
  // Handle payment success
}

void _handlePaymentError(PaymentFailureResponse response) {
  // Handle payment failure
}

void _handleExternalWallet(ExternalWalletResponse response) {
  // Handle external wallet
}

@override
void dispose() {
  
  _razorpay.clear();
}

class CheckoutScreen extends StatefulWidget {

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}


List<dynamic> addressList = []; 
// Int ResponseCode = ResponseCode;

class _CheckoutScreenState extends State<CheckoutScreen> {
    String address = '';
   
late PhoneNumberProvider phoneNumberProvider;

  @override
  void initState() {
    super.initState();

      // phoneNumberProvider = Provider.of<PhoneNumberProvider>(context, listen: false);
      fetchAddressData();

  }

    Future<void> fetchAddressData() async {
    var phoneNumberProvider = Provider.of<PhoneNumberProvider>(context, listen: false);
    var mobileNumber= phoneNumberProvider.phoneNumber;
    final url = 'http://43.204.227.170:9000/api/address/$mobileNumber';
    final headers = {'Content-Type': 'application/json'};
 
    print(mobileNumber);
    try {
      final response = await http.get(Uri.parse(url), headers: headers,);
      // print('API Call Response:');
      // print('Status Code: ${response.statusCode}');
      // print('Response Body: ${response.body}');
    
      if (response.statusCode == 200) {
        
        final responseData = jsonDecode(response.body);
        addressList = responseData;
        final addressData = responseData[0]; // Access the first object in the array
        final flatOrHouseOrFloorOrTowerOrBuilding = addressData['flat/house/floor/tower/building'];
        final areaOrStreetOrSectorOrVillage = addressData['area/street/sector/village'];
        final landmark = addressData['landmark'];
        final townOrCity = addressData['town/city'];
        final state = addressData['state'];
        final pincode = addressData['pincode'];
        final mobileNumber = addressData['phone_number'];


        final formattedAddress = '$flatOrHouseOrFloorOrTowerOrBuilding, $areaOrStreetOrSectorOrVillage, $landmark, $townOrCity, $state - $pincode';

        setState(() {
          address = formattedAddress;
        });
        print('$mobileNumber');
        print('$address');
      } else {
         
       print('failed ');
        // Handle API error
      }
    } catch (error) {
        print('API Call Error: $error');
       showDialog(context: context, builder: (ctx) => AlertDialog(
            title: Text('Error'),
            content: Text(" $error "),
            actions: <Widget>[
              TextButton(onPressed: (){
                Navigator.of(ctx).pop();
              }, child: Text("OK")),
            ],
          ));
      // Handle error
    }
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

  
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_circle_left_outlined,
          size: 35,
          color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Checkout',
        style: TextStyle(color: Colors.black,
        fontSize: 25 ),),
      
        
            ),
      body:Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30.0,bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: _Dot(
                   
                    active: true,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 24,
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) { 
                        print('${constraints.constrainWidth()}');
                        return  Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate((constraints.constrainWidth()/10).floor(), (index) => 
                        SizedBox(
                          width: 6,height:2,
                          child: DecoratedBox(decoration: BoxDecoration(
                            color: Color.fromARGB(255, 123, 193, 68),
                          )),))
                        );
                       },
                     
                    ),
                  )
                ),
                _Dot(
                 
                  active: false,
                ),
                Expanded(
                child: SizedBox(
                  height: 24,
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) { 
                      print('${constraints.constrainWidth()}');
                      return  Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate((constraints.constrainWidth()/10).floor(), (index) => 
                      SizedBox(
                        width: 6,height:2,
                        child: DecoratedBox(decoration: BoxDecoration(
                          color: Color.fromARGB(255, 212, 208, 208)
                        )),))
                      );
                      },
                    
                  ),
                )
              ),
                Padding(
                  padding: const EdgeInsets.only(right: 70.0),
                  child: _Dot(
                   
                    active: false,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:53.0),
                  child: Text('Shipping', style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 123, 193, 68), fontSize: 13),),
                ),
              
                Text('Payment',style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 212, 208, 208), fontSize: 13),),
                Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: Text('Place Order',style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 212, 208, 208), fontSize: 13),))
              ],
            ),
          ),
      
          Divider(
            height: 1,thickness: 2,
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 35),
                child: Text('Choose Delivery Address', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          
          Expanded(
            child: FutureBuilder(

              builder: (context, snapshot) {

                if(addressList.isEmpty){
                  
                  return Column(
                   
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 210,
                          width: 210,
                          child: Image.asset('assets/emptyaddress.jpeg',fit: BoxFit.contain,),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Align(
                        alignment: Alignment.center,
                        child: Text("No Saved Address",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),)),
                         Align(
                        alignment: Alignment.center,
                        child: Text("found",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),)),
                                  SizedBox(height: 20.0),
                      InkWell(
                        onTap: () async {
                          Navigator.push(context,MaterialPageRoute(builder: (context) =>  SelectAddress()),);
                          },
                        child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('+ Add New Address',style: TextStyle(color: Color.fromARGB(255, 123, 193, 68),fontWeight: FontWeight.bold, fontSize: 18)),
                            ],
                            ),
                          ),
                      ),
                    ],
                 
                  );
                
                }
                else{
                  return
                    ListView.separated(
                    
                    itemCount: addressList.length,
                    separatorBuilder: (context, index) => SizedBox(height: 10,),
                    itemBuilder: (context , index) {
                      var addressData = addressList[index];
                      var flatOrHouseOrFloorOrTowerOrBuilding = addressData['flat/house/floor/tower/building'];
                      var areaOrStreetOrSectorOrVillage = addressData['area/street/sector/village'];
                      var landmark = addressData['landmark'];
                      var townOrCity = addressData['town/city'];
                      var state = addressData['state'];
                      var pincode = addressData['pincode'];
                      var mobileNumber = addressData['phone_number'];
                      var formattedAddress =
                          '$flatOrHouseOrFloorOrTowerOrBuilding, $areaOrStreetOrSectorOrVillage, $landmark, $townOrCity, $state - $pincode.\nPhone Number : +91 $mobileNumber';
                      
                      return InkWell(
                           onTap: () {
                            setState(() {
                              if(_selectedIndex == index){
                                _selectedIndex= -1;
                              }else{
                              _selectedIndex= index;
                              }
                            });
                          },
                        child: Container(
                          height: 90,
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          padding: EdgeInsets.all(13.0),
                          decoration: BoxDecoration(
                            color: index== _selectedIndex  ? 
                                      Color(0xff7bc144).withOpacity(0.1) : 
                                      Colors.white,
                            border: Border.all(  color: index== _selectedIndex  ? 
                                      Color(0xff7bc144) : 
                                      Colors.grey,),
                            borderRadius: BorderRadius.circular(8.0),
                          
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  formattedAddress,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.more_vert_sharp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                );
             

                
                }
              }
            ),
          ),
           
          SizedBox(height: 20.0),
          Visibility(
            visible: addressList.isNotEmpty,
            child: InkWell(
              onTap: () async {
                Navigator.push(context,MaterialPageRoute(builder: (context) =>  SelectAddress()),);
                },
              child: Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('+ Add New Address',style: TextStyle(color: Color.fromARGB(255, 123, 193, 68),fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                  ),
                ),
            ),
          ),
        ],
      ),   
        bottomNavigationBar: 
          
          Consumer<CartProvider>(builder: (context, value, child) {
            
          return
          Visibility(
            visible: value.getTotalPrice().toStringAsFixed(2) == "0.00" ? false : true,
            child: Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        _openRazorpayCheckout( context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 123, 193, 68),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                          ),
              
                         child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Continue',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 18,
                              )
                            ],
                         ),
                       
                     ),
                    ),  
                    ),
             );
             }
             )
    );
  }
}

class _Dot extends StatelessWidget {
  
  final bool active;

  const _Dot({
    
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    final color = active ? Color.fromARGB(255, 123, 193, 68) : Color.fromARGB(255, 212, 208, 208);
    return Column(
      children: [
        SizedBox(
          width: 22.0,
          height: 22.0,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle, 
              // color: color,
              border: Border.all(color: color,width: 2),
            ),
            child: Container(
              width: 1.0,
              height: 1.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color:Colors.white, width: 3),
                color: color,
              ),
            ),
          ),
        ),
        SizedBox(height: 5.0),
        
      ],
    );
  }
}
