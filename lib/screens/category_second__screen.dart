import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
final TextEditingController _controller = TextEditingController();

class categorysecondscreen extends StatelessWidget {
  
 //static const screenRoute = '/category-pages';
 
  get names => null;
  
  get username => null;
  
  get email => null;
  
  get password => null;
  
  get phonenum => null;
  
  get age => null;
  
  get description => null; 
//final String categoryid;
//final String categorytitle;
//categorysecondscreen(this.categoryid, this.categorytitle);

  @override
  Widget build(BuildContext context) {

return Scaffold(
 appBar: AppBar(
        title: Text('add patient'),
        backgroundColor: Color(0xFFF5CEB8),
      ),
body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 0.0),
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top:0.0),
                width: MediaQuery.of(context).size.width,
                height:  MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40), 
                  )
                ),
                child: Column(
                  children:<Widget> [
                 
                
                ],)),
              
                Container(
                  padding: EdgeInsets.only(top:80.0,left: 20.0,right: 20.0),
                  child: Column(children:<Widget> [
                    
                    SizedBox(height: 0.0,),
                    TextField(
                      controller: names,
                      decoration: InputDecoration(
                        labelText: ' patient name',
                        prefixIcon: Icon(Icons.people),
                        border: 
                        myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    TextField(
                      controller: phonenum,
                      decoration: InputDecoration(
                        labelText: 'phone',
                        prefixIcon: Icon(Icons.phone),
                        border: 
                        myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    TextField(
                      controller: age,
                      decoration: InputDecoration(
                        labelText: 'age',
                        prefixIcon: Icon(Icons.person_2_rounded),
                        border: 
                        myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    TextField(
          
                      controller: description,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(50.0),
                        labelText: 'Description',
                        prefixIcon: Icon(Icons.description),
                        border: 
                        myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      ),
                    ),
                     SizedBox(
                height: 20.0,),
                 
                 ElevatedButton(onPressed: (){},
                  child: Text('Done'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFF2BEA1),
                    padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 20.0),
                    textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                    
                  ),
                  
      
                  )
                
                  ],),
                ),
             
          ]),
        ),
      ),
    );
  }
OutlineInputBorder myinputborder(){
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(
      color: Color(0xFFF2BEA1),
      width: 3,
    ) );
}

OutlineInputBorder myfocusborder(){
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(
      color: Color.fromARGB(255, 182, 47, 110),
      width: 3,
    ) );
}




}


    