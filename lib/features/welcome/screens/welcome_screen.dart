import 'package:cholesterol_predictor/features/home/screens/home_screen.dart';
import 'package:cholesterol_predictor/features/welcome/providers/name_provider.dart';
import 'package:cholesterol_predictor/widgets/custom_button.dart';
import 'package:cholesterol_predictor/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController nameController = TextEditingController();
  final nameFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/jason-briscoe-HN_4K2diUWs-unsplash.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: nameFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to the Chelosterol Predicting We App",
                style: TextStyle(
                  fontSize: getValueForScreenType<double>(
                    context: context,
                    mobile: 17.sp,
                    tablet: 17.sp,
                    desktop: 20,
                  ),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                height: getValueForScreenType<double>(
                  context: context,
                  mobile: 200.h,
                  tablet: 200.h,
                  desktop: 200,
                ),
                width: getValueForScreenType<double>(
                  context: context,
                  mobile: 330.w,
                  tablet: 300.w,
                  desktop: 400,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      // offset: Offset(2, 2),
                      spreadRadius: 1,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextFormField(
                        hintText: "Enter your name",
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter your name';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: getValueForScreenType<double>(
                        context: context,
                        mobile: 20.h,
                        tablet: 20.h,
                        desktop: 20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: CustomButton(
                        buttonText: "Continue",
                        buttonTextColor: Colors.white,
                        borderRadius: 20,
                        onTap: () {
                          if (nameFormKey.currentState!.validate()) {
                            // Get the NameProvider from the context
                            var nameProvider = Provider.of<NameProvider>(
                                context,
                                listen: false);

                            // Save the entered name using the provider
                            nameProvider.setEnteredName(nameController.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return HomeScreen();
                                },
                              ),
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
