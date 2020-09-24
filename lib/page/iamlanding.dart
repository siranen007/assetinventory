import 'package:flutter/material.dart';

class IamLanding extends StatelessWidget {
  List<Widget> pageChildren(width) {
    return <Widget>[
      Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Daily Tasks',
                      style: TextStyle(background: Paint()..color = Colors.blueGrey..style = PaintingStyle.stroke,fontSize: 20,),
                      ),
                    ],
                  ),
                ),
            ),
              // Spacer(flex: 1,),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: RichText(
                  text: TextSpan(
                    text: 'New Account to Inventory',style: TextStyle(color: Colors.white,)
                  ),
                ),
              ),
          ],
          
        ),
        width: width*0.35,
        height: 400,
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 30,
        ),
      ),
      Container(
        child: Text(
          'Second',
        ),
        width: width*0.35,
        height: 400,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 100,
                vertical: 60,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: pageChildren(constraints.biggest.width),
              ),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 60,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: pageChildren(constraints.biggest.width),
              ),
            ),
          );
        }
      },
    );
  }
}
