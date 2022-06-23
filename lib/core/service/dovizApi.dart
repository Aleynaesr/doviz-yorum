import 'dart:convert';
import 'package:doviz_yorum/core/model/doviz.dart';
import 'package:doviz_yorum/core/utils/constants.dart';
import 'package:http/http.dart' as http;

//Fetching exchange result from api
class DovizApi {
  Future<Doviz> fetchDoviz(String from, String to, String amount) async {
    String path = dovizYorumJson + "convert?to=$to&from=$from&amount=$amount";

    print(path);

    final data;

    final response = await http.get(
      Uri.parse(path),
      headers: {'apikey': 'U4zdDtyrFf55C9nMzSAVEzM83fd9x34u'},
    );

    if (response.statusCode == 200) {
      data = Doviz.fromJson(json.decode(response.body));
      print("Successfully converted from $from to $to : " + data.result);

      return data;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
