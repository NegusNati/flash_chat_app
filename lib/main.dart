import 'package:flutter/material.dart';
import 'package:flash_chat_app/screens/welcome_screen.dart';
import 'package:flash_chat_app/screens/login_screen.dart';
import 'package:flash_chat_app/screens/registration_screen.dart';
import 'package:flash_chat_app/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: const TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => WelcomeScreen(),
        '/chat' : (context) => ChatScreen(),
        '/login' : (context) => LoginScreen(),
        '/registration' :(context) => RegistrationScreen(),
      },
    );
  }
}