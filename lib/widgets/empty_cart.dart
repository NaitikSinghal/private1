import 'package:flutter/material.dart';
import 'package:gropare/screens/menu_screen.dart';
import 'package:gropare/widgets/bottom_appbar.dart';

class emptycart extends StatelessWidget {
  const emptycart({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // Container(
        //   height: 100,width: 100,
        //   child: 
        //   Image.asset(
        //   'assets/emptycart.jpeg', 
        //   fit:BoxFit.cover,)
        //   )
        children: [
          
            Image.asset('assets/emptycart.jpeg',fit:BoxFit.contain,),
          SizedBox(height: 20,),
          Text('Your Cart is empty',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          SizedBox(height: 10,),
          Text('Looks like you have not added ',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 10),),
          Text('anything to your cart yet.',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 10),),
          SizedBox(height: 30,),
          OutlinedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MenuScreen(),));
          }, 
          child: Text('Start Shopping', style: TextStyle(fontSize: 20,color:Color.fromARGB(255, 123, 193, 68), ),))
        ],
      ),
      bottomNavigationBar: bottom_appbar(),
    );
  }
}