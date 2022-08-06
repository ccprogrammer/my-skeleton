import 'package:flutter/material.dart';
import 'package:my_skeleton/constants/constants.dart';

class CustomTextBox extends StatefulWidget {
  const CustomTextBox(
      {Key key,
      this.label,
      this.controller,
      this.onChangeListener,
      this.hintText})
      : super(key: key);
  final String label;
  final String hintText;
  final TextEditingController controller;
  final Function onChangeListener;
  @override
  State<CustomTextBox> createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 22, 16, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label ?? 'Text Box :',
            style: const TextStyle(fontWeight: Constants.medium),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black45)),
            child: Center(
              child: Focus(
                onFocusChange: (focus) {},
                child: TextField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                    hintText: '${widget.hintText} . . .',
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    widget.onChangeListener(value);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
