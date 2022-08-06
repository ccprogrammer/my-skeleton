import 'package:flutter/material.dart';

PreferredSizeWidget SimpleAppBar({title, backButton}) {
  return AppBar(
    iconTheme: const IconThemeData(color: Colors.black),
    backgroundColor: Colors.white,
    elevation: 0,
    titleSpacing: 0,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () {
        backButton();
      },
    ),
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),
  );
}
