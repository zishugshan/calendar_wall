import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'ui/tracker_screen.dart';

class DotTrackerApp extends StatelessWidget {
  const DotTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const TrackerScreen(),
    );
  }
}
