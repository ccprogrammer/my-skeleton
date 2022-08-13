import 'package:flutter/material.dart';

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
    TextEditingController controller = TextEditingController();
    inputNumber() {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Input Number',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: TextField(
                    controller: controller,
                    maxLength: 3,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: '$stock',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      stock = int.tryParse(value) ?? 0;
                    },
                    onEditingComplete: () {
                      Navigator.pop(context);
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.label ?? 'STOCK',
              style: const TextStyle(fontWeight: FontWeight.w500),
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
              child: const Icon(Icons.remove),
            ),
          ),
          GestureDetector(
            onTap: () {
              inputNumber();
            },
            child: SizedBox(
              width: 30,
              child: Center(
                child: Text('$stock'),
              ),
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
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
