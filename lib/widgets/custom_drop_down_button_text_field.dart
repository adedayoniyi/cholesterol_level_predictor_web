// import 'package:flutter/material.dart';

// class CustomDropDownButtonTextField extends StatefulWidget {
// required List<DropdownMenuItem<String>>? items  const CustomDropDownButtonTextField({super.key});

//   @override
//   State<CustomDropDownButtonTextField> createState() => _CustomDropDownButtonTextFieldState();
// }

// class _CustomDropDownButtonTextFieldState extends State<CustomDropDownButtonTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField(
//                     icon: Icon(
//                       Icons.keyboard_arrow_down,
//                       color: Colors.white,
//                       size: 30,
//                     ),
//                     value: _selectedState,
//                     borderRadius: BorderRadius.circular(15),
//                     items: states.map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(
//                           value,
//                           style: TextStyle(
//                             color: const Color(0xFF868686),
//                             fontWeight: FontWeight.w400,
//                             fontSize: 17,
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                     onChanged: (newValue) {
//                       setState(() {
//                         _selectedState = newValue;
//                       });
//                     },
//                     // style: const TextStyle(
//                     //   color: Colors.black,
//                     //   fontWeight: FontWeight.bold,
//                     //   fontSize: 19,
//                     // ),
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: "Select your age",
//                       hintStyle: TextStyle(
//                         color: const Color(0xFFCDCDCD),
//                         fontWeight: FontWeight.w500,
//                         fontSize: 15,
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please select your state';
//                       }
//                       return null;
//                     },
//                     menuMaxHeight: 200,
//                   );
//   }
// }