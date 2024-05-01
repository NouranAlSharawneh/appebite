import 'dart:convert';
import 'package:http/http.dart' as http;

class RecipeService {
  final String apiKey;

  RecipeService(this.apiKey);

  Future<List<Map<String, dynamic>>> fetchBreakfastRecipes({int number = 10}) async {
    final url =
        'https://api.spoonacular.com/recipes/random?apiKey=$apiKey&number=$number&tags=breakfast';
    
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['recipes'];
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}