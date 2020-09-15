import 'package:flutter/material.dart';

class IamLanding extends StatelessWidget {
  List<Widget> pageChildren(width) {
    return <Widget>[
      Container(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 40,
        ),
        child: Text(
          'IAM Administration \nOperation',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 40,
        ),
        child: Text(
          'There are many opration activity to complete day by day. To be aware the completeness of your activities',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
            ],
          ),
        ),
      Image.asset(
        'images/logo.png',
        width: width,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 800) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: pageChildren(constraints.biggest.width / 2),
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: pageChildren(constraints.biggest.width),
        );
      }
    });
  }
}
