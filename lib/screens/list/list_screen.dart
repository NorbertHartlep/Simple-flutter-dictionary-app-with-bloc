import 'package:block/model/word.dart';
import 'package:block/screens/detail/detail_screen.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final List<Word> words;

  ListScreen(this.words);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(
            "${index + 1}. ${words[index].word}",
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(words[index]),
              ),
            );
          },
        ),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
        itemCount: words.length,
      ),
    );
  }
}