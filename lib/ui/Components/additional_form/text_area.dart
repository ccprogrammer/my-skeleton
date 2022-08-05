import 'package:flutter/material.dart';
import 'package:my_skeleton/constants/constants.dart';

class CustomTextArea extends StatefulWidget {
  const CustomTextArea({Key key, this.data}) : super(key: key);
  final dynamic data;

  @override
  State<CustomTextArea> createState() => _CustomTextAreaState();
}

class _CustomTextAreaState extends State<CustomTextArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 22, 16, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Text Area :',
            style: TextStyle(fontWeight: Constants.medium),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
            height: 150.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black45)),
            child: Focus(
              onFocusChange: (focus) {},
              child: const TextField(
                expands: true,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Input Text . . .',
                  hintStyle: TextStyle(),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
