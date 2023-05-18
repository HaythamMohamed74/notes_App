import 'package:flutter/material.dart';
import 'package:notes_app/constants/constant.dart';

import 'notes_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4)).then((value) =>
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const NotesView())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        logo,
        // width: 500,
      )),
    );
  }
}
