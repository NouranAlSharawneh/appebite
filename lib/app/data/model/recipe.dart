class Recipe {
  String name;
  String recipe;

  Recipe(this.name, this.recipe);

  static Recipe fromJson(json) => Recipe(json['name'], json['recipe']);
}
