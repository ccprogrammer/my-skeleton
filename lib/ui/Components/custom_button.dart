import 'package:flutter/material.dart';
import 'package:my_skeleton/constants/constants.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key key,
    @required this.onPressed,
    @required this.label,
    this.backgroundColor,
    this.textColor,
    this.isBorder = false,
  }) : super(key: key);
  final Function onPressed;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final bool isBorder;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height * 0.06,
      width: width,
      child: ElevatedButton(
        onPressed: () {
          widget.onPressed();
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          primary: widget.backgroundColor ?? Colors.grey,
          elevation: 0,
          shape: const StadiumBorder(),
          side: widget.isBorder
              ? const BorderSide(
                  width: 1,
                  color: Constants.darkColor,
                )
              : null,
        ),
        child: Center(
          child: Text(
            widget.label,
            style: TextStyle(
              color: widget.textColor,
              fontSize: 18,
              fontWeight: Constants.medium,
            ),
          ),
        ),
      ),
    );
  }
}
