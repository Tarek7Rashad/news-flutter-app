import 'package:flutter/material.dart';
import 'package:news_app/Models/LNews_Article_Model.dart';
import 'package:news_app/Widgets/LNew.dart';

class LNewsListView extends StatelessWidget {
  const LNewsListView({super.key, required this.articles});

  final List<LNewsArticleModel> articles;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
            child: lNewWidget(lNewsArticleModel: articles[index]),
          );
        },
      ),
    );
  }
}
