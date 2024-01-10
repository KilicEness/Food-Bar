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
    required this.ingredientsTextEn,
    required this.productNameEn,
  });

  factory FoodProduct.fromJson(Map<String, dynamic> json) {
    return FoodProduct(
      id: json['product']['_id'],
      keywords: List<String>.from(json['product']['_keywords']),
      allergensTags: List<String>.from(json['product']['allergens_tags']),
      brands: json['product']['brands'],
      categories: json['product']['categories'],
      countries: List<String>.from(json['product']['countries']),
      dataQualityWarningsTags:
          List<String>.from(json['product']['data_quality_warnings_tags']),
      genericNameEn: json['product']['generic_name_en'],
      imageFrontSmallUrl: json['product']['image_front_small_url'],
      ingredientsTextEn: json['product']['ingredients_text_en'],
      productNameEn: json['product']['product_name_en'],
    );
  }
}
