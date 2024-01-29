import 'dart:convert';
import 'package:http/http.dart' as http;

Future<double> sendPostRequest(Map<String, dynamic> inputData) async {
  final String apiUrl =
      'https://cholesterol-level-predictor-server.onrender.com/cholesterol/predict-cholesterol';

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
      Map<String, dynamic> responseData = jsonDecode(response.body);
      double predictedCholesterol = responseData['predicted_cholesterol'];
      return predictedCholesterol;
    } else {
      // Handle errors
      print('Error: ${response.statusCode}, ${response.reasonPhrase}');
      throw Exception('Failed to predict cholesterol');
    }
  } catch (e) {
    // Handle exceptions
    print('Exception: $e');
    throw Exception('Failed to predict cholesterol');
  }
}
