import 'package:flutter/material.dart';
import 'package:news_app/Models/SpeedNewsCardModel.dart';
import 'package:news_app/Widgets/SpeedNewsCard.dart';

class SpeedNewsCardsListView extends StatelessWidget {
  const SpeedNewsCardsListView({
    super.key,
  });
  final List<CardModel> CardsContent = const [
    CardModel(
      title: 'Science',
      image: 'assets/newsImages/science.jpg',
    ),
    CardModel(
      title: 'Sports',
      image: 'assets/newsImages/sport.jpeg',
    ),
    CardModel(
      title: 'Technology',
      image: 'assets/newsImages/technology.jpeg',
    ),
    CardModel(
      title: 'Business',
      image: 'assets/newsImages/business.jpg',
    ),
    CardModel(
      title: 'Health',
      image: 'assets/newsImages/health.jpg',
    ),
    CardModel(
      title: 'Entertainment',
      image: 'assets/newsImages/entertaiment.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: CardsContent.length,
          itemBuilder: (context, index) {
            return SpeedNewsCard(
              cardModel: CardsContent[index],
            );
          }),
    );
  }
}
