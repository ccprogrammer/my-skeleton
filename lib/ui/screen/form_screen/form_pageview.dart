import 'package:flutter/material.dart';
import 'package:my_skeleton/constants/constants.dart';
import 'package:my_skeleton/ui/Components/additional_form/additional_form.dart';

class FormPageView extends StatefulWidget {
  const FormPageView({Key key, this.data}) : super(key: key);
  final dynamic data;
  @override
  State<FormPageView> createState() => _FormPageViewState();
}

class _FormPageViewState extends State<FormPageView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16, 24, 16, 0),
          child: const Text(
            'Form Component',
            style: TextStyle(
              color: Constants.blueDarkColor,
              fontSize: 14,
              fontWeight: Constants.bold,
            ),
          ),
        ),
        for (var item in widget.data)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                child: Text(
                  '${item['title']}',
                  style: TextStyle(
                    color: Constants.blueDarkColor,
                    fontSize: 14,
                    fontWeight: Constants.bold,
                  ),
                ),
              ),
              for (var _item in item['data'])
                AdditionalForm(
                  data: _item,
                ),
            ],
          ),
      ],
    );
  }
}
