import 'package:block/model/word.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Word wordResponse;

  const DetailScreen(this.wordResponse, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Container(
        padding: const EdgeInsets.all(32),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "${wordResponse.word}",
              style: const TextStyle(color: Colors.white, fontSize: 36),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final meaning = wordResponse.meanings[index];
                  final definations = meaning.definitions;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meaning.partOfSpeech,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 8,),
                      ListView.separated(
                        itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Defination : "+ definations[index].definition, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            const SizedBox(height: 4,),
                            Text("Sentence  : ${definations[index].example}", style: const TextStyle(color: Colors.white),),
                          ],
                        ),
                        separatorBuilder: (context, index) => const SizedBox(height: 8,),
                        itemCount: definations.length,
                        shrinkWrap: true,
                      )
                    ],
                  );
                },
                itemCount: wordResponse.meanings.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 32,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}