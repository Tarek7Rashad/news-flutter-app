import 'package:flutter/material.dart';
import 'package:news_app/shared/components/constant.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
    this.width = double.maxFinite,
    this.color = kblueGreyColor,
  });
  final VoidCallback? onPressed;
  final String text;
  final double width;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 22,
            color: kwhiteColor,
          ),
        ),
      ),
    );
  }
}
