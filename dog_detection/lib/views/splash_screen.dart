
import 'package:dog_detection/views/dog_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class MaskSplashHome extends StatefulWidget {
  MaskSplashHome({Key? key}) : super(key: key);

  @override
  State<MaskSplashHome> createState() => _MaskSplashHomeState();
}

class _MaskSplashHomeState extends State<MaskSplashHome> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DogHome()));
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:Colors.white,
          statusBarIconBrightness: Brightness.light
        ),
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Lottie.asset('assets/images/splashscreen.json')],
        ),
      ),
    );
  }
}
