import 'dart:io';
import 'package:dog_detection/widgets/progress_indicator.dart';
import 'package:restart_app/restart_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tflite/tflite.dart';
import 'package:get/get.dart';

import '../widgets/alert_dialog.dart';

class DogHome extends StatefulWidget {
  DogHome({Key? key}) : super(key: key);

  @override
  State<DogHome> createState() => _DogHomeState();
}

class _DogHomeState extends State<DogHome> {
 
  bool _isLoading = false;
  bool loading = true;
  final TextEditingController textController = new TextEditingController();
  File? _image;
  List? _output;
  final imagepicker = ImagePicker();
  @override
  void initState() {
    _isLoading = true;
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
    loadmodel().then((value) {
      setState(() {});
    });
  }

  detectimage(File image) async {
    var prediction = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.6,
        imageMean: 140.5,
        imageStd: 140.5);

    setState(() {
      _output = prediction;
      loading = false;
    });
  }

  loadmodel() async {
    await Tflite.loadModel(
        model: 'assets/images/model_unquant.tflite',
        labels: 'assets/images/labels.txt');
  }

  @override
  void dispose() {
    super.dispose();
  }

  pickimage_camera() async {
    var image = await imagepicker.getImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    detectimage(_image!);
  }

  pickimage_gallery() async {
    var image = await imagepicker.getImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    detectimage(_image!);
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? (Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Shimmer.fromColors(
                baseColor: Colors.grey[200]!,
                highlightColor: Colors.grey[50]!,
                child: Progressindicator())))
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text('title'.tr,
                  style: GoogleFonts.acme(
                      textStyle: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))),
              centerTitle: true,
              elevation: 0.0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.teal,
                //  systemNavigationBarColor: Colors.blue,
              ),
              actions: [
                IconButton(onPressed: (){
                         showAlertDialog(context);
                }, icon: Icon(Icons.language,color: Colors.teal,),)
              ],
            ),
            body: Container(
              // padding: EdgeInsets.only(top: 8),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // color: Colors.red,
                    height: 150,
                    width: 250,
                    child: Lottie.asset(
                      "assets/images/mask.json",
                    ),
                  ),
                  SizedBox(height: 11.0),
                  Container(
                    child: Text('hello'.tr,
                        style: GoogleFonts.akayaTelivigala(
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(height: 19.0),
                  Container(
                    width: double.infinity,
                    height: 50,
                    padding: EdgeInsets.all(5.0),
                    child: RaisedButton(
                      onPressed: () {
                        pickimage_camera();
                      },
                      color: Colors.teal,
                      child: Text(
                        'message'.tr,
                        style: GoogleFonts.actor(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    padding: EdgeInsets.all(5.0),
                    child: RaisedButton(
                      onPressed: () {
                        pickimage_gallery();
                      },
                      color: Colors.teal,
                      child: Text(
                        'subscribe'.tr,
                        style: GoogleFonts.actor(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  loading != true
                      ? Container(
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: 250,
                                padding: EdgeInsets.all(15),
                                child: Image.file(_image!),
                              ),
                              _output != null
                                  ? Text(
                                      (_output![0]['label'])
                                          .toString()
                                          .substring(2),
                                      style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold)))
                                  : Text(""),
                              RaisedButton(
                                  child: Text('changelang'.tr),
                                  onPressed: () {
                                    Restart.restartApp();
                                  })
                            ],
                          ),
                        )
                      : Container(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 200,
                                width: 350,
                                child: Lottie.asset(
                                  "assets/images/line.json",
                                ),
                              )
                            ],
                          ),
                        )
                ],
              ),
            ),
          );
  }
}


