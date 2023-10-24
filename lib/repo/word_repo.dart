import 'dart:io';

import 'package:block/model/word.dart';
import 'package:block/service/http_service.dart';

class WordRepository{
  Future<List<Word>> getWordsFromDictionary(String query)async{
    try {
      final response = await HttpService.getRequest("en_US/$query");

      if(response.statusCode == 200){
        final result = wordFromJson(response.body);
        return result;
      }else{
        return [];
      }
    } on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    }
  }
}