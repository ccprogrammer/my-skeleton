import 'package:flutter/material.dart';
import 'package:my_skeleton/ui/Components/additional_form/image_box.dart';
import 'package:my_skeleton/ui/Components/additional_form/select_box.dart';
import 'package:my_skeleton/ui/Components/additional_form/switch_box.dart';
import 'package:my_skeleton/ui/Components/additional_form/text_area.dart';
import 'package:my_skeleton/ui/Components/additional_form/text_box.dart';
import 'package:my_skeleton/ui/Components/additional_form/text_box_password.dart';
import 'package:my_skeleton/ui/Components/additional_form/text_box_suara.dart';


class AdditionalForm extends StatefulWidget {
  const AdditionalForm({Key key, this.data, this.index}) : super(key: key);
  final int index;
  final dynamic data;

  @override
  State<AdditionalForm> createState() => _AdditionalFormState();
}

class _AdditionalFormState extends State<AdditionalForm> {
  @override
  Widget build(BuildContext context) {
    if (widget.data['type'] == 'select_box') {
      return CustomSelectBox(
        data: widget.data,
      );
    }

    if (widget.data['type'] == 'switch_box') {
      return CustomSwitchBox(
        data: widget.data,
      );
    }

    if (widget.data['type'] == 'text_box') {
      return CustomTextBox(
        data: widget.data,
      );
    }

    if (widget.data['type'] == 'text_vote') {
      return CustomTextBox2(
        data: widget.data,
      );
    }

    if (widget.data['type'] == 'text_password') {
      return CustomTextBox3(
        data: widget.data,
      );
    }

    if (widget.data['type'] == 'text_area') {
      return CustomTextArea(
        data: widget.data,
      );
    }

      if (widget.data['type'] == 'image_box') {
      return CustomImagePicker(
        data: widget.data,
      );
    }
    return Container();
  }
}
