import 'package:flutter/material.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      color: Colors.blueAccent,
      child: Container(
        width: width,
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 15.0,
          ),
          shrinkWrap: true,
          // itemCount: MenuList.mainMenuList.length,
          itemCount: 6,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, index) {
            // var list = MenuList.mainMenuList[index];
            return GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Colors.white.withOpacity(0),
                          ],
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset:
                                Offset(0, 0), // x, y changes position of shadow
                          )
                        ],
                      ),
                      child: Center(
                        child: Image.asset(
                          // list['image_url'].toString(),
                          '',
                          height: 38,
                          width: 38,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    // list["label"].toString(),
                    '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
