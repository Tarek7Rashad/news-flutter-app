import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Models/LNews_Article_Model.dart';
// import 'package:news_app/Models/LNews_Article_Model.dart';
import 'package:news_app/Services/news_service.dart';
import 'package:news_app/Widgets/LNewsListView.dart';

class NewSliverListBuilder extends StatefulWidget {
  const NewSliverListBuilder({
    super.key,
    required this.category,
  });
  final String category;
  @override
  State<NewSliverListBuilder> createState() => _NewSliverListBuilderState();
}

class _NewSliverListBuilderState extends State<NewSliverListBuilder> {
  // List<LNewsArticleModel> articles = [];
  bool isLoading = true;
  var future;
  @override
  void initState() {
    super.initState();
    // getGeneralNews(); //first way
    future =
        NewsServices(Dio()).getNews(category: widget.category); //second way
    print(widget.category);
  }

  // Future<void> getGeneralNews() async {
  //   articles = await NewsServices(Dio()).getNews();
  //   isLoading = false;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LNewsArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return LNewsListView(
              articles: snapshot.data!,
              // ?? [],
            );
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Text("Oops!, There Is An Error"),
            );
          } else {
            return SliverFillRemaining(
              child: Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black26.withOpacity(0.2),
                  ),
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    color: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            );
          }
        });
    /*********************** */
    // if (isLoading) {
    //   return SliverToBoxAdapter(
    //     child: Center(
    //       child: Container(
    //         width: 100,
    //         height: 100,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(20),
    //           color: Colors.grey[200],
    //         ),
    //         alignment: Alignment.center,
    //         child: const CircularProgressIndicator(
    //           color: Colors.black,
    //           backgroundColor: Colors.white,
    //         ),
    //       ),
    //     ),
    //   );
    // } else if (articles.isNotEmpty) {
    //   return LNewsListView(
    //     articles: articles,
    //   );
    // } else {
    //   return const SliverToBoxAdapter(
    //     child: Text("Oops!, There Is An Error"),
    //   );
    // }
  }
}
