import 'package:flutter/material.dart';
import 'package:project1/pages/loginpage.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF01BFE1),
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              width: 90,
              height: 100,
              child:Image.asset(
                'assets/images/doctosmartlogo.png',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: 100,
              alignment: Alignment.bottomCenter,
              child: const Text(
                "doctosmart",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ],

        ),
      ),

    );
  }
}
