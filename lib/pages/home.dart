//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiz_application/pages/question.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffedf3f6),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Stack(
          children: [
          // Bottom positioned container
          Positioned(
          bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 220,
                padding: EdgeInsets.only(left: 20.0,top: 15.0),
                decoration: BoxDecoration(
                  color: Color(0xFF2a2b31),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  ClipRRect(
                    borderRadius:BorderRadius.circular(60),
                      child: Image.asset("images/img1.jpg",
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,)),
                    SizedBox(width: 20.0,),
                    Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: Text("Ritu Sharma",
                          style:
                          TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    )
                ],
                ),
              ),
              ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.only(top: 120.0,left: 20.0,right: 20.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                      child: Image.asset("images/quiz.jpg")),
        
                  Text("Let's Revise!",
                      style:
                      TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ],
              ),
            )
        ]),
              SizedBox(height: 30.0,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
        
                  child: Text("Topics",
                    style:
                    TextStyle(
                        color: Colors.black,
                        fontSize: 23.0,
                        fontWeight: FontWeight.w500,
        
                    )
                              ),
                ),
              SizedBox(height: 20,),


              //1
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:
                      (context)=>Question(category: "Integration",)));
                    },
                    child: Material(
                    borderRadius: BorderRadius.circular(20),
                      elevation: 5,
                      child: Container(
                        width:150,
                        padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Image.asset("images/integration.png",
                                height: 100,width: 100,fit: BoxFit.cover,),
                              SizedBox(height: 20,),
                              Text("Integration",
                                  style:
                                  TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500,

                                  )
                              ),
                            ],
                          )),
                    ),
                  ),



                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:
                      (context) => Question(category: "Probability")));
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 5,
                      child: Container(
                          width:150,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Image.asset("images/probability.jpg",height: 100,width: 100,fit: BoxFit.cover,),
                              SizedBox(height: 20,),
                              Text("Probability",
                                  style:
                                  TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500,

                                  )
                              ),
                            ],
                          )),
                    ),
                  ),
        
        
                ],),
              ),
        
        SizedBox(height: 20,),

        //3
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context) => Question(category: "Derivatives")));
                },
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 5,
                  child: Container(
                      width:150,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Image.asset("images/derivative.jpg",height: 100,width: 100,fit: BoxFit.cover,),
                          SizedBox(height: 20,),
                          Text("Derivatives",
                              style:
                              TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w500,

                              )
                          ),
                        ],
                      )),
                ),
              ),


              //4
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context) => Question(category: "Statistics")));
                },
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 5,
                  child: Container(
                      width:150,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Image.asset("images/statistics.jpg",height: 100,width: 100,fit: BoxFit.cover,),
                          SizedBox(height: 20,),
                          Text("Statistics",
                              style:
                              TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w500,

                              )
                          ),
                        ],
                      )),
                ),
              ),
        
        
            ],),
        ),
        SizedBox(height: 20,),

        //5
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context) => Question(category: "Matrix")));
                },
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 5,
                  child: Container(
                      width:150,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Image.asset("images/matrix.png",height: 100,width: 100,fit: BoxFit.cover,),
                          SizedBox(height: 20,),
                          Text("Matrix",
                              style:
                              TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w500,

                              )
                          ),
                        ],
                      )),
                ),
              ),


              //6
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context) => Question(category: "Geometry")));
                },
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 5,
                  child: Container(
                      width:150,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Image.asset("images/geometry.webp",height: 100,width: 100,fit: BoxFit.cover,),
                          SizedBox(height: 20,),
                          Text("Geometry",
                              style:
                              TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w500,

                              )
                          ),
                        ],
                      )),
                ),
              ),
        
        
            ],),
        )
          ],
          ),
        ),
      ),
    );
  }
}
