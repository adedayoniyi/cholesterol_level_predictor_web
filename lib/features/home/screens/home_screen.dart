import 'package:cholesterol_predictor/features/home/services/home_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    sendPostRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? _selectedState;
    List<Color> containerColors = [
      Color(0xFF7266f8),
      Color(0xFF0e8a82),
      Color(0xFF9285f1),
      Color(0xFFb4b6b7),
      Color(0xFF5ec5bf),
      Color(0xFF7266f8),
      Color(0xFF7266f8),
      Color(0xFF7266f8),
      Color(0xFF7266f8),
      Color(0xFF7266f8),
      Color(0xFF7266f8),
      Color(0xFF7266f8),
      Color(0xFF7266f8),
    ];

    List<String> containerData = [
      'Select your Age',
      'Select your Gender',
      'Select your ChestPainType',
      'Select your RestingBloodPressure',
      'Select your FastingBloodSugar',
      'Select your RestingECG',
      'Select your MaxHeartRate',
      'Select your ExerciseInducedAngina',
      'Select your STDepression',
      'Select your Slope',
      'Select your NumMajorVessels',
      'Select your Thalassemia',
      'Select your HeartDisease',
    ];
    List<String> containerIcons = [
      "assets/icons/age_icon.png",
      "assets/icons/gender_sex_icon.png",
      "assets/icons/age_icon.png",
      "assets/icons/blood pressure icon.png",
      "assets/icons/blood sugar icon.png",
      "assets/icons/restingecg_icon.png",
      "assets/icons/heart_rate_icon.jpg",
      "assets/icons/angina_icon.png",
      "assets/icons/depression_icon.png",
      "assets/icons/exercise_slope_icon.png",
      "assets/icons/blood_vessel_icon.jpg",
      "assets/icons/thalassemia.jpg",
      "assets/icons/age_icon.png",
    ];

    List<String> age = List.generate(100, (index) => index.toString());
    List<String> gender = [
      "Male",
      "Female",
    ];

    List<String> chestPainType = [
      "Typical angina",
      "Atypical angina",
      "Non-anginal pain",
      "Asymptomatic",
    ];

    List<String> restingBloodPressure =
        List.generate(100, (index) => "${index.toString()}mm Hg");

    List<String> fastingBloodSugatGreaterThan120mg = [
      "True",
      "False",
    ];

    List<String> restingECG = [
      "Normal",
      "Having ST-T wave abnormality",
      "Showing probable or definite left ventricular hypertrophy by Estes' criteria",
    ];

    List<String> maxHeartRate = List.generate(100, (index) => index.toString());

    List<String> exerciseInducedAngina = [
      "Yes",
      "No",
    ];

    List<String> stDepression = List.generate(100, (index) => index.toString());

    List<String> slopeOfPeakExercise = [
      "Upsloping",
      "Flat",
      "Downsloping",
    ];

    List<String> numMajorVessels = [
      "0",
      "1",
      "2",
      "3",
      "4",
    ];

    List<String> thalassemia = [
      "Normal",
      "Fixed defect",
      "Reversible defect",
    ];

    List<String> states = [
      'Abia',
      'Adamawa',
      'Akwa Ibom',
      'Anambra',
      'Bauchi',
      'Bayelsa',
      'Benue',
      'Borno',
      'Cross River',
      'Zamfara'
    ];

    List<List<String>> myData = [
      age,
      gender,
      chestPainType,
      restingBloodPressure,
      fastingBloodSugatGreaterThan120mg,
      restingECG,
      maxHeartRate,
      exerciseInducedAngina,
      stDepression,
      slopeOfPeakExercise,
      numMajorVessels,
      thalassemia,
      states,
    ];

    return Scaffold(
      body: Column(
        children: [
          Text(
            "Hey! Adedayo, What's your Cholesterol level?",
            style: TextStyle(fontSize: 25),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: getValueForScreenType<int>(
                  context: context,
                  mobile: 1,
                  tablet: 2,
                  desktop: 3,
                ),
                childAspectRatio: 300 / 90,
              ),
              itemCount: 13,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: containerColors[index]),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Image.asset(containerIcons[index]),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: DropdownButtonFormField(
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: 30,
                            ),
                            value: _selectedState,
                            borderRadius: BorderRadius.circular(15),
                            items: myData[index]
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    color: const Color(0xFF868686),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedState = newValue;
                              });
                            },
                            // style: const TextStyle(
                            //   color: Colors.black,
                            //   fontWeight: FontWeight.bold,
                            //   fontSize: 19,
                            // ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: containerData[index],
                              hintStyle: TextStyle(
                                color: const Color(0xFFCDCDCD),
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select your state';
                              }
                              return null;
                            },
                            menuMaxHeight: 200,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
