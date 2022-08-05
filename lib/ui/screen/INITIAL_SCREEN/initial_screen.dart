import 'package:flutter/material.dart';
import 'package:my_skeleton/routes/routes.dart';
import 'package:my_skeleton/ui/Components/custom_button.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: CustomButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoute.registerInfo);
            },
            label: 'Custom Button',
          ),
        ),
      ),
    );
  }
}
