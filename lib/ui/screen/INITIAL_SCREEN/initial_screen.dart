import 'package:flutter/material.dart';
import 'package:my_skeleton/routes/routes.dart';
import 'package:my_skeleton/ui/Components/custom_button.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 1200), () {
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoute.login, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/icons/logo-app.png',
          width: width * 0.32,
        ),
      ),
    );
  }
}
