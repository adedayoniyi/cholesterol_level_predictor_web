import 'package:cholesterol_predictor/features/home/providers/drop_down_selection_provider.dart';
import 'package:cholesterol_predictor/features/home/services/home_services.dart';
import 'package:cholesterol_predictor/features/welcome/providers/name_provider.dart';
import 'package:cholesterol_predictor/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // sendPostRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? selectedAge;
    String? selectedGender;
    String? selectedChestPainType;
    String? selectedRestingBloodPressure;
    String? selectedFastingBloodSugar;
    String? selectedRestingECG;
    String? selectedMaxHeartRate;
    String? selectedExerciseInducedAngina;
    String? selectedSTDepression;
    String? selectedSlope;
    String? selectedNumMajorVessels;
    String? selectedThalassemia;
    String? selectedHeartDisease;

    List<String?> selectedItems = [
      selectedAge,
      selectedGender,
      selectedChestPainType,
      selectedRestingBloodPressure,
      selectedFastingBloodSugar,
      selectedRestingECG,
      selectedMaxHeartRate,
      selectedExerciseInducedAngina,
      selectedSTDepression,
      selectedSlope,
      selectedNumMajorVessels,
      selectedThalassemia,
      selectedHeartDisease,
    ];

    List<Color> containerColors = [
      const Color(0xFF7266f8),
      const Color(0xFF0e8a82),
      const Color(0xFF9285f1),
      const Color(0xFFb4b6b7),
      const Color(0xFF5ec5bf),
      const Color(0xFFfdd5be),
      const Color(0xFFbecffd),
      const Color(0xFF9ff5c2),
      const Color(0xFFa3f1e8),
      const Color(0xFFfff5e3),
      const Color(0xFFe4f0fe),
      const Color(0xFFffeaea),
      const Color(0xFF6d79ed),
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
      "assets/icons/chest_pain.jpg",
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
        List.generate(100, (index) => "${index.toString()}");

    List<String> fastingBloodSugatGreaterThan120mg = [
      "True",
      "False",
    ];

    List<String> restingECG = [
      "Normal",
      "Having ST-T wave abnormality",
      "Showing probable or definite left ventricular hypertrophy by Estes' criteria",
    ];

    List<String> maxHeartRate = List.generate(300, (index) => index.toString());

    List<String> exerciseInducedAngina = [
      "Yes",
      "No",
    ];

    List<String> stDepression = List.generate(300, (index) => index.toString());

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

    List<String> heartDisease = [
      "0",
      "1",
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
      heartDisease,
    ];

    List<String> heartData = [
      'Age: Represents the age of the individual in years.',
      'Gender: Represents the gender of the individual.\n   - Female\n   - Male',
      'ChestPainType: Chest pain type.\n   - Typical angina\n   - Atypical angina\n   - Non-anginal pain\n   - Asymptomatic',
      'RestingBloodPressure: Resting blood pressure in mm Hg.',
      'FastingBloodSugar: Fasting blood sugar > 120 mg/dl.\n   - False\n   - True',
      'RestingECG: Resting electrocardiographic results.\n   - Normal\n   - Having ST-T wave abnormality\n   - Showing probable or definite left ventricular hypertrophy by Estes\' criteria',
      'MaxHeartRate: Maximum heart rate achieved.',
      'ExerciseInducedAngina: Exercise induced angina.\n   - No\n   - Yes',
      'STDepression: ST depression induced by exercise relative to rest.',
      'Slope: Slope of the peak exercise ST segment.\n   - Upsloping\n   - Flat\n   - Downsloping',
      'NumMajorVessels: Number of major vessels (0-3) colored by fluoroscopy.',
      'Thalassemia: Thalassemia.\n   - Normal\n   - Fixed defect\n   - Reversible defect',
      'HeartDisease: Presence or absence of heart disease.\n   - No heart disease\n   - Heart disease present',
    ];
    String storedName = Provider.of<NameProvider>(context).enteredName;
    final dropDownFormKey = GlobalKey<FormState>();

    return Scaffold(
      body: Form(
        key: dropDownFormKey,
        child: Column(
          children: [
            Text(
              "Hey! $storedName, What's your Cholesterol level?",
              style: TextStyle(
                fontSize: getValueForScreenType<double>(
                  context: context,
                  mobile: 17.sp,
                  tablet: 17.sp,
                  desktop: 25,
                ),
                fontWeight: FontWeight.bold,
              ),
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
                  var dropdownProvider =
                      Provider.of<DropdownSelectionProvider>(context);

                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: containerColors[index]),
                      child: Row(
                        children: [
                          const SizedBox(
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
                              child: ClipRRect(
                                child: Image.asset(
                                  containerIcons[index],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: DropdownButtonFormField(
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                                size: 30,
                              ),
                              value: dropdownProvider.selectedItems[index],
                              borderRadius: BorderRadius.circular(15),
                              items: myData[index]
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: getValueForScreenType<double>(
                                        context: context,
                                        mobile: 17.sp,
                                        tablet: 20,
                                        desktop: 17,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownProvider.updateSelectedItem(
                                      index, newValue);

                                  print(dropdownProvider.selectedItems[0]);
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
                                hintStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Select a field here';
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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getValueForScreenType<double>(
                  context: context,
                  mobile: 15.w,
                  tablet: 15.w,
                  desktop: 50,
                ),
                vertical: getValueForScreenType<double>(
                  context: context,
                  mobile: 15.h,
                  tablet: 15.h,
                  desktop: 10,
                ),
              ),
              child: CustomButton(
                buttonText: "Check",
                buttonTextColor: Colors.black,

                // buttonColor: ,
                borderRadius: 20,
                onTap: () async {
                  if (dropDownFormKey.currentState!.validate()) {
                    var dropdownProvider =
                        Provider.of<DropdownSelectionProvider>(context,
                            listen: false);
                    Map<String, dynamic> inputData = {
                      "Age": int.parse(dropdownProvider.selectedItems[0]!),
                      "Gender": dropdownProvider.selectedItems[1],
                      "ChestPainType": dropdownProvider.selectedItems[2],
                      "RestingBloodPressure":
                          int.parse(dropdownProvider.selectedItems[3]!),
                      "FastingBloodSugar": dropdownProvider.selectedItems[4],
                      "RestingECG": dropdownProvider.selectedItems[5],
                      "MaxHeartRate":
                          int.parse(dropdownProvider.selectedItems[6]!),
                      "ExerciseInducedAngina":
                          dropdownProvider.selectedItems[7],
                      "STDepression":
                          double.parse(dropdownProvider.selectedItems[8]!),
                      "Slope": dropdownProvider.selectedItems[9]!,
                      "NumMajorVessels":
                          int.parse(dropdownProvider.selectedItems[10]!),
                      "Thalassemia": dropdownProvider.selectedItems[11],
                      "HeartDisease":
                          int.parse(dropdownProvider.selectedItems[12]!),
                    };
                    print(inputData);
                    try {
                      showDialog(
                        context: context,
                        builder: (context) => WillPopScope(
                          onWillPop: () async => false,
                          child: Center(
                            child: AlertDialog(
                              backgroundColor: Colors.transparent,
                              surfaceTintColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              elevation: 0,
                              content: Center(
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                      color: Colors.transparent),
                                  child: const CircularProgressIndicator(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );

                      double predictedCholesterol =
                          await sendPostRequest(inputData);

                      Navigator.pop(context);

                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: const Text("Check Completed!"),
                              content: Text(
                                "Your chelostrol level is: $predictedCholesterol",
                                style: TextStyle(
                                  fontSize: getValueForScreenType<double>(
                                    context: context,
                                    mobile: 15.sp,
                                    tablet: 14.sp,
                                    desktop: 16,
                                  ),
                                ),
                              ));
                        },
                      );
                      print('Predicted Cholesterol: $predictedCholesterol');
                    } catch (e) {
                      // Handle errors
                      print('Error: $e');
                    }
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
