import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> sendPostRequest() async {
  final String apiUrl =
      "https://cholesterol-level-predictor-server.onrender.com/cholesterol/predict-cholesterol";
  // Sample input data
  Map<String, dynamic> inputData = {
    "Age": 50,
    "Gender": "Male",
    "ChestPainType": "Typical angina",
    "RestingBloodPressure": 130,
    "FastingBloodSugar": false,
    "RestingECG": "ST-T wave abnormality",
    "MaxHeartRate": 122,
    "ExerciseInducedAngina": "No",
    "STDepression": 0.0,
    "Slope": "Flat",
    "NumMajorVessels": 1,
    "Thalassemia": "Normal",
    "HeartDisease": 1
  };

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(inputData),
    );

    if (response.statusCode == 200) {
      // Successful response
      print('Response Body: ${response.body}');
      Map<String, dynamic> responseData = jsonDecode(response.body);
      double predictedCholesterol = responseData['predicted_cholesterol'];
      print('Predicted Cholesterol: $predictedCholesterol');
    } else {
      // Handle errors
      print('Error: ${response.statusCode}, ${response.reasonPhrase}');
    }
  } catch (e) {
    // Handle exceptions
    print('Exception: $e');
  }
}
