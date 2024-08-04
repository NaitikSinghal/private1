import 'package:flutter/material.dart';

class offerslist extends StatelessWidget {
  const offerslist({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  //Horizontally Card Image 1
        
                  //Horizontally Card Image 2
                  Container(
                  padding: EdgeInsets.only(right: 3),
                  width: 110,
                  height: 120,
                  child: Card(
                      child: Stack(
                        fit:  StackFit.expand,
                          children: [
                           ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                             child: Image.asset(
                              'assets/offer3.jpg',
                               fit: BoxFit.cover,
                              ),
                            ),
                          Container(
                            decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(6),
                           color: Colors.black.withOpacity(0.4),
                               ),
                           child: Center(
                                 child: Text(
                                   '60% OFF',
                                   style: TextStyle(
                                    color: Colors.white,
                                   fontSize: 16,
                                   fontWeight: FontWeight.bold,
                                    ),
                                 ),
                               ),
                             ),
                         ],
                        ),
                        shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(6.0),
                        ),
                   ),
              ),       
                  Container(
                  padding: EdgeInsets.only(right: 3),
                  width: 110,
                  height: 110,
                  child: Card(
                      child: Stack(
                        fit:  StackFit.expand,
                          children: [
                           ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                             child: Image.asset(
                              'assets/offer2.jpg',
                               fit: BoxFit.cover,
                              ),
                            ),
                          Container(
                            decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(6),
                           color: Colors.black.withOpacity(0.4),
                               ),
                           child: Center(
                                 child: Text(
                                   '40% OFF',
                                   style: TextStyle(
                                    color: Colors.white,
                                   fontSize: 16,
                                   fontWeight: FontWeight.bold,
                                    ),
                                 ),
                               ),
                             ),
                         ],
                        ),
                        shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(6.0),
                        ),
                   ),
              ),
        
                  Container(
                  padding: EdgeInsets.only(right: 3),
                  width: 110,
                  height: 110,
                  child: Card(
                      child: Stack(
                        fit:  StackFit.expand,
                          children: [
                           ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                             child: Image.asset(
                              'assets/offer4.jpg',
                               fit: BoxFit.cover,
                              ),
                            ),
                          Container(
                            decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(6),
                           color: Colors.black.withOpacity(0.4),
                               ),
                           child: Center(
                                 child: Text(
                                   '30% OFF',
                                   style: TextStyle(
                                    color: Colors.white,
                                   fontSize: 16,
                                   fontWeight: FontWeight.bold,
                                    ),
                                 ),
                               ),
                             ),
                         ],
                        ),
                        shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(6.0),
                        ),
                   ),
              ),               
                  Container(
                  padding: EdgeInsets.only(right: 3),
                  width: 110,
                  height: 110,
                  child: Card(
                      child: Stack(
                        fit:  StackFit.expand,
                          children: [
                           ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                             child: Image.asset(
                              'assets/offer4.jpg',
                               fit: BoxFit.cover,
                              ),
                            ),
                          Container(
                            decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(6),
                           color: Colors.black.withOpacity(0.4),
                               ),
                           child: Center(
                                 child: Text(
                                   '20% OFF',
                                   style: TextStyle(
                                    color: Colors.white,
                                   fontSize: 16,
                                   fontWeight: FontWeight.bold,
                                    ),
                                 ),
                               ),
                             ),
                         ],
                        ),
                        shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(6.0),
                        ),
                   ),
              ),               
                  Container(
                  padding: EdgeInsets.only(right: 3),
                  width: 110,
                  height: 110,
                  child: Card(
                      child: Stack(
                        fit:  StackFit.expand,
                          children: [
                           ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                             child: Image.asset(
                              'assets/offer3.jpg',
                               fit: BoxFit.cover,
                              ),
                            ),
                          Container(
                            decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(6),
                           color: Colors.black.withOpacity(0.4),
                               ),
                           child: Center(
                                 child: Text(
                                   '10% OFF',
                                   style: TextStyle(
                                    color: Colors.white,
                                   fontSize: 16,
                                   fontWeight: FontWeight.bold,
                                    ),
                                 ),
                               ),
                             ),
                             
                         ],
                        ),
                        shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(6.0),
                        ),
                   ),
              ),                
                  Container(
                  padding: EdgeInsets.only(right: 3),
                  width: 110,
                  height: 110,
                  child: Card(
                      child: Stack(
                        fit:  StackFit.expand,
                          children: [
                           ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                             child: Image.asset(
                              'assets/offer4.jpg',
                               fit: BoxFit.cover,
                              ),
                            ),
                          Container(
                            decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(6),
                           color: Colors.black.withOpacity(0.4),
                               ),
                           child: Center(
                                 child: Text(
                                   '50% OFF',
                                   style: TextStyle(
                                    color: Colors.white,
                                   fontSize: 16,
                                   fontWeight: FontWeight.bold,
                                    ),
                                 ),
                               ),
                             ),
                         ],
                        ),
                        shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(6.0),
                        ),
                   ),
              ),                 
                   Container(
                  padding: EdgeInsets.only(right: 3),
                  width: 110,
                  height: 110,
                  child: Card(
                      child: Stack(
                        fit:  StackFit.expand,
                          children: [
                           ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                             child: Image.asset(
                              'assets/offer3.jpg',
                               fit: BoxFit.cover,
                              ),
                            ),
                          Container(
                            decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(6),
                           color: Colors.black.withOpacity(0.4),
                               ),
                           child: Center(
                                 child: Text(
                                   '40% OFF',
                                   style: TextStyle(
                                    color: Colors.white,
                                   fontSize: 16,
                                   fontWeight: FontWeight.bold,
                                    ),
                                 ),
                               ),
                             ),
                         ],
                        ),
                        shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(6.0),
                        ),
                   ),
              ),
                ]
              );
              
  }
}