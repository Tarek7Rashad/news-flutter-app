import 'package:flutter/material.dart';
import 'package:news_app/Models/SpeedNewsCardModel.dart';
import 'package:news_app/Screens/SpeedNewsCardPage.dart';

class SpeedNewsCard extends StatelessWidget {
  const SpeedNewsCard({super.key, required this.cardModel});
  final CardModel cardModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SpeedNewsCardPage(
                  category: cardModel.title,
                )));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 5),
        width: 190,
        height: 120,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(cardModel.image), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
            child: Text(
          cardModel.title,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: Colors.orange),
        )),
      ),
    );
  }
}
