import 'package:flutter/material.dart';

class StyledRichText extends StatelessWidget {
  final String text1;
  final String text2;
  final double? text1Size;
  final double? text2Size;

  const StyledRichText({
    Key? key,
    required this.text1,
    required this.text2,
    this.text1Size,
    this.text2Size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: TextStyle(
          fontSize: text1Size ?? 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: text2,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: text2Size ?? 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
