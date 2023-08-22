
import 'package:august/src/view/screens/login.dart';
import 'package:august/src/view/utilis/media.dart';

import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   
    super.initState();
    navigate();
  }

  navigate(){
    Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context)
    .pushReplacement(MaterialPageRoute(builder: (context)=> LoginScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(appLogo),
          CircularProgressIndicator.adaptive(
            backgroundColor: Colors.black,
          )
          ],
        )
      ),
    );
  }
}