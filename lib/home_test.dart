import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


class HomeTest extends StatefulWidget {
  @override
  State createState() => _HomeTest();
}

class _HomeTest extends State<HomeTest> {

  @override
  Widget build(BuildContext context) {
    developer.log('build called');

    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 140,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/home_logo.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            )
          ),
          FutureBuilder(
            future: futureAlbum,
            builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text((snapshot.data! as Album).title);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          }, ),

          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 15, right: 15),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 4.0),
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xffFFDB5F),
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: GestureDetector(
                onTap: () => {
                  Navigator.of(context).pushNamed('/b')
                },
                child: const Text(
                  '도전하기',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      textBaseline: TextBaseline.ideographic),
                ),
              )
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 4.0),
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xff43DD65),
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: const Text(
                '랭킹보기',
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    textBaseline: TextBaseline.ideographic),
              ),
            ),
          ),
        ],
      ),
    );
  }

  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();

    futureAlbum = fetchAlbum();
  }
}
