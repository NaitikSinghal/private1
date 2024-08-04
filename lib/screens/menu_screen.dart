import 'package:flutter/material.dart';
import 'package:gropare/screens/product_list.dart';
import 'package:gropare/widgets/bottom_appbar.dart';
import 'package:gropare/widgets/globaloffers.dart';
import 'package:gropare/widgets/offers_list.dart';
import '../view/my_account.dart';
import '../widgets/navBar/drawer.dart';


class MenuScreen extends StatefulWidget {
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  
  
 

  @override
  Widget build(BuildContext context) {
    // bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
    
     backgroundColor: Colors.white,
     bottomNavigationBar: bottom_appbar(),
      appBar: AppBar(
        
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 40, // Changing Drawer Icon Size
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
            },
          ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 123, 193, 68),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14, bottom: 10),
            child: Row(
              children: [
                SizedBox(width: 16),
                IconButton(onPressed: null, icon: Icon(
                  Icons.language_sharp,
                  color: Colors.white,
                  size:40,
                )),
                // User Profile Icon

                IconButton(
                        icon: const Icon(
                          Icons.account_circle_sharp,
                          color: Colors.white,
                          size: 40, // Changing Drawer Icon Size
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyAccount()),);
                          //Scaffold.of(context).openDrawer();
                        },
                        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                )
              ],
            ),
          )
        ],

        centerTitle: true,
      ),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          child: Column(  
            children: [
              
               buildSearchWidget(),
            
              Container(
                margin: EdgeInsets.only(top: 5.0, bottom: 0),
                height: 140,
                child: globaloffers(),
                
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [
              
                  Container(
                    margin: EdgeInsets.only(left: 14),
                    child: Text(
                      'Top Offers', 
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  
                    Padding(
                      padding: const EdgeInsets.only(right:6.0),
                      child: TextButton(onPressed: null, 
                       child: 
                        Text("See all",
                        style: TextStyle(color: Color.fromARGB(255, 123, 193, 68),
                        fontSize: 18
                          ),
                        )
                                    ),
                    )
               
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: .0, top : 2,left: 12),
                height: 80,
                
                child: offerslist(),
              ),
                               
                 Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Padding(padding: EdgeInsets.only(left: 14,right: 14)),
                  Container(
                    margin: EdgeInsets.only(left: 14),
                    child: Text(
                      'Our Products', 
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
          
          
                  TextButton(onPressed: null, 
                  child: 
                     Padding(padding: EdgeInsets.only(right: 6),
                     child: 
          
                      Text("See all",
                      style: TextStyle(color: Color.fromARGB(255, 123, 193, 68),
                      fontSize: 18
                        ),
                      )
                  )
          
          
                )
            
                ],
              ),
          
              SizedBox(
                height: 7,
              ),
                
              Container(
                
                child: ProductListScreen()),
        
        
                
          
                
          
            ],
          ),
          
        ),
        
      ),
          
    
      );
    
  }
}





Widget  buildSearchWidget(){
  return Container(
    
    margin: EdgeInsets.only(bottom:10, top:20, left: 14, right: 14),
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(10),
        color: Colors.white,
        border: Border(
          left: BorderSide(width: 1.0, color: Colors.grey),
          right: BorderSide(width: 1.0, color:  Colors.grey),
          top: BorderSide(width: 1.0, color: Colors.grey),
          bottom: BorderSide(width: 1.0, color:  Colors.grey),
        ),
        // borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color:Colors.black45.withOpacity(0.5),
              blurRadius: 2,
              spreadRadius: 0.0,
              offset: Offset(1.5, 1.0),
          )
        ]
      ),
      child: Row(
        children: [
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text('Search', style: TextStyle(
              color: Colors.black87
            ),),
          ),
          Icon(Icons.search_outlined),
          SizedBox(width: 16)
        ],
      ),
  );
}

