import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Get.offNamed('/dashboard');
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              child: Stack(
                children: [
                  Image.asset("assets/logo.png"),
                  Padding(
                    padding: const EdgeInsets.only(left: 160,top: 20),
                    child: Align(alignment: Alignment.topCenter,
                        child: Container(
                            height: 10,width: 10,
                            child: CircularProgressIndicator(color: Colors.blue.shade800,strokeWidth: 5,))),
                  )
                ],
              )),
          SizedBox(height: 100,),
          Image.asset("assets/splash.png",fit: BoxFit.fitWidth,),

        ],
      )
    );
  }
}
