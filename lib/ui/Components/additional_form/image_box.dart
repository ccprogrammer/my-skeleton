import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_skeleton/constants/constants.dart';
import 'package:my_skeleton/ui/Components/image_picker/image_picker_handler.dart';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({Key key, this.data}) : super(key: key);
  final dynamic data;

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker>
    with ImagePickerListener, TickerProviderStateMixin {
  var _pickedPhoto;

  List photoList = [];

  ImagePickerHandler imagePicker;
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    imagePicker = ImagePickerHandler(this, _controller);
    imagePicker.init();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 22, 16, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Image Box :',
            style: TextStyle(fontWeight: Constants.medium),
          ),
          Container(
            width: width * 0.4,
            height: height * 0.25,
            margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color(0xff121212),
                width: 1,
              ),
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                const BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(1, 2), // x, y changes position of shadow
                )
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  imagePicker.showDialog(context);
                },
                child: _pickedPhoto == null
                    ? Icon(
                        Icons.camera_alt_sharp,
                        color: Colors.grey,
                        size: width * 0.1,
                      )
                    : Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(File(_pickedPhoto.path)),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  userImage(File _image, int type) {
    if (_image != null) {
      setState(() {
        if (type == 1) {
          _pickedPhoto = _image;
          // photoList.add(_image);
          log(_image.toString());
        }
      });
    }
  }
}
