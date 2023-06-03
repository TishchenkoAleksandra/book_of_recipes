import 'package:cook/models/categ_mod.dart';
import 'package:flutter/material.dart';
class CategoryItem extends StatelessWidget {
  final CategoryModel categ;
  final String selectedCategory;
  const CategoryItem({
    Key? key, required this.categ, required this.selectedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 
      const EdgeInsets.only(left: 10, top: 10,right: 20, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 224, 28, 80)),
        borderRadius: BorderRadius.circular(20),
        color: selectedCategory==categ.name_cat?Color.fromARGB(255, 224, 28, 80):Colors.white,
      ),
      child: Row(children: [
        const SizedBox(width: 10),
        Text(
          categ.name_cat!,
          style: TextStyle(fontSize: 18, color: selectedCategory==categ.name_cat? Colors.white: Color.fromARGB(255, 224, 28, 80),),
        )
      ]),
    );
  }
}
