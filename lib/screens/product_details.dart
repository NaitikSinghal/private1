import 'package:flutter/material.dart';
import 'package:gropare/screens/cart.dart';

class FruitDetailScreen extends StatefulWidget {
  // final String fruitName;
  // final String imageUrl;
  // final int quantity;
  // final double price;

  FruitDetailScreen(
    // required this.fruitName,
    // required this.imageUrl,
    // required this.quantity,
    // required this.price,
  );

  @override
  State<FruitDetailScreen> createState() => _FruitDetailScreenState();
}

class _FruitDetailScreenState extends State<FruitDetailScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

  
     
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child:
          AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.transparent,
            leading: Container(
              margin: EdgeInsets.all(12),
              child: IconButton(onPressed: null,
               icon:Icon(Icons.arrow_circle_left_outlined, 
               size: 16,
               color: Colors.white, )),
            ),
          ),
      ),
      
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        Expanded(
          flex: 11,
          child: 
          
            Container(
              // height: MediaQuery.of(context).size.height * 0.75,
              child: Image.network(
                // 'https://t3.ftcdn.net/jpg/01/35/43/34/240_F_135433448_OkyEF64sfB5O9Dw2ITvD63gql4OgEiXS.jpg',
                // 'https://img.freepik.com/premium-photo/bunches-green-bananas-growing-tropical-forest_407837-2267.jpg?w=2000',
                // 'https://images.unsplash.com/photo-1539808505172-71ad23d99b4a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmFuYW5hJTIwdHJlZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
                // 'https://www.tytyga.com/v/vspfiles/photos/FRUBAN-FRU-S-TX-STAR-2.jpg',
                // 'https://thisoldhouse.jppadmin.com/wp-content/uploads/sites/10/2022/05/AdobeStock_245734346.0-scaled.jpeg',
                'https://cdn.shopify.com/s/files/1/0059/8835/2052/files/FGT_banana-trees_480x480.jpg?v=1620744056',
                
                fit: BoxFit.cover,
              ),
            ),
          
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(left :10.0),
          child: Text(
            "Banana",
            
            style: TextStyle(
              
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left:10.0, right: 10.0),
          child: Row(
            children: [
              // SizedBox(width: 12,),
              Text(
                'Quantity',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                 'Price',
                //  \$${price.toStringAsFixed(2)}/dozen',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(height: 1),
        Expanded(
          child: 
            Padding(
              padding: const EdgeInsets.only(right:10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(//style: ButtonStyle(iconSize: MaterialStatePropertyAll(190)),
                    icon: Icon(Icons.remove_circle_outline_outlined, size: 33),
                    onPressed: () {
                         setState(() {
                          if(quantity >1){
                        quantity--;}
                      });
                     
                    },
                  ),
                  Text(
                    '$quantity',
                    // quantity.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(//style: ButtonStyle(iconSize: MaterialStatePropertyAll(19)),
                    icon: Icon(Icons.add_circle_outline, size: 33,),
                    onPressed: () {
                      setState(() {
                        if(quantity<10){
                        quantity++;}
                      });
                     
                    },
                  ),
                  Spacer(),
                  
                  Text(
                    '\u20B9 35/Dz', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )
                
                ],
              ),
            ),
          
        ),
        SizedBox(height: 1),
          Padding(
            padding: const EdgeInsets.only(left :10.0),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      // More details logic
                    },
                    child: Text(
                      'More Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
            ],),
          ),
        SizedBox(height: 10,),
        Row(
          children: [
            Expanded(
              child:
             Padding(
               padding: const EdgeInsets.only(left:10.0,bottom: 5),
               child: Container(
                height: 40,
                padding: EdgeInsets.symmetric(vertical: 6.0,horizontal: 12.0),
                 decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(8.0),
                 border: Border.all(color: Color.fromARGB(255, 123, 193, 68),),
                 ),
                 child: OutlinedButton(
                 onPressed: () {
                       // Buy now button logic
                   },
                      style: OutlinedButton.styleFrom(
                side: BorderSide.none,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                ),
                ),
                    child: Ink(
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      ),
                     child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 12.0),
                         child: Text(
                           'Buy Now',
                            style: TextStyle(color: Color.fromARGB(255, 123, 193, 68),
                            fontWeight: FontWeight.bold, fontSize: 20),
                             ),
                       ),
                    ),
                ),
               ),
             ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right:10.0,bottom: 5),
                child: Container(
                  height: 40,
                  
                  child: ElevatedButton(
                    
                    onPressed: () {
                      // Add button logic
                       Navigator.push(
                       context,
                       MaterialPageRoute(
                       builder: (context) => CartScreen(),
                      ),
                    );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Color.fromARGB(255, 123, 193, 68),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    ),
                    child: Text('Add', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                ),
              ),
            ),
          ],
        ),
      
        SizedBox(height: 8,)
      
      ],
        ),
    );
  }
}
