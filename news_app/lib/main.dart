import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:news_app/Screens/Login_Page.dart';
void main() async {
   WidgetsFlutterBinding.ensureInitialized();
     await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  
  );
  // await NewsServices(Dio()).getNews(category: 'general');
  runApp(const NewsWidget());
}

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      // routes: {'speedNewsCardPage': (context) =>  SpeedNewsCardPage()},
    );
  }
}
