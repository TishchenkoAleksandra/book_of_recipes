import 'package:cook/pages/detail.dart';
import 'package:flutter/material.dart';
import 'package:cook/models/categ_mod.dart';
import 'package:cook/models/recipe_mod.dart';
import 'package:flutter/services.dart' as rootBoundle;
import 'dart:convert';
import 'package:cook/widgets/category.dart';
import 'package:cook/pages/detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:cook/widgets/recipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async';
import 'dart:core';
import 'package:cook/widgets/page.dart';



class VtorPage extends StatefulWidget {
  const VtorPage({Key? key}) : super(key: key);
  @override
  State<VtorPage> createState() => _VtorPageState();
}
class _VtorPageState extends State<VtorPage> {
  String selectedRecipe = 'Кексы';
  List<Recipe_Data> dataRecipe = [];

  Future<void> getRecipe() async {
    final String response = await rootBoundle.rootBundle.loadString('jsonfile/vtoroye.json');
    final data = json.decode(response);
    setState(() {
      for (var element in data['vtoroye']) {
        dataRecipe.add(Recipe_Data.fromJson(element));
        //searchResult.add(Recipe_Data.fromJson(element));
      }
    });
  }


  @override
  void initState() {
    getRecipe();
    super.initState();
  }

  @override
  void dispose() {
    getRecipe();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Рецепты вторых блюд',style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              
            )
            ),
            backgroundColor: Color.fromARGB(255, 224, 28, 80),
            ),
            body: Column(
              children: [
                Page1(dataRecipe: dataRecipe)
              ],
            ),


    );

  }

}
