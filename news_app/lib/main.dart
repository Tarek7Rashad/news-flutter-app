import 'package:flutter/material.dart';
import 'package:news_app/Screens/Home_Page.dart';
import 'package:news_app/Screens/Login_Page.dart';
import 'package:news_app/Screens/Register_Page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(

  //     // options: DefaultFirebaseOptions.currentPlatform,

  //     );
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
      routes: {
        HomePage.id: (context) => const HomePage(),
        LoginScreen.id: (context) => const LoginScreen(),
        SignUpScreen.id: (context) => const SignUpScreen(),
      },
    );
  }
}
