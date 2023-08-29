import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_api/screen/user_screen.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    var baseTheme = ThemeData(brightness: Brightness.light);
    return GetMaterialApp(
      theme: baseTheme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
        scaffoldBackgroundColor: const Color.fromARGB(255, 241, 241, 241),
      ),
      home: const UserScreen(),
    );
  }
}
