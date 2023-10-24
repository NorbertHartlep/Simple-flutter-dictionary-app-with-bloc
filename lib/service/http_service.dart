import 'package:http/http.dart' as http;

class HttpService{
  static const baseUrl = "https://api.dictionaryapi.dev/api/v2/entries/";

  static Future<http.Response> getRequest(String endpoint) async{
    Uri url = Uri.parse("$baseUrl$endpoint");
    http.Response response;
    try {
      response = await http.get(url);
    }
    catch(e){
      rethrow;
    }
    return response;
  }
}