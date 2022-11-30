
import 'dart:convert';

import 'dart:math';

import 'package:http/http.dart';
import 'package:shortnews/model/news_data_modelling.dart';

class FetchData{

 static Future<NewsDataModel> fetchNewsData()async{
    String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=25b70a400cfe474b824fcbb2377fd691#";
    Response response = await get(Uri.parse(url));

    try{
      if(response.statusCode == 200){
        Map finalData = jsonDecode(response.body);

        List article = finalData["articles"];
        var myArticle = article[Random().nextInt(article.length)];

        return NewsDataModel.getNewsData(myArticle);
      }
      else{
        print("error fetching data");
      }
    }catch (e){
      throw e.toString();
    }

    throw "error while fetching";



  }

}