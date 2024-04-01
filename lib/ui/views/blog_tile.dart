import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BlogTile extends StatelessWidget {
  final String urlToImage, title, desc;
  const BlogTile(
      {super.key,
      required this.urlToImage,
      required this.title,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
      future: http.head(Uri.parse(urlToImage)),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.statusCode == 200) {
          return Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: <Widget>[
                  Image.network(urlToImage,
                      width: MediaQuery.of(context).size.width * 0.7,
                      fit: BoxFit.fill),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    desc,
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ));
        } else {
          return Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    desc,
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ));
        }
      },
    );
  }
}
