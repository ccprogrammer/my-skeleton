import 'package:flutter/material.dart';
import 'package:my_skeleton/constants/constants.dart';

class AddQuantity extends StatefulWidget {
  const AddQuantity({Key key, this.label}) : super(key: key);
  final String label;

  @override
  State<AddQuantity> createState() => _AddQuantityState();
}

class _AddQuantityState extends State<AddQuantity> {
  int stock = 0;

  handleAddQuantity({isAdd = true}) {
    if (isAdd) {
      setState(() {
        stock += 1;
      });
    }
    if (!isAdd) {
      if (stock > 0) {
        setState(() {
          stock -= 1;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.label ?? 'STOCK',
              style: TextStyle(
                fontWeight: Constants.medium,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              handleAddQuantity(isAdd: false);
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.remove),
            ),
          ),
          Container(
            width: 30,
            child: Center(
              child: Text('$stock'),
            ),
          ),
          GestureDetector(
            onTap: () {
              handleAddQuantity();
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
