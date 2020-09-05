import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkingHelper {
  NetworkingHelper(this.url);
  final String url;

  Future getHttpReq() async {
    http.Response response = await http.get(url);
    if(response.statusCode==200){
      return jsonDecode(response.body);
    }else{
      return response.statusCode;
    }
  }
}