import 'dart:convert';

import 'package:appebite/app/data/Model/response_model.dart';
import 'package:http/http.dart' as http;

class AiRepository {
  // This function will perform the API call with the necessary data, and return the response model object
  Future<dynamic> askAI(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer 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'
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              "role": "user",
              "content": "Create a recipe from a list of ingredients: $prompt "
                  "Give the output in a json format. Put name in 'name' key, "
                  "ingredients in 'ingredients' key and recipe in 'recipe' key, "
                  "separate every step in recipe with a new line character"
            }
          ],
          "max_tokens": 700,
          "temperature": 1
        }),
      );
      return ResponseModel.fromJson(json.decode(response.body));
    } catch (e) {
      return e.toString();
    }
  }
}
