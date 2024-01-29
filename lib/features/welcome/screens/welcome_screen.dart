import 'package:cholesterol_predictor/features/home/screens/home_screen.dart';
import 'package:cholesterol_predictor/widgets/custom_button.dart';
import 'package:cholesterol_predictor/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController nameController = TextEditingController();
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
        child: Column(
          children: [
            Text("Welcome to the Chelosterol Predicting App"),
            Container(
              height: 200,
              width: 400,
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
                children: [
                  CustomTextFormField(
                    hintText: "Enter your name",
                    controller: nameController,
                  ),
                  CustomButton(
                    buttonText: "Continue",
                    buttonTextColor: Colors.blue,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomeScreen();
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
