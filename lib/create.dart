import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String name = '';
String type = '';

class Create extends StatelessWidget {
  const Create({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            Text('create new car', style: TextStyle(fontSize: 30),),
            SizedBox(height: 50,),
            Text('name', style: TextStyle(fontSize: 30),),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              color: Colors.orange,
              child: TextField(
                onChanged: (value) => name=value,
              ),
            ),
            SizedBox(height: 15,),

            Text('type', style: TextStyle(fontSize: 30),),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              color: Colors.orange,
              child: TextField(
                onChanged: (value) => type=value,
              ),
            ),
            SizedBox(height: 70,),

            TextButton(
              onPressed: CreateCar,
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue), foregroundColor: MaterialStatePropertyAll(Colors.white)),
              child: Text('Create', style: TextStyle(fontSize: 30),),
            ),
          ],
        ),
      ),
    );
  }

  CreateCar(){
    var db = FirebaseFirestore.instance;

    var data = {"name": name, "type": type};
    db.collection('cars').add(data);
    // db.collection('cars').doc('car4').set(data);
    // db.collection('cars').doc('car4').update(data);
  }
}
