// "_id": "0737628064502",
// "_keywords": [
// "and",
// "asia",
// "beverage",
// "cereal",
// "food",
// "gluten",
// "include",
// "kit",
// "kitchen",
// "no",
// "noodle",
// "pasta",
// "peanut",
// "plant-based",
// "potatoe",
// "product",
// "rice",
// "seasoning",
// "simply",
// "stir-fry",
// "thai",
// "thailand",
// "their",
// "vegan",
// "vegetarian"
// ],
// "allergens_tags": [
// "en:peanuts"
// ],
// "brands": "Thai Kitchen,Simply Asia",
// "categories": "Plant-based foods and beverages,Plant-based foods,Cereals and potatoes,Cereals and their products,Pastas,Noodles,Rice Noodles",
// "countries": "France,United States",
// "data_quality_warnings_tags": [
// "en:nutrition-value-very-high-for-category-sugars",
// "en:vegan-label-but-could-not-confirm-for-all-ingredients",
// "en:vegetarian-label-but-could-not-confirm-for-all-ingredients",
// "en:ecoscore-packaging-unscored-shape",
// "en:ecoscore-production-system-no-label"
// ],
// "generic_name_en": "Rice Noodles",
// "image_front_small_url": "https://images.openfoodfacts.org/images/products/073/762/806/4502/front_en.6.200.jpg",
// "ingredients": [
// {
// "id": "en:noodle",
// "percent_estimate": 53.8461538461538,
// "percent_max": 100,
// "percent_min": 7.69230769230769,
// "text": "Noodle",
// "vegan": "maybe",
// "vegetarian": "maybe"
// },
// ],
// "ingredients_text_en": "Noodle: rice, water. seasoning packet: peanut, sugar, hydrolyzed soy protein, green onion, corn maltodextrin, spice (including paprika), citric acid, sea salt, extractives of paprika (color), silicon dioxide (added to make free flowing), yeast extract.",
// "product_name_en": "Thai peanut noodle kit includes stir-fry rice noodles & thai peanut seasoning",

class FoodProduct {
  String id;
  List<String> keywords;
  List<String> allergensTags;
  String brands;
  String categories;
  List<String> countries;
  List<String> dataQualityWarningsTags;
  String genericNameEn;
  String imageFrontSmallUrl;
  List<Ingredient> ingredients;
  String ingredientsTextEn;
  String productNameEn;

  FoodProduct({
    required this.id,
    required this.keywords,
    required this.allergensTags,
    required this.brands,
    required this.categories,
    required this.countries,
    required this.dataQualityWarningsTags,
    required this.genericNameEn,
    required this.imageFrontSmallUrl,
    required this.ingredients,
    required this.ingredientsTextEn,
    required this.productNameEn,
  });

  factory FoodProduct.fromJson(Map<String, dynamic> json) {
    return FoodProduct(
      id: json['_id'],
      keywords: List<String>.from(json['_keywords']),
      allergensTags: List<String>.from(json['allergens_tags']),
      brands: json['brands'],
      categories: json['categories'],
      countries: List<String>.from(json['countries']),
      dataQualityWarningsTags: List<String>.from(json['data_quality_warnings_tags']),
      genericNameEn: json['generic_name_en'],
      imageFrontSmallUrl: json['image_front_small_url'],
      ingredients: List<Ingredient>.from(json['ingredients'].map((ingredient) => Ingredient.fromJson(ingredient))),
      ingredientsTextEn: json['ingredients_text_en'],
      productNameEn: json['product_name_en'],
    );
  }
}

class Ingredient {
  String id;
  double percentEstimate;
  double percentMax;
  double percentMin;
  String text;
  String vegan;
  String vegetarian;

  Ingredient({
    required this.id,
    required this.percentEstimate,
    required this.percentMax,
    required this.percentMin,
    required this.text,
    required this.vegan,
    required this.vegetarian,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      percentEstimate: json['percent_estimate'].toDouble(),
      percentMax: json['percent_max'].toDouble(),
      percentMin: json['percent_min'].toDouble(),
      text: json['text'],
      vegan: json['vegan'],
      vegetarian: json['vegetarian'],
    );
  }
}
