import 'package:flutter/material.dart';

import 'screens/widget.dart';

void main() {
  runApp(const CimiloSheegApp());
}

class CimiloSheegApp extends StatelessWidget {
  final String appName = "Cimilo-Sheeg";
  const CimiloSheegApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData.dark(),
      home: HomeScreen(title: appName),
    );
  }
}
