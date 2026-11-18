import 'package:flutter/material.dart';
import 'package:llm_chat_app/presentation/provider/chat_provider.dart';
import 'package:provider/provider.dart';
import 'package:llm_chat_app/presentation/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatProvider(), // আপনার ChatProvider ক্লাসের ইনস্ট্যান্স
      child: const MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}