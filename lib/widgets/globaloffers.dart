import 'package:flutter/material.dart';

class globaloffers extends StatelessWidget {
  const globaloffers({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
               
                itemBuilder: (context,index) {
                return
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          //Horizontally Card Image 1
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 8),
                            width: 210,
                            child: Card(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                    'assets/ad4.jpg',
                                    fit: BoxFit.cover,
                                  ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          //Horizontally Card Image 2
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            width: 210,
                            child: Card(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                    'assets/ad3.jpg',
                                    fit: BoxFit.cover,
                                  ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                            ),
                          ),
                          //Horizontally Card Image 3
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            width: 210,
                            child: Card(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                    'assets/ad1.jpg',
                                    fit: BoxFit.cover,
                                  ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            width: 210,
                            child: Card(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                    'assets/ad2.jpg',
                                    fit: BoxFit.cover,
                                  ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            width: 210,
                            child: Card(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                    'assets/ad3.jpg',
                                    fit: BoxFit.cover,
                                  ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            width: 210,
                            child: Card(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                    'assets/ad4.jpg',
                                    fit: BoxFit.cover,
                                  ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        
                        ],
                      )
                    ),
                   
                  ],
                );
              },
        
        
                
        
              );
  }
}