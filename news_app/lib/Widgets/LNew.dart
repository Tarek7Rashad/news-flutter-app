import 'package:flutter/material.dart';
import 'package:news_app/Models/LNews_Article_Model.dart';
import 'package:news_app/Screens/NewsDetails.dart';

class lNewWidget extends StatelessWidget {
  const lNewWidget({super.key, required this.lNewsArticleModel});
  final LNewsArticleModel lNewsArticleModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                NewsDetails(lNewsArticleModel: lNewsArticleModel),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              final tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.network(
                lNewsArticleModel.image ??
                    "https://exchange4media.gumlet.io/news-photo/115799-main59.jpg?w=400&dpr=2.6",
                height: 250,
                width: double.infinity,
                fit: BoxFit.fill,
              )),
          const SizedBox(
            height: 12,
          ),
          Text(
            lNewsArticleModel.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            lNewsArticleModel.description ?? " ",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
