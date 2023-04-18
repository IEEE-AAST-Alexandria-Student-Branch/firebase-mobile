import 'package:firebase/next.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String toShow = '';
String mail ='';
TextEditingController passwordController = TextEditingController();

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LOGIN () async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: mail,
          password: passwordController.value.text
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

    setState(() {
      toShow = 'login Successfully';
    });
  }

  SIGNUP () async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: mail,
        password: passwordController.value.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    setState(() {
      toShow = 'signup Successfully';
    });
  }

  SIGNOUT () async {
    await FirebaseAuth.instance.signOut();

    setState(() {
      toShow = 'signout Successfully';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              // email
              Text('Email', style: TextStyle(fontSize: 30),),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                color: Colors.orange,
                child: TextField(
                  onChanged: (value) => mail=value,
                ),
              ),
              SizedBox(height: 15,),

              // password
              Text('Password', style: TextStyle(fontSize: 30),),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                color: Colors.orange,
                  child: TextField(
                    controller: passwordController,
                  ),
              ),
              SizedBox(height: 15,),


              TextButton(
                  onPressed: LOGIN,
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue), foregroundColor: MaterialStatePropertyAll(Colors.white)),
                  child: Text('log In', style: TextStyle(fontSize: 30),),
              ),
              SizedBox(height: 15,),
              TextButton(
                  onPressed: SIGNUP,
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue), foregroundColor: MaterialStatePropertyAll(Colors.white)),
                  child: Text('Sign UP', style: TextStyle(fontSize: 30),),
              ),
              SizedBox(height: 15,),
              TextButton(
                  onPressed: SIGNOUT,
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue), foregroundColor: MaterialStatePropertyAll(Colors.white)),
                  child: Text('Sign Out', style: TextStyle(fontSize: 30),),
              ),

              SizedBox(height: 55,),
              Text(toShow, style: TextStyle(fontSize: 30),),

              TextButton(
                onPressed: () {
                  if(FirebaseAuth.instance.currentUser?.uid != null){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Next(),));
                  }
                },
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue), foregroundColor: MaterialStatePropertyAll(Colors.white)),
                child: Text('Next', style: TextStyle(fontSize: 30),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
