import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Next extends StatelessWidget {
  const Next({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(style: TextStyle(fontSize: 30),
        FirebaseAuth.instance.currentUser!.email ?? "no mail",
      ),
    );
  }
}
