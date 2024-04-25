import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/material/dropdown.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_application/service/database.dart';
import 'package:random_string/random_string.dart';

class AddQuiz extends StatefulWidget {
  const AddQuiz({super.key});

  @override
  State<AddQuiz> createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {

  final ImagePicker _picker=ImagePicker();
  File? selectedImage ;



  Future getImage() async{
    var image=await _picker.pickImage(source: ImageSource.gallery);
    selectedImage=File(image!.path);
    setState(() {

    });
  }

  uploadItem() async{
    if(selectedImage!=null &&
        option1controller.text!="" &&
        option2controller.text!="" &&
        option3controller.text!="" &&
        option4controller.text!="" 
        ){
      String addId = randomAlphaNumeric(10);
      Reference firebaseStorageRef = FirebaseStorage.instance.ref().child("blogImage").child(addId);
      //Reference firebaseStorageRef = FirebaseStorage.instance.ref().child("blogImage").child(addId);


      final UploadTask task =firebaseStorageRef.putFile(selectedImage!);

      var downloadUrl = await(await task).ref.getDownloadURL();
      Map<String,dynamic> addQuiz={
        "Image":downloadUrl,
        "option1":option1controller.text,
        "option2":option2controller.text,
        "option3":option3controller.text,
        "option4":option4controller.text,
        "correct":correctcontroller.text,
      };


      await DatabaseMethods().addQuizCategory(addQuiz, value!).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content:
        Text("Test has been added successfully !",
        style: TextStyle(

          fontSize:18 ,

        ),)));
      });
    }
  }
  String? value;
final List<String>  quizitems=['Integration','Probability','Derivatives','Statistics','Matrix','Geometry'];


  TextEditingController option1controller = new TextEditingController();
  TextEditingController option2controller = new TextEditingController();
  TextEditingController option3controller = new TextEditingController();
  TextEditingController option4controller = new TextEditingController();
  TextEditingController correctcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Add quiz",style:
          TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the previous screen or a specific screen
            //Navigator.pop(context); // This will pop the current route off the navigator
            // If you want to navigate to a specific route/screen, you can use:
            print("Back arrow pressed");
            Navigator.pushReplacementNamed(context, '/AdminLogin');
            // Replace '/routeName' with the name of the route/screen you want to navigate to.
          },

        ),
      ),


      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0,bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text("Create your test !!",
            style: TextStyle(
              color: Colors.black,
              fontSize:18.0,
              fontWeight: FontWeight.w700,
          ),),
            SizedBox(height: 20.0,),
            selectedImage==null? GestureDetector(
              onTap: (){
                getImage();
              },
              child: Center(
                child: Material(
                  elevation: 40.0,
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width: 1.5),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Icon(Icons.camera_alt_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ):Center(
              child: Material(
                elevation: 40.0,
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width: 1.5),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(
                      selectedImage!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
              SizedBox(height: 20.0,),
              Text("Option 1",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),),
              SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),borderRadius: BorderRadius.circular(20),
                ),
        
                child: TextField(
                  controller: option1controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Option 1",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    )
                  )
                ),
              ),
        
              SizedBox(height: 20.0,),
              Text("Option 2",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),),
              SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),borderRadius: BorderRadius.circular(20),
                ),
        
                child: TextField(
                    controller: option2controller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Option 2",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        )
                    )
                ),
              ),
        
              SizedBox(height: 20.0,),
              Text("Option 3",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),),
              SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),borderRadius: BorderRadius.circular(20),
                ),
        
                child: TextField(
                    controller: option3controller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Option 3",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        )
                    )
                ),
              ),
        
              SizedBox(height: 20.0,),
              Text("Option 4",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),),
              SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),borderRadius: BorderRadius.circular(20),
                ),
        
                child: TextField(
                    controller: option4controller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Option 4",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        )
                    )
                ),
              ),
        
              SizedBox(height: 20.0,),
              Text("Correct Answer",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),),
              SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),borderRadius: BorderRadius.circular(20),
                ),
        
                child: TextField(
                    controller: correctcontroller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Correct Answer",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        )
                    )
                ),
              ),
              SizedBox(height: 30.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(child: DropdownButton<String>(items:quizitems.map((item) =>
                    DropdownMenuItem(value:item, child: Text(item,style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),))).toList(),
                  onChanged: ((value)=>setState(() {
                    this.value=value;
                  })),
                  dropdownColor: Colors.white,
                  hint: Text("Select Category"),
                  icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
                value: value,
                ),),
              ),


              SizedBox(height: 30.0,),
              GestureDetector(
                onTap: (){
                  uploadItem();
                },
                child: Center(child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("Add",style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold
                    ),),),
                  ),
                ),),
              )
        ],),),
      ),
    );
  }
}
