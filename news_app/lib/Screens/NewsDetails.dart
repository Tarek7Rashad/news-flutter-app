import 'package:flutter/material.dart';
import 'package:news_app/Models/LNews_Article_Model.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key, required this.lNewsArticleModel});
  final LNewsArticleModel lNewsArticleModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // const SliverToBoxAdapter(
          // child: Center(
          //   child: Text(
          //     'News',
          //     style: TextStyle(
          //         fontSize: 24,
          //         color: Colors.black,
          //         fontWeight: FontWeight.w700),
          //   ),
          // ),
          // ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              const SizedBox(
                height: 9,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.network(
                  lNewsArticleModel.image ??
                      'https://www.lifewire.com/thmb/gIkXBYJvl2kgkLtQWF_4z5AHi7o=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/address-bar-711a771bb4dd4f9a9e4f57cc8a2fc20a.jpg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${lNewsArticleModel.title}',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  lNewsArticleModel.description ?? '',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500]),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
