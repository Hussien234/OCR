import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:ocr/pdf_creator.dart';
class image_picker extends StatefulWidget {
  const image_picker({Key? key}) : super(key: key);

static const String id='image_picker';
  @override
  State<image_picker> createState() => _image_pickerState();
}

class _image_pickerState extends State<image_picker> {
  final _textRecognizer=TextRecognizer();
  String imagepath="";
  String text2="";

File? imageFile;
void dispose(){
  _textRecognizer.close();
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: Scaffold(
        appBar: AppBar(
          title: const Text('Select image to get its text',style:TextStyle(color: Colors.black),),
          backgroundColor:  Colors.white,
        ),
        body: Container(
        constraints: BoxConstraints.expand(),
    decoration: BoxDecoration(
    image: DecorationImage(
    image:AssetImage("image/background.jpg"),
    fit: BoxFit.fill
    ),
    ),
       child: Center(child:Column(
          children: [
            const SizedBox(height: 40,),
            imageFile == null

                ? Image.asset('image/R.png', height: 300.0, width: 300.0,)
                : ClipRRect(
                borderRadius: BorderRadius.circular(150.0),
                child: Image.file(imageFile!, height: 300.0, width: 300.0, fit: BoxFit.fill,)
            ),
            SizedBox(height: 20,),

            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
crossAxisAlignment: CrossAxisAlignment.center,

              children: [
              ElevatedButton(
                  child: Text('pick'),
                  onPressed: () async {


                     await ImagePicker().pickImage(
                        source: ImageSource.gallery).then((value){
                      if(value != null){
                        _cropImage(File(value.path));
                        imagepath=value.path;


                      }},);
                     
                  }
              ),
              ElevatedButton(
                  child: Text('openCamera'),

                  onPressed: () async {
                     await ImagePicker().pickImage(
                        source: ImageSource.camera).then((value){
                      if(value != null){
                        _cropImage(File(value.path));
                        imagepath=value.path;
                      }

                    }

                    );
                     
                  }
              ),
                ElevatedButton(
                    child: Text('Scan'),

                    onPressed: () async {
                      final inputImage=InputImage.fromFilePath(imagepath);
                      final recognizedText= await _textRecognizer.processImage(inputImage);
                      text2=recognizedText.text;
PDFGenerator.createPdf(text2);
                     PDFGenerator.createpage(text2);

                      // Show a snackbar with the file path
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Saved PDF file as '),
                        ),
                      );
                    }
                ),
            ],),

          ],
        ),

        ),

      ),
      ),
      )
    );
  }
  _cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,

    );
    if (croppedFile != null) {

      imageCache.clear();
      setState(() {
        imageFile = File(croppedFile.path);
      });
      // reload();
    }


  }
}


