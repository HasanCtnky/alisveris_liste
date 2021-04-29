import 'package:http/http.dart' as http;
import 'dart:convert';
import'package:alisveris_liste/item.dart';

class UrunServis{
  final String _serviceUrl= "";

  Future<List<Item>> fetchItems() async {
    final response = await http.get(_serviceUrl);

    if (response.statusCode == 200) {
      Iterable items = json.decode(response.body);

      items.map((item)=>Item.fromJson(item)).toList;
    } else {
      throw Exception("Sunucumuzda bir sorun oldu.");
    }
  }
  Future<Item> addItem(String itemJson)async{
    final response = await http.post(_serviceUrl, headers:{
      'content-type':'application/json'
    },body: itemJson);

    if (response.statusCode == 201){
      Map item = json.decode(response.body);

      return Item.fromJson(item);
    }else {
      throw Exception("Sunucumuzda bir sorun oldu.");
    }
  }
}
