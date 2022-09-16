import 'package:flutter/material.dart';
import 'package:get/get.dart';

showAlertDialog(BuildContext context) async {
  final List locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'ಕನ್ನಡ', 'locale': Locale('kn', 'IN')},
    {'name': 'हिंदी', 'locale': Locale('hi', 'IN')},
  ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  return await showDialog(
      barrierColor: Colors.teal.withOpacity(0.2),
      context: context,
      builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
             title: Text('Choose Your Language'),
             content: Container(
               width: double.maxFinite,
               child: ListView.separated(
                 shrinkWrap: true,
                   itemBuilder: (context,index){
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: GestureDetector(child: Text(locale[index]['name']),onTap: (){
                         print(locale[index]['name']);
                         updateLanguage(locale[index]['locale']);
                       }),
                     );
                   }, separatorBuilder: (context,index){
                     return Divider(
                       color: Colors.teal,
                     );
               }, itemCount: locale.length
               ),
             ),
           ));
        }
