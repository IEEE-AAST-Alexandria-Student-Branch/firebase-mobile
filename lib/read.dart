import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Car{
  late String name;
  late String type;
  late String ID;

  Car(this.name, this.type, this.ID);
}

List <Car> cars = [];

class Read extends StatefulWidget {
  const Read({Key? key}) : super(key: key);

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Text('my cars', style: TextStyle(fontSize: 30),),
            SizedBox(height: 50,),

            Expanded(
              child: ListView.builder(
                itemCount: cars.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Text(cars[index].name, style: const TextStyle(fontSize: 30),),
                      Text(cars[index].type, style: const TextStyle(fontSize: 30),),
                      Text(cars[index].ID, style: const TextStyle(fontSize: 30),),
                      const Text('', style: TextStyle(fontSize: 30),),
                    ],
                  ),
              ),
            )

          ],
        ),
      ),
    );
  }

  loadData() async {
    cars.clear();
    var db = FirebaseFirestore.instance;

    // db.collection('cars').doc('car4').get().then((document) => print(document.exists));

    var collection = await db.collection('cars').where('name',isEqualTo: 'toyota').get();
    for (var document in collection.docs){
      var doc = document.data();
      setState(() {
        cars.add(Car(doc['name'], doc['type'], document.id));
      });
      print(document.exists);
    }
  }
}
