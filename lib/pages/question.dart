// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:quiz_application/service/database.dart';
//
//
// class Question extends StatefulWidget {
//
//   String category;
//   Question({required this.category});
//
//   @override
//   State<Question> createState() => _QuestionState();
// }
//
// class _QuestionState extends State<Question> {
//
//   bool show=false;
//
//   getontheload()async{
//     quizStream=await DatabaseMethods().getCategoryQuiz(widget.category);
//     setState(() {
//
//     });
//   }
//
//   @override
//   void initState() {
//
//     super.initState();
//     getontheload();
//   }
//
//   // Stream? QuizStream;
//   Stream? quizStream;
//
//   PageController controller =PageController();
//
//   Widget allQuiz(){
//
//     return StreamBuilder(
//       stream : quizStream,
//       builder: (context,AsyncSnapshot snapshot){
//
//         return snapshot.hasData?
//         PageView.builder(
//             controller: controller,
//             itemBuilder:(context,index){
//               itemCount:snapshot.data.docs.length;
//               itemBuilder:(context,index){
//                 DocumentSnapshot ds=snapshot.data.docs[index];
//                 return Expanded(
//                   child: Container(
//
//                     width: MediaQuery.of(context).size.width,
//                     decoration:BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(30),
//                             topRight: Radius.circular(32))) ,
//                     child: Column(
//                       children: [
//                         Padding(
//                             padding: EdgeInsets.only(left: 20,right: 20,top: 48),
//                             child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(20),
//                                 child: Image.network(
//                                   ds["Image"],
//                                   height: 150,
//                                   width: MediaQuery.of(context).size.width,))),
//
//                         SizedBox(height: 20,),
//
//                         GestureDetector(
//                           onTap: (){
//                             show=true;
//                             setState(() {
//
//                             });
//                           },
//                           child:show?Container(
//                             width: MediaQuery. of (context).size.width,
//                             padding: EdgeInsets.all(15),
//                             decoration: BoxDecoration (
//                                 border: Border.all(
//                                     color:ds["correct"]==ds["option1"] ? Colors.green : Colors.red,width:1.5),
//                                 borderRadius: BorderRadius.circular(20)),
//                             child: Text(
//                               ds["option1"],
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500
//                               ),
//                             ),
//                           ): Container(
//                             width: MediaQuery. of (context).size.width,
//                             padding: EdgeInsets.all(15),
//                             decoration: BoxDecoration (
//                                 border: Border.all(
//                                     color: Color (0xFF818181),width:1.5),
//                                 borderRadius: BorderRadius.circular(20)),
//                             child: Text(
//                               ds["option1"],
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 20,),
//
//                         GestureDetector(
//                           onTap: (){
//                             show=true;
//                             setState(() {
//
//                             });
//                           },
//                           child:show?Container(
//                             width: MediaQuery. of (context).size.width,
//                             padding: EdgeInsets.all(15),
//                             decoration: BoxDecoration (
//                                 border: Border.all(
//                                     color:ds["correct"]==ds["option2"] ? Colors.green : Colors.red,width:1.5),
//                                 borderRadius: BorderRadius.circular(20)),
//                             child: Text(
//                               ds["option2"],
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500
//                               ),
//                             ),
//                           ): Container(
//                             width: MediaQuery. of (context).size.width,
//                             padding: EdgeInsets.all(15),
//                             decoration: BoxDecoration (
//                                 border: Border.all(
//                                     color: Color (0xFF818181),width:1.5),
//                                 borderRadius: BorderRadius.circular(20)),
//                             child: Text(
//                               ds["option2"],
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500
//                               ),
//                             ),
//                           ),
//                         ),
//
//
//                         SizedBox(height: 20,),
//
//
//                         GestureDetector(
//                           onTap: (){
//                             show=true;
//                             setState(() {
//
//                             });
//                           },
//                           child:show?Container(
//                             width: MediaQuery. of (context).size.width,
//                             padding: EdgeInsets.all(15),
//                             decoration: BoxDecoration (
//                                 border: Border.all(
//                                     color:ds["correct"]==ds["option3"] ? Colors.green : Colors.red,width:1.5),
//                                 borderRadius: BorderRadius.circular(20)),
//                             child: Text(
//                               ds["option3"],
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500
//                               ),
//                             ),
//                           ): Container(
//                             width: MediaQuery. of (context).size.width,
//                             padding: EdgeInsets.all(15),
//                             decoration: BoxDecoration (
//                                 border: Border.all(
//                                     color: Color (0xFF818181),width:1.5),
//                                 borderRadius: BorderRadius.circular(20)),
//                             child: Text(
//                               ds["option3"],
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500
//                               ),
//                             ),
//                           ),
//                         ),
//
//
//                         SizedBox(height: 20,),
//
//
//                         GestureDetector(
//                           onTap: (){
//                             show=true;
//                             setState(() {
//
//                             });
//                           },
//                           child:show?Container(
//                             width: MediaQuery. of (context).size.width,
//                             padding: EdgeInsets.all(15),
//                             decoration: BoxDecoration (
//                                 border: Border.all(
//                                     color:ds["correct"]==ds["option4"] ? Colors.green : Colors.red,width:1.5),
//                                 borderRadius: BorderRadius.circular(20)),
//                             child: Text(
//                               ds["option4"],
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500
//                               ),
//                             ),
//                           ): Container(
//                             width: MediaQuery. of (context).size.width,
//                             padding: EdgeInsets.all(15),
//                             decoration: BoxDecoration (
//                                 border: Border.all(
//                                     color: Color (0xFF818181),width:1.5),
//                                 borderRadius: BorderRadius.circular(20)),
//                             child: Text(
//                               ds["option4"],
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500
//                               ),
//                             ),
//                           ),
//                         ),
//
//
//                       ],
//                     ),
//                   ),
//                 );
//
//
//               };
//             }):Container();
//             });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color (0xFF004840),
//       body: Container (
//
//         child: Column (children: [
//       Padding(
//         padding: EdgeInsets.only(left: 20,top: 50),
//         child: Row(
//           children: [
//         GestureDetector(
//           onTap: (){
//             Navigator.pop(context);
//           },
//           child: Container(
//             padding: EdgeInsets.all(6),
//             decoration: BoxDecoration(color: Color(0xFFf35b32),borderRadius: BorderRadius.circular(20)),
//               child: Center(
//                   child: Icon (
//                     Icons.arrow_back_ios,
//                     color: Colors.white,
//                   ))),
//         ),
//           SizedBox(width: 100,),
//           Text(
//             widget.category,
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold),)
//           ],),
//       ) ,
//           SizedBox(height: 20,),
//           Expanded(child: allQuiz()),
//
//       ],
//         ),
//       ), // Column // Container// Scaffold
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:quiz_application/service/database.dart';
//
// class Question extends StatefulWidget {
//   final String category;
//
//   Question({required this.category});
//
//   @override
//   State<Question> createState() => _QuestionState();
// }
//
// class _QuestionState extends State<Question> {
//   late Stream<QuerySnapshot> quizStream;
//   final PageController controller = PageController();
//
//   @override
//   void initState() {
//     super.initState();
//     initializeQuizStream();
//   }
//
//   void initializeQuizStream() async {
//     // Retrieve the future that resolves to a stream of query snapshots
//     Future<Stream<QuerySnapshot<Object?>>> quizStreamFuture =
//     DatabaseMethods().getCategoryQuiz(widget.category);
//
//     // Await the completion of the future to get the stream
//     Stream<QuerySnapshot<Object?>> stream = await quizStreamFuture;
//
//     // Set the initialized stream to the quizStream state variable
//     setState(() {
//       quizStream = stream;
//     });
//   }
//
//   Widget buildOption(String optionText, bool isCorrect) {
//     bool isSelected = false;
//     return GestureDetector(
//       onTap: () {
//         // Handle option selection logic here
//         setState(() {
//           isSelected = !isSelected;
//
//           // Check if the selected option is correct
//           if (isSelected) {
//             if (isCorrect) {
//               // Selected option is correct
//               print('Correct answer selected!');
//               // You can add any other logic here for correct selection
//             } else {
//               // Selected option is incorrect
//               print('Incorrect answer selected!');
//               // You can add any other logic here for incorrect selection
//             }
//           }
//         });
//       },
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         padding: EdgeInsets.all(15),
//         decoration: BoxDecoration(
//           border: Border.all(
//              //color: isCorrect ? Colors.green : Colors.red,
//             color: isSelected ? (isCorrect ? Colors.green : Colors.red) : Color(0xFF818181),
//             width: 1.5,
//           ),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Text(
//           optionText,
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildQuizCard(DocumentSnapshot ds) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(32),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(left: 20, right: 20, top: 48),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Image.network(
//                 ds["Image"],
//                 height: 150,
//                 width: MediaQuery.of(context).size.width,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           buildOption(ds["option1"], ds["correct"] == ds["option1"]),
//           SizedBox(height: 20),
//           buildOption(ds["option2"], ds["correct"] == ds["option2"]),
//           SizedBox(height: 20),
//           buildOption(ds["option3"], ds["correct"] == ds["option3"]),
//           SizedBox(height: 20),
//           buildOption(ds["option4"], ds["correct"] == ds["option4"]),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF004840),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(left: 20, top: 20),
//               child: Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Container(
//                       padding: EdgeInsets.all(6),
//                       decoration: BoxDecoration(
//                         color: Color(0xFFf35b32),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Icon(
//                         Icons.arrow_back_ios,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 20),
//                   Text(
//                     widget.category,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: StreamBuilder(
//                 stream: quizStream,
//                 builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   }
//
//                   if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                     return Center(child: Text('No data available'));
//                   }
//
//                   return PageView.builder(
//                     controller: controller,
//                     itemCount: snapshot.data!.docs.length,
//                     itemBuilder: (context, index) {
//                       DocumentSnapshot ds = snapshot.data!.docs[index];
//                       return buildQuizCard(ds);
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_application/service/database.dart';

class Question extends StatefulWidget {
  final String category;

  Question({required this.category});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  late Stream<QuerySnapshot<Object?>> quizStream;
  int selectedOptionIndex = -1; // Track the selected option index, -1 means no selection

  @override
  void initState() {
    super.initState();
    initializeQuizStream();
  }

  void initializeQuizStream() async {
    quizStream = await DatabaseMethods().getCategoryQuiz(widget.category);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF004840),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Color(0xFFf35b32),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    widget.category,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: quizStream,
                builder: (context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text('No quiz data available'));
                  }

                  return PageView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot<Object?> ds = snapshot.data!.docs[index];
                      return buildQuizCard(ds);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQuizCard(DocumentSnapshot<Object?> ds) {
    List<String> options = [
      ds["option1"],
      ds["option2"],
      ds["option3"],
      ds["option4"],
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(32),
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 30,right: 30,top: 50),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    ds["Image"],
                    height: 150,
                    width: MediaQuery.of(context).size.width,))),
          SizedBox(height: 30),
          Column(
            children: List.generate(options.length, (optionIndex) {
              bool isCorrect = ds["correct"] == options[optionIndex];
              bool isSelected = selectedOptionIndex == optionIndex;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    // Toggle selected option index
                    selectedOptionIndex = optionIndex;
                  });
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected
                          ? (isCorrect ? Colors.green : Colors.red)
                          : Color(0xFF818181),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    options[optionIndex],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
