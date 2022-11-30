import 'package:flutter/material.dart';
import 'package:shortnews/controller/fetch_data.dart';
import 'package:shortnews/model/news_data_modelling.dart';
import 'package:shortnews/widgets/main_screen_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;

  late NewsDataModel newsDataModel;

  GetDataMainScreen() async {
    newsDataModel = await FetchData.fetchNewsData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    GetDataMainScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            isLoading = true;
          });
          GetDataMainScreen();
        },
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return isLoading
              ? Center(child: CircularProgressIndicator())
              : MainScreenContainer(
                  fullNews: newsDataModel.fullNews,
                  desc: newsDataModel.desc,
                  newsHeadline: newsDataModel.newsHeadline,
                  newsImage: newsDataModel.newsImage);
        },
      ),
    );
  }
}
