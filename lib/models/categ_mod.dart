class CategoryModel {
  String? name_cat;
  int? id;

  CategoryModel({id, required this.name_cat});
  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name_cat = json['name_cat'];
  }
}