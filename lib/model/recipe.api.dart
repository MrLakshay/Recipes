import 'dart:convert';
import 'recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(
        'yummly2.p.rapidapi.com', '/feeds/list', {"limit": "18", "start": "0"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "ec19a32e17mshab5bcf35532c754p1aebb3jsncb5ff3762cdc",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true",
    });

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['feed']) {
      if (i['type'] == "single recipe") temp.add(i['content']['details']);
    }

    return Recipe.recipeFromSnapshot(temp);
  }
}
