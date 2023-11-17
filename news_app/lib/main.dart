// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:news_app/Models/LNews_Article_Model.dart';
// import 'package:news_app/Models/SpeedNewsCardModel.dart';
import 'package:news_app/Screens/Home_Page.dart';
// import 'package:news_app/Screens/SpeedNewsCardPage.dart';
// import 'package:news_app/Services/news_service.dart';

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
      home: HomePage(),
      // routes: {'speedNewsCardPage': (context) =>  SpeedNewsCardPage()},
    );
  }
}
