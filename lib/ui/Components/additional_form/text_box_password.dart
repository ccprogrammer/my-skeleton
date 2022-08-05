import 'package:flutter/material.dart';
import 'package:my_skeleton/constants/constants.dart';

class CustomTextBox3 extends StatefulWidget {
  const CustomTextBox3({Key key, this.data}) : super(key: key);
  final dynamic data;

  @override
  State<CustomTextBox3> createState() => _CustomTextBox3State();
}

class _CustomTextBox3State extends State<CustomTextBox3> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 22, 16, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Text Box Password :',
            style: TextStyle(fontWeight: Constants.medium),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.fromLTRB(16, 4, 0, 4),
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black45)),
            child: Center(
              child: Focus(
                onFocusChange: (focus) {},
                child: TextField(
                  obscureText: passwordVisible,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                      icon: Icon(
                        passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    hintText: 'Password',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
