import 'package:bcp_frontend/src/automate_save/presentation/screens/automate_save_settings_screen.dart';
import 'package:bcp_frontend/src/automate_save/presentation/screens/automate_save_view_screen.dart';
import 'package:bcp_frontend/src/challengue/presentation/screens/challenge_screen.dart';
import 'package:bcp_frontend/src/home/presentation/screens/finance_dashboard_screen.dart';
import 'package:bcp_frontend/src/chat/presentation/screens/chat_screen.dart';
import 'package:bcp_frontend/src/chat/presentation/screens/comments_screen.dart';
import 'package:bcp_frontend/src/home/presentation/screens/finance_section.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CommentsScreen(),
    );
  }
}
