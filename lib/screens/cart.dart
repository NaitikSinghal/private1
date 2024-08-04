// import 'dart:ffi';
import 'package:gropare/models/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:gropare/models/db_helper.dart';
import 'package:gropare/screens/checkout_screen.dart';
import 'package:gropare/widgets/bottom_appbar.dart';
import 'package:gropare/widgets/empty_cart.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../models/cart_model.dart';
import 'menu_screen.dart';


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


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart  = Provider.of<CartProvider>(context);
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
              title: Text('Cart',
              style: TextStyle(color: Colors.black,
              fontSize: 25 ),),
            
              
            ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left:10.0,right:10,top:10),
        child: Container(
          height:height,
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future:cart.getData() ,
                    builder: (context , AsyncSnapshot<List<Cart>> snapshot){
                    if(snapshot.hasData){
                      
                      if(snapshot.data!.isEmpty ){
                      return  Column(
                        
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 130,),
                        Image.asset('assets/emptycart.jpeg',fit:BoxFit.cover,),
                        SizedBox(height: 20,),
                        Text('Your Cart is empty',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),),
                        SizedBox(height: 10,),
                        Text('Looks like you have not added ',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15),),
                        Text('anything to your cart yet.',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15),),
                        SizedBox(height: 40,),
                        OutlinedButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MenuScreen(),));
                        },
                        style: OutlinedButton.styleFrom(
                          fixedSize: Size(220, 50),
                          side: BorderSide(color: Color.fromARGB(255, 123, 193, 68),),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          
                        ), 
                        child: Text('Start Shopping', style: TextStyle(fontSize: 23,color:Color.fromARGB(255, 123, 193, 68), ),)),
                      
                      SizedBox(height : 130)
                      
                        
                      ],
                                        );  
                      }else {
                        return ListView.builder(

                          physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context,index){
                              return
                               Card(
                                  elevation: 1,
                                  child: Container(
                                    height: 90,
                                    padding: EdgeInsets.all(4),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 70,
                                          height: 70,
                                          child: Image(
                                            image: NetworkImage(snapshot.data![index].image.toString()),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(snapshot.data![index].productName.toString(), 
                                              style: TextStyle(fontSize: 20),),
                                              SizedBox(height: 3),
                                              Text('Quantity :' + snapshot.data![index].quantity.toString(),
                                              style: TextStyle(fontSize: 13)),
                                              SizedBox(height:3),
                                              Text(snapshot.data![index].productdesc.toString(),
                                              style: TextStyle(fontSize: 12)),
                                              SizedBox(height: 3),
                                              Text("₹"+ snapshot.data![index].productPrice.toString(),
                                              style: TextStyle(fontSize: 12)),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        
                                        Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                alignment: Alignment.topRight,
                                                icon: Icon(Icons.cancel),
                                                onPressed: () {
                                                  // Handle cancel button press
                                                  dbHelper!.delete(snapshot.data![index].id!);
                                                  cart.removeTotalPrice(double.parse(snapshot.data![index].productPrice.toString()));
                                                },
                                              ),
                                              
                                          
                                              Container(
                                              // width: 20,
                                                height: 28,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(255, 152, 243, 149),
                                                  borderRadius: BorderRadius.circular(15),
                              
                                                ) ,
                                                child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        IconButton(
                                                          icon: Icon(Icons.remove),
                                                          iconSize: 14,
                                                          color: Colors.black,
                                                          onPressed: () {
                                                              int quantity =  snapshot.data![index].quantity! ;
                                                              int price = snapshot.data![index].initialPrice!;
                                                              quantity--;
                                                              int? newPrice = price * quantity ;
                                                              if(quantity > 0){
                                                                dbHelper!.updateQuantity(
                                                                    Cart(
                                                                        id: snapshot.data![index].id!,
                                                                        productId: snapshot.data![index].id!.toString(),
                                                                        productName: snapshot.data![index].productName!,
                                                                        initialPrice: snapshot.data![index].initialPrice!,
                                                                        productPrice: newPrice,
                                                                        quantity: quantity,
                                                                        unitTag: snapshot.data![index].unitTag.toString(),
                                                                        image: snapshot.data![index].image.toString(),
                                                                        productdesc: snapshot.data![index].productdesc.toString())
                                                                ).then((value){
                                                                  newPrice = 0 ;
                                                                  quantity = 0;
                                                                  cart.removeTotalPrice(double.parse(snapshot.data![index].initialPrice!.toString()));
                                                                }).onError((error, stackTrace){
                                                                  print(error.toString());
                                                                });                                                                                                                   
                                                            // Handle decrease quantity button press
                                                          };
                                                          },
                                                        ),
                                                        Text(snapshot.data![index].quantity.toString(), style: TextStyle(color: Colors.black)),
                                                        IconButton(
                                                          icon: Icon(Icons.add),
                                                          iconSize: 14,
                                                          color: Colors.black,
                                                          onPressed: () {
                                                              int quantity =  snapshot.data![index].quantity! ;
                                                              int price = snapshot.data![index].initialPrice!;
                                                              quantity++;
                                                              int? newPrice = price * quantity ;
                                                                if(quantity > 0){
                                                                dbHelper!.updateQuantity(
                                                                    Cart(
                                                                        id: snapshot.data![index].id!,
                                                                        productId: snapshot.data![index].id!.toString(),
                                                                        productName: snapshot.data![index].productName!,
                                                                        initialPrice: snapshot.data![index].initialPrice!,
                                                                        productPrice: newPrice,
                                                                        quantity: quantity,
                                                                        unitTag: snapshot.data![index].unitTag.toString(),
                                                                        image: snapshot.data![index].image.toString(),
                                                                        productdesc: snapshot.data![index].productdesc.toString()),
                                                                ).then((value){
                                                                  newPrice = 0 ;
                                                                  quantity = 0;
                                                                  cart.addTotalPrice(double.parse(snapshot.data![index].initialPrice!.toString()));
                                                                }).onError((error, stackTrace){
                                                                  print(error.toString());
                                                                });                                                                                                                   
                                                            // Handle decrease quantity button press
                                                          };                                                    
                                                            // Handle increase quantity button press
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                              ),
                                            ],
                                          ),
                                        
                                              ],
                                            ),
                                          ),
                                          );
                            });
        
        
        
                      }
                      
                    }
                  return Text('') ;
                }),
              ),
          
              // SizedBox(height: 1,),
          
              Container(
                child: Consumer<CartProvider>(builder: (context,value,child){
                  
                  return Visibility(
                     visible: value.getTotalPrice().toStringAsFixed(2) == "0.00" ? false : true,
                    child: 
                              Row(
                      children: [
                        IconButton(onPressed: (){}, 
                        icon: Icon(Icons.add),),
                        Text('Add more Items'),
                          
                      ],
                              ),
                              //SizedBox(height: 2),
                  );
                
                }),
              ),
          
          
              Container(
                child: Consumer<CartProvider>(builder: (context, value, child){
                   CartProvider cartProvider = Provider.of<CartProvider>(context, listen: false);
                   double totalPrice = cartProvider.totalPrice;
                   double grandTotal = totalPrice +40.00 ;

                  return Visibility(
                    visible: value.getTotalPrice().toStringAsFixed(2) == "0.00" ? false : true,
                    child: Card(
                       elevation: 4,
                      shape: ContinuousRectangleBorder(borderRadius: BorderRadiusDirectional.circular(30),
                      side: BorderSide(color: Color.fromARGB(255, 150, 144, 144),
                      style: BorderStyle.solid),),
                
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Payment Details', style: TextStyle(fontWeight: FontWeight.bold), ),
                            SizedBox(height: 8,),
                            ReusableWidget(title: 'Item Total', value: r'₹'+value.getTotalPrice().toStringAsFixed(2),),
                            ReusableWidget(title: 'Delivery Charges', value: r'₹'+'40',),
                             ReusableWidget(title: 'Grand Total (Including GST)*', value: r'₹'+grandTotal.toString(),)
                            
                          ],
                        ),
                      ),
                    ),
                  );
                  
                }),
              ),
              SizedBox(height: 18),
          
                

              Container(
                padding: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Consumer<CartProvider>(builder: (context, value, child){
                  return Visibility(
                    visible: value.getTotalPrice().toStringAsFixed(2) == "0.00" ? false : true,
                    child: Container(child: Text('You might also need', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))));
                }
              ),
                ),
                

              SizedBox(height: 18),
              Container(
              child: Consumer<CartProvider>(builder: (context, value, child) {
                return Visibility(
                visible: value.getTotalPrice().toStringAsFixed(2) == "0.00" ? false : true,
                child: Container(               
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                    _buildFruitCard('https://gropare-inventory-images.s3.ap-south-1.amazonaws.com/vJ7UJZI.jpeg', 'Mango'),
                    _buildFruitCard('https://gropare-inventory-images.s3.ap-south-1.amazonaws.com/m3uuUQB.jpeg', 'Pineapple'),
                    _buildFruitCard('https://gropare-inventory-images.s3.ap-south-1.amazonaws.com/cXrpzNE.jpeg', 'kiwi'),
                    _buildFruitCard('https://gropare-inventory-images.s3.ap-south-1.amazonaws.com/TixyZRh.jpeg', 'apple'),
                    _buildFruitCard('https://gropare-inventory-images.s3.ap-south-1.amazonaws.com/3HwAfgQ.jpeg', 'Banana'),
                      
                  ],
                  ),
                 )
                );
              }
             )
          ),    

            ],
          ),
        ),
      ) ,
    
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
                // _openRazorpayCheckout( context);
                         Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen()),);
                
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
                    'Checkout',
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


class ReusableWidget extends StatelessWidget {
  final String title , value ;
  const ReusableWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title , style: TextStyle(fontWeight: FontWeight.normal)),
          Text(value.toString() , style:TextStyle(fontWeight: FontWeight.normal))
        ],
      ),
    );
  }
}

  Widget _buildFruitCard(String imagePath, String fruitName) {
  return Container(
    width: 120,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(8),
        side: BorderSide(
          color: Color.fromARGB(255, 156, 147, 147)
        )
      ),
      child: Column(
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: Image(
              image: NetworkImage(imagePath),
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 8),
          Text(fruitName),
        ],
      ),
    ),
  );
}
