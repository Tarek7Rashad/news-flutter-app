import 'package:flutter/material.dart';
import 'package:news_app/Widgets/NewSliverListBuilder.dart';

import '../Widgets/SpeedNewsCardsLisView.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String id = "HomePage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'General ',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Text(
                'News',
                style: TextStyle(fontSize: 24, color: Colors.orange),
              ),
            ],
          ),
        ),
        body: const CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: SpeedNewsCardsListView(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            NewSliverListBuilder(category: 'general'),
          ],
        )

        //  const Column(
        //   children: [
        //     SpeedNewsCardsListView(),
        //     Expanded(child: LNewsListView()),
        //   ],
        // ),
        );
  }
}
