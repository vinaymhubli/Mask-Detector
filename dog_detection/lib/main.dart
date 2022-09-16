import 'package:dog_detection/views/splash_screen.dart';
import 'package:dog_detection/widgets/local_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       translations: LocaleString(),
      locale: Locale('en','US'),
      title: "Dog_Breed_Identification_Application",
      debugShowCheckedModeBanner: false,
      home: MaskSplashHome(),
    );
  }
}
