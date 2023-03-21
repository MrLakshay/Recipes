class Recipe{
  final String name;
  final String images;
  final double rating;
  final String totalTime;
  Recipe({this.images, this.rating, this.totalTime, this.name});
  factory Recipe.fromJson(dynamic json){
    return Recipe(
      name: json['name'] as String,
      rating: json['rating'] as double,
      totalTime: json['totalTime'] as String,
      images: json['images'][0]['hostedLargeUrl'] as String,
    );
  }

  static List<Recipe> recipeFromSnapshot(List snapshot){
    return snapshot.map(
        (data){
          return Recipe.fromJson(data);
        }
    ).toList();
  }
  @override
  String toString(){
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}