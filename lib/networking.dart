import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final url = 'https://newprod.zypher.co/ebooks/getHome';
  Future getData() async {
    http.Response response = await http.post(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
