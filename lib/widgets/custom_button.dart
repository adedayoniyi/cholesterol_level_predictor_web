import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color buttonTextColor;
  final VoidCallback onTap;
  final double borderRadius;
  final Color? borderSideColor;
  const CustomButton({
    Key? key,
    required this.buttonText,
    this.buttonColor = const Color(0xFF014e2c),
    required this.buttonTextColor,
    required this.onTap,
    this.borderRadius = 10,
    this.borderSideColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
          splashFactory: InkSplash.splashFactory,
          overlayColor: MaterialStatePropertyAll(
            Colors.white.withOpacity(0.2),
          ),
          backgroundColor: MaterialStatePropertyAll(
            buttonColor,
          ),
          fixedSize: MaterialStatePropertyAll(
            Size(MediaQuery.of(context).size.width, 50),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(
                color: borderSideColor!,
                width: 1,
              ),
            ),
          )),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 19,
            color: buttonTextColor,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
