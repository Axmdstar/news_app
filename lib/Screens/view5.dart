import 'package:flutter/material.dart';
import 'package:news_app/Cards/card_15.dart';
import 'package:gap/gap.dart';
class View5 extends StatelessWidget {
  const View5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card15(),
            Gap(30),


          ],
        ),
      ),
    );
  }
}
