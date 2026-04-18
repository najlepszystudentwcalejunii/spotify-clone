import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/app_images.dart';
import 'package:spotify/core/app_vectors.dart';
import 'package:spotify/presentation/widgets/app_bar.dart';
import 'package:spotify/presentation/widgets/news_songs.dart';
import 'package:spotify/presentation/widgets/playlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 30,
        ),
      ),
      body: Column(
        children: [
          _homeTopCard(),
          _tabs(),
          SizedBox(
            height: 220,
            child: TabBarView(
              controller: _tabController,
              children: [
                NewsSongs(),
                Container(),
                Container(),
                Container(),
              ],
            ),
          ),
          SizedBox(height: 40),
          Playlist(),
        ],
      ),
    );
  }

  Widget _homeTopCard() {
    return SizedBox(
      height: 140,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              AppVectors.homePageCard,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 50.0,
              ),
              child: Image.asset(
                AppImages.homePageArtist,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabs() {
    final tabTextStyle = TextStyle(
      fontVariations: [FontVariation.weight(500)],
      fontSize: 16,
    );

    return TabBar(
      dividerHeight: 0,
      isScrollable: true,
      tabAlignment: TabAlignment.center,
      padding: EdgeInsets.symmetric(vertical: 20),
      splashBorderRadius: BorderRadius.circular(
        30,
      ),

      controller: _tabController,
      tabs: [
        Text("News", style: tabTextStyle),
        Text("Videos", style: tabTextStyle),
        Text("Artists", style: tabTextStyle),
        Text("Podcasts", style: tabTextStyle),
      ],
    );
  }
}
