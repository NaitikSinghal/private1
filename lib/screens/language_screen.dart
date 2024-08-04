import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gropare/screens/phone_auth.dart';

import '../constt.dart';
import '../models/language_data.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25, top: 70),
        alignment: Alignment.topRight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/splashlogo.png',
                  height: 100,
                  width: 100,
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'Please select your language',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 5,),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'You can change the language anytime',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.justify,
                ),
              ),
               GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: languageItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  //childAspectRatio: 1.0
                ), 
                itemBuilder: (context, index) {
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
                    child: Card(
                      elevation: 0,
                      child: Container(
                        //height: 290,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: index== _selectedIndex  ? 
                                  Color(0xff7bc144).withOpacity(0.2) : 
                                  Colors.white,
                          border: Border.all(color: Colors.black,),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          //image: DecorationImage(image: NetworkImage(categoryItems[index].image), fit: BoxFit.contain),
                        ),
                        child: Column(
                          children: [
                              Align(
                              alignment: Alignment.topRight,
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: 

                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      
                                        // Color for selected card
                                      color: Colors.black, // Color for unselected cards
                                      width: 2,
                                    ),
                                 
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white,
                                      width:2.0,
                                      ),
                                      color: _selectedIndex == index 
                                      ? Colors.black : Colors.transparent
                                    ),
                                  ),
                                )
                              ),
                            ),
              
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                languageItems[index].l1,
                                style: TextStyle(color: Colors.black, fontSize: 20),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                languageItems[index].l2,
                                style: TextStyle(color: Colors.black, fontSize: 20),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                languageItems[index].l3,
                                style: TextStyle(color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                  height: 100,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 50,
                   child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 123, 193, 68),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>  MyPhone()),);
                    },
                    child: Text("PROCEED", style: kText1,)
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
            ],
          ),
        ),
      ),
    );
  }
}