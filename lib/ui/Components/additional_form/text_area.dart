import 'package:flutter/material.dart';
import 'package:my_skeleton/constants/constants.dart';

class CustomTextArea extends StatefulWidget {
  const CustomTextArea({
    Key key,
    this.label,
    this.hintText,
    this.controller,
    this.onChangeListener,
  }) : super(key: key);
  final String label;
  final String hintText;
  final TextEditingController controller;
  final Function onChangeListener;

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
          Text(
            widget.label ?? 'Text Area :',
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
              child: TextField(
                expands: true,
                maxLines: null,
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: widget.hintText ?? ' . . .',
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
