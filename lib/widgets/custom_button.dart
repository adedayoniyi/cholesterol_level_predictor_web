import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
    this.buttonColor = const Color(0xFF7266f8),
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
        ),
      ),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: getValueForScreenType<double>(
              context: context,
              mobile: 17.sp,
              tablet: 15.sp,
              desktop: 17,
            ),
            color: buttonTextColor,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
