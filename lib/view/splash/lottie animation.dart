import 'dart:async';

import 'package:capstone1/view/login/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class LottieAnimation extends StatefulWidget {
  const LottieAnimation({super.key});

  @override
  State<LottieAnimation> createState() => _LottieAnimationState();
}

class _LottieAnimationState extends State<LottieAnimation> {
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 10), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => WelcomeView())));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: ListView(

        children: [
          // from url
         // Lottie.network("url")
          // from assets
          Lottie.asset("assets/animations/splash3.json"),
        ],
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text("Home Page"),
      ),
      body:Center(
        child: Text("welcome"),
      ) ,
    );
  }
}










