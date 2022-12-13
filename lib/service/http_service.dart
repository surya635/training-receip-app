import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:food_app/model/post_model.dart';

class HttpService {
  static Future<List<Posts>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "deebe840aamsh3f4fc4878b9a35fp19babdjsn4bced86b6958",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Posts.recipesFromSnapshot(_temp);
  }
}
