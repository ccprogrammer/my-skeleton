import 'package:flutter/material.dart';

class CustomSelectBox extends StatefulWidget {
  const CustomSelectBox({Key key, this.data}) : super(key: key);
  final dynamic data;

  @override
  State<CustomSelectBox> createState() => _CustomSelectBoxState();
}

class _CustomSelectBoxState extends State<CustomSelectBox> {
  dynamic _selectedValue;
  final List _valueList = [
    {
      'label': 'Option One',
      'value': 1,
    },
    {
      'label': 'Option Two',
      'value': 2,
    },
    {
      'label': 'Option Three',
      'value': 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 22, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Box :',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
            height: 50.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black45,
              ),
            ),
            child: DropdownButton(
              dropdownColor: Colors.white,
              itemHeight: 70,
              elevation: 1,
              isExpanded: true,
              hint: const Text(
                '- Select Option -',
              ),
              underline: Container(),
              icon: const Icon(Icons.arrow_drop_down_rounded),
              items: _valueList.map((e) {
                int index = _valueList.indexOf(e);
                return DropdownMenuItem(
                  value: index,
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          e['label'],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                );
              }).toList(),
              value: _selectedValue,
              onChanged: (value) {
                print(value);
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
