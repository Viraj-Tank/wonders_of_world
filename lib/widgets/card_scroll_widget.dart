import 'dart:math';
import 'package:flutter/material.dart';

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;
  double cardAspectRatio = 12.0 / 16.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    double widgetAspectRatio = cardAspectRatio * 1.2;

    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;  //411.42857142857144
        var height = contraints.maxHeight;  //457.1428571428572

        var safeWidth = width - 2 * padding; //371.42857142857144
        var safeHeight = height - 2 * padding; //417.1428571428572

        var heightOfPrimaryCard = safeHeight; //417.1428571428572
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio; //312.8571428571429

        var primaryCardLeft = safeWidth - widthOfPrimaryCard; //58.571428571428555
        var horizontalInset = primaryCardLeft / 2; //29.285714285714278

        List<Widget> cardList = [];

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding + max(primaryCardLeft - horizontalInset * -delta * (isOnRight ? 15 : 1), 0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: const BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(3.0, 6.0), blurRadius: 10.0)]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(images[i], fit: BoxFit.cover),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black.withOpacity(0.7),
                            ),
                            child: Text(title[i], style: const TextStyle(color: Colors.white, fontSize: 25.0, fontFamily: "SF-Pro-Text-Regular")),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}

List<String> images = [
  "assets/images/china.jpg",
  "assets/images/chichen.jpg",
  "assets/images/petra.jpg",
  "assets/images/machu.jpg",
  "assets/images/christ.jpg",
  "assets/images/colosseum.jpg",
  "assets/images/taj.jpg",
];

List<String> title = ["Wall of China", "Chichén Itzá", "Petra", "Machu Picchu", "Christ", "Colosseum", "Taj Mahal"];