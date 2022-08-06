import 'package:flutter/material.dart';
import 'package:my_skeleton/constants/constants.dart';
import 'package:my_skeleton/routes/routes.dart';
import 'package:my_skeleton/ui/Components/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              _buildLogo(),
              const Spacer(),
              _buildOTP(),
              _buildLoginButton(),
              _buildDivider(),
              _buildRegisterButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Hero(
        tag: 'splash-image',
        child: Image.asset(
          'assets/icons/logo-app.png',
          width: width * 0.5,
        ),
      ),
    );
  }

  Widget _buildOTP() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Masuk',
            style: TextStyle(
              color: Constants.darkColor,
              fontSize: 28,
              fontWeight: Constants.medium,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 30, 16, 0),
          child: const TextField(
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                labelText: 'OTP',
                hintText: 'Kode OTP',
                floatingLabelBehavior: FloatingLabelBehavior.always),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          alignment: Alignment.centerRight,
          child: Text(
            'Kirimkan Kode (OTP)',
            style: TextStyle(
              color: Constants.darkColor,
              fontSize: 14,
              fontWeight: Constants.medium,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 32, 16, 0),
      child: CustomButton(
        label: 'Masuk',
        onPressed: () {},
        backgroundColor: Constants.darkColor,
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 27, 16, 0),
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Expanded(
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 12),
          const Text('Atau'),
          const SizedBox(width: 12),
          const Expanded(
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 27, 16, 32),
      child: CustomButton(
        label: 'Daftar',
        onPressed: () {
          Navigator.pushNamed(context, AppRoute.register);
        },
        backgroundColor: Colors.white,
        textColor: Constants.darkColor,
        isBorder: true,
      ),
    );
  }
}
