import 'package:flutter/material.dart';
import 'package:news_app/Cards/card_23.dart';
import 'package:news_app/Cards/card_24.dart';
import 'package:gap/gap.dart';
class View9 extends StatelessWidget {
  const View9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card23(),
            Gap(30),
            Card24()

          ],
        ),
      ),
    );
  }
}
