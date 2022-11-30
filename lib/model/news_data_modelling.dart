
class NewsDataModel{
  String newsImage;
  String newsHeadline;
  String desc;
  String fullNews;

  NewsDataModel({required this.fullNews, required this.desc, required this.newsHeadline, required this.newsImage});

    static NewsDataModel getNewsData(Map<String,dynamic> article){
      return NewsDataModel(fullNews: article["url"],
          desc: article["content"],
          newsHeadline: article["title"],
          newsImage: article["urlToImage"]
      );
    }



}