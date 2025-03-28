import 'package:bcp_frontend/src/automate_save/presentation/screens/automate_save_settings_screen.dart';
import 'package:bcp_frontend/src/automate_save/presentation/screens/automate_save_view_screen.dart';
import 'package:bcp_frontend/src/chat/presentation/screens/chat_screen.dart';
import 'package:bcp_frontend/src/chat/presentation/screens/comments_screen.dart';
import 'package:bcp_frontend/src/extras/presentation/screens/extras_screen.dart';
import 'package:bcp_frontend/src/home/presentation/screens/finance_dashboard_screen.dart';
import 'package:bcp_frontend/src/home/presentation/screens/finance_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YapeAhorra',
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
        fontFamily: 'Poppins',
        splashColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/':
            builder = (BuildContext context) => FinanceSectionScreen();
            break;
          case '/finance_dashboard':
            builder = (BuildContext context) => const FinanceDashboardScreen();
            break;
          case '/extras':
            builder = (BuildContext context) => const ExtrasScreen();
            break;
          case '/chat':
            builder = (BuildContext context) => const ChatScreen();
            break;
          case '/comments':
            builder = (BuildContext context) => CommentsScreen();
            break;
          case '/automate_save_settings':
            builder =
                (BuildContext context) => const AutomateSaveSettingsScreen();
            break;
          case '/automate_save_view':
            builder = (BuildContext context) => const AutomateSaveViewScreen();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder);
      },
    );
  }
}
