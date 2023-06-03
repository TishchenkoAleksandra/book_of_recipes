class Recipe_Data {
  int? id;
  String? categ;
  String? name;
  String? opis;
  String? ingr;
  String? imageUrl;
  String? recipe;

  
  Recipe_Data({this.id, this.categ, this.name, this.opis, this.ingr, this.imageUrl, this.recipe});
  Recipe_Data.fromJson(Map<String,dynamic> json){
    id = json['id'];
    categ = json['categ'];
    name = json['name'];
    opis = json['opis'];
    ingr = json['ingr'];
    imageUrl = json['imageUrl'];
    recipe = json['recipe'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'categ': categ,
        'name': name,
        'opis': opis,
        'ingr': ingr,
        'imageUrl': imageUrl,
        'recipe' : recipe,
      };

 
}

