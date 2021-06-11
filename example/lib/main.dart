import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_horizontal_featured_list/flutter_horizontal_featured_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Color> colors = List.generate(20, (index) => randomColor());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Example'),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: HorizontalFeaturedList(
            itemColorBuilder: (context, index) => colors[index],
            itemCount: colors.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.face,
                        size: 24,
                        color: Colors.black45,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            '($index) What is Lorem Ipsum?',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '($index) Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            onPressedItem: () {},
            onPressedSeeAll: () {},
            titleText: 'Ongoing Projects',
            seeAllText: 'See All',
          ),
        ),
      ),
    );
  }
}

Color randomColor() {
  var g = math.Random.secure().nextInt(255);
  var b = math.Random.secure().nextInt(255);
  var r = math.Random.secure().nextInt(255);
  return Color.fromARGB(255, r, g, b);
}
