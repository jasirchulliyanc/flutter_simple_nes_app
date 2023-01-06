// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';
import 'package:news_app/news_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<News> newses = [];
  Future getNews() async {
    var response = await http.get(Uri.https(
        'newsapi.org', '/v2/top-headlines', {
      'sources': 'google-news-in',
      'apiKey': '932386bb414b4daabbc622539fe50725'
    }));
    // var uri = Uri.https('example.org', '/path', {'q': 'dart'});
    var news = jsonDecode(response.body);
    for (var eachNews in news['articles']) {
      final news = News(
          author: eachNews['author'].toString(),
          title: eachNews['title'].toString(),
          description: eachNews['description'].toString(),
          imageUrl: eachNews['urlToImage'].toString());
      newses.add(news);
    }
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.amber[500],
          unselectedItemColor: Colors.grey,
          // fixedColor: Colors.red,
          elevation: 5,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.article), label: 'News'),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.feed,
                ),
                label: 'Feed'),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                ),
                label: 'Notification'),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_off_outlined,
                ),
                label: 'Profile')
          ]),
      body: FutureBuilder(
        future: getNews(),
        builder: (context, snapshot) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'News',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.search)
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Discover things of this world',
                          style: TextStyle(
                            color: Colors.grey[300],
                          ),
                        )
                      ],
                    )
                  ]),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'TOP AUTHORS',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: newses.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              radius: 28,
                              backgroundImage: NetworkImage(
                                  'https://miro.medium.com/fit/c/88/88/1*AhHz0TLi6tWJ_-SiLSAXEg.jpeg'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                                overflow: TextOverflow.ellipsis,
                                newses[index].author,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Text(
                        'TOP NEWS',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: newses.length,
                    itemBuilder: (context, index) {
                      return NewsList(
                        imageUrl: newses[index].imageUrl,
                        text: newses[index].title,
                        author: newses[index].author,
                      );
                    },
                  ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
