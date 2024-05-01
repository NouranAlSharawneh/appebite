class Recipe {
  final String name;
  double? rating;
  String totalTime;
  final String? hostedLargeUrl;
   int? calories;
   int servings;
  final String? diet; // Add diet property
  final int id;
  

  Recipe({
    required this.name,
    required this.rating , // Default rating value
    required this.totalTime, // Default totalTime value
    required this.hostedLargeUrl,
    required this.calories , // Default calories value
    required this.servings, // Default servings value
    this.diet, // Default diet value
     required this.id,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
   
    return Recipe(
      id: json['id'], 
      name: json['title'] ?? '',
    rating: json['spoonacularScore'] != null ? json['spoonacularScore'].toDouble() : 2.0,
    totalTime: json['readyInMinutes'] != null ? json['readyInMinutes'].toString() : 'Unknown',
    hostedLargeUrl: json['image'],
    calories: json['nutrition'] != null ? json['nutrition']['nutrients'][0]['amount'].toInt() : null,
    servings: json['servings'] ?? 1,
    diet: json['diets'] != null ? json['diets'].first.toString() : '',
    );
  }
  

  static List<Recipe> recipesFromSnapshot(List? snapshot) {
    if (snapshot == null) {
      return [];
    }
    return snapshot
        .where((data) => data != null)
        .map((data) {
          return Recipe.fromJson(data!);
        })
        .toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $hostedLargeUrl, rating: $rating, totalTime: $totalTime, calories: $calories, servings: $servings, diet: $diet}'; // Include diet in toString
  }
}
