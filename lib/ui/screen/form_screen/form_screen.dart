import 'package:flutter/material.dart';
import 'package:my_skeleton/constants/constants.dart';
import 'package:my_skeleton/routes/routes.dart';
import 'package:my_skeleton/ui/Components/custom_button.dart';
import 'package:my_skeleton/ui/screen/form_screen/form_pageview.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  PageController _pageBoardController = PageController(initialPage: 0);
  int currentPage = 0;
  String pageTitle = 'Information';
  List pageList = [
    {
      'page': 'Page 1',
      'data': [
        {
          'title': 'Section 1',
          'data': [
            {
              'type': 'select_box',
            },
            {
              'type': 'text_box',
            },
            {
              'type': 'text_area',
            },
          ],
        },
        {
          'title': 'Section 2',
          'data': [
            {
              'type': 'select_box',
            },
          ],
        },
      ],
    },
    {
      'page': 'Page 2',
      'data': [
        {
          'title': 'Section 1',
          'data': [
            {
              'type': 'text_vote',
            },
            {
              'type': 'text_vote',
            },
          ],
        },
        {
          'title': 'Section 2',
          'data': [
            {
              'type': 'image_box',
            },
          ],
        },
      ],
    },
    {
      'page': 'Page 3',
      'data': [
        {
          'title': 'Section 1',
          'data': [
            {
              'type': 'select_box',
            },
            {
              'type': 'select_box',
            },
            {
              'type': 'text_password',
            },
            {
              'type': 'text_password',
            },
          ],
        },
      ],
    },
  ];

  previousPage() {
    if (_pageBoardController.page < 1) {
      Navigator.pop(context);
    } else {
      _pageBoardController.previousPage(
          duration: Duration(milliseconds: 200), curve: Curves.linear);
    }
  }

  nextPage() {
    if (_pageBoardController.page == pageList.length - 1) {
      Navigator.pushNamed(context, AppRoute.home);
    } else {
      _pageBoardController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      bottomNavigationBar: _buildBottomAppBar(),
      body: PageView.builder(
        controller: _pageBoardController,
        pageSnapping: true,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        itemCount: pageList.length,
        itemBuilder: (context, index) => FormPageView(
          data: pageList[index]['data'],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          previousPage();
        },
      ),
      title: Text(
        pageTitle,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }

  BottomAppBar _buildBottomAppBar() {
    return BottomAppBar(
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: CustomButton(
          onPressed: () {
            nextPage();
          },
          label: 'Next',
          backgroundColor: Constants.darkColor,
        ),
      ),
    );
  }
}
