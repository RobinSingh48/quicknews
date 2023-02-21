
import 'package:flutter/material.dart';
import 'package:shortnews/widgets/web_screen.dart';

import '../const/const.dart';

class MainScreenContainer extends StatefulWidget {
  String newsImage;
  String newsHeadline;
  String desc;
  String fullNews;
  MainScreenContainer(
      {required this.fullNews,
      required this.desc,
      required this.newsHeadline,
      required this.newsImage});

  @override
  State<MainScreenContainer> createState() => _MainScreenContainerState();
}

class _MainScreenContainerState extends State<MainScreenContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
              widget.newsImage,
              fit: BoxFit.cover,
            )),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    widget.newsHeadline,
                    style: headLineTextStyle
                  ),
                  SizedBox(height: 5,),
                  Text(
                    "${widget.desc.substring(0, widget.desc.length - 15)}.......",
                    style: newsDescTextStyle,
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WebScreen(fullNews: widget.fullNews)));
                          },
                          child: Text("Read More"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
