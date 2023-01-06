import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  final color;
  final text;
  final author;
  final String imageUrl;
  const NewsList({super.key, this.color, this.text, required this.imageUrl, this.author,});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                height: 150,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                  height: 250,
                  width: 400,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          text,
                          style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 28,
                              backgroundImage: NetworkImage(
                                  'https://miro.medium.com/fit/c/88/88/1*AhHz0TLi6tWJ_-SiLSAXEg.jpeg'),
                            ),
                            title: Text(
                              author,
                              selectionColor: Colors.orange[300],
                            ),
                            subtitle: Text("Today"),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
