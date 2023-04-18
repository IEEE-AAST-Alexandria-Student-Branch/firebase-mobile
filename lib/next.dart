import 'package:firebase/create.dart';
import 'package:firebase/read.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Next extends StatelessWidget {
  const Next({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(style: const TextStyle(fontSize: 30),
              FirebaseAuth.instance.currentUser!.email ?? "no mail",
            ),
            const SizedBox(height: 150,),
            TextButton(
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Create(),)),
                child: const Text('create car', style: TextStyle(color: Colors.white,fontSize: 30)),
            ),
            const SizedBox(height: 20,),
            TextButton(
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Read(),)),
                child: const Text('list cars', style: TextStyle(color: Colors.white, fontSize: 30),),
            ),
          ],
        ),
      ),
    );
  }
}
