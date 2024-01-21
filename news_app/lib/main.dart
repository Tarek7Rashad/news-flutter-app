
import 'package:flutter/material.dart';

import 'package:news_app/Screens/Home_Page.dart';


void main() async {
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
      home: const HomePage(),
      // routes: {'speedNewsCardPage': (context) =>  SpeedNewsCardPage()},
    );
  }
}
