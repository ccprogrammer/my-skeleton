import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:photo_view/photo_view.dart';

class Helper {
  final BuildContext context;
  Helper({@required this.context});

  // === flushbar flushbar: 1.10.4
  Widget flushbar({String msg, bool success: false, Function action}) {
    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(8),
      borderRadius: 8,
      message: msg,
      icon: Icon(
        success ? Icons.check_circle_outline : Icons.info_outline,
        size: 28.0,
        color: success ? Colors.green : Colors.red[300],
      ),
      duration: const Duration(seconds: 3),
    )..show(context).then((value) {
        if (action != null) {
          print(action);
          return action;
        }
      });
  }

  // === alert dialog
  Future alert({
    text = '',
    icon = Icons.check,
    onClose,
    isBorder = true,
    iconSize = 32.0,
  }) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    border: isBorder
                        ? Border.all(color: Colors.black, width: 3)
                        : null,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: iconSize,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 17),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 18),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onClose();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      primary: Colors.blue,
                      elevation: 1,
                    ),
                    child: const Text(
                      'Tutup',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).then((value) => onClose());
  }

  // === share flutter_share: ^2.0.0
  Future<void> share({
    title: 'Example share',
    text: 'Example share text',
    linkUrl: 'https://flutter.dev/',
    chooserTitle: 'Example Chooser Title',
  }) async {
    await FlutterShare.share(
      title: title,
      text: text,
      linkUrl: linkUrl,
      chooserTitle: chooserTitle,
    );
  }

  // === view photo photo_view: ^0.13.0

  Future viewPhoto({String url, String heroTag}) async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: const Icon(
                Icons.chevron_left,
                size: 36,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Hero(
            tag: heroTag,
            child: Container(
              constraints: BoxConstraints.expand(
                height: MediaQuery.of(context).size.height,
              ),
              child: PhotoView(
                imageProvider: NetworkImage(url),
                loadingBuilder: (context, event) {
                  if (event == null) {
                    return const Center(
                      child: Text("Loading"),
                    );
                  }

                  final value = event.cumulativeBytesLoaded /
                      (event.expectedTotalBytes ?? event.cumulativeBytesLoaded);

                  final percentage = (100 * value).floor();
                  return Center(
                    child: Text("$percentage%"),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  // convert hex color
  Color colorFromHex<T>(
    String colorHex,
  ) {
    String regColor = colorHex.replaceAll(RegExp(r'#'), '');
    return Color(num.parse('0xFF' + regColor));
  }
}
