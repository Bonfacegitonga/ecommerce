import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final List<Color> color;
  final String analytics;
  final String text;
  final Widget myIcon;
  final double width;
  final double height;

  const MyContainer(
      {super.key,
      required this.color,
      required this.text,
      required this.analytics,
      this.myIcon = const SizedBox(),
      this.width = 185,
      this.height = 130});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: const Alignment(0.8, 1),
          colors:
              color, // Gradient from https://learnui.design/tools/gradient-generator.html
          tileMode: TileMode.mirror,
        ),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myIcon,
            const SizedBox(
              width: 3,
            ),
            Text(
              analytics,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            // fontWeight: FontWeight.bold
          ),
        )
      ]),
    );
  }
}
