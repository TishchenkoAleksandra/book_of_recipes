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
class Page1 extends StatelessWidget {
  const Page1({
    super.key,
    required this.dataRecipe,
  });

  final List<Recipe_Data> dataRecipe;

  @override
  Widget build(BuildContext context) {
    return Expanded(
     child: 
    SingleChildScrollView(
       keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
       scrollDirection: Axis.vertical,
       child: Column(
         children: 
           List.generate(dataRecipe.length, (index) => Padding(
             padding: index==0? const EdgeInsets.symmetric(vertical: 5): const EdgeInsets.symmetric(vertical: 5),
             child: CupertinoButton(
               onPressed: () {
             showCupertinoModalPopup(context: context, builder: (context) => RecipeDetail(recipe: dataRecipe[index]));
           },
               child: RecipeItem(
                 recipe: dataRecipe[index],
               ),
             ),
           ))
         ,
       ),
     )
            );
  }
}

