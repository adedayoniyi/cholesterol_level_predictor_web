import 'package:cholesterol_predictor/features/home/providers/drop_down_selection_provider.dart';
import 'package:cholesterol_predictor/features/home/screens/home_screen.dart';
import 'package:cholesterol_predictor/features/welcome/providers/name_provider.dart';
import 'package:cholesterol_predictor/features/welcome/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    ScreenBreakpoints(desktop: 800, tablet: 550, watch: 200),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return DropdownSelectionProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return NameProvider();
          },
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 843),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Cholesterol Predicting Web App',
          theme: ThemeData(
            fontFamily: GoogleFonts.fredoka().fontFamily,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xFF7266f8),
            ),
            useMaterial3: true,
          ),
          home: child,
        );
      },
      child: WelcomeScreen(),
    );
  }
}
