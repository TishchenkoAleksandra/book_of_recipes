import 'package:cook/pages/detail.dart';
import 'package:cook/pages/sup_page.dart';
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
import 'package:cook/main.dart';
import 'package:cook/pages/zakusra_page.dart';
import 'package:cook/pages/desert_page.dart';
import 'package:cook/pages/vtoroye_page.dart';
import 'package:cook/pages/sup_page.dart';




class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();

}
class _HomePageState extends State<HomePage> {
  final pageController = PageController();
  TextEditingController _searchControl = new TextEditingController();
  String selectedCategory = 'Закуски';
  String selectedRecipe = 'Кексы';
  List<CategoryModel> dataCategory = [];
  List<Recipe_Data> dataRecipe = [];
  List<Recipe_Data> searchResult = [];

  int selected = 0;

  Future<void> getCategory() async {
    final String response = await rootBoundle.rootBundle.loadString('jsonfile/categ.json');
    //final String response = await rootBoundle.loadString('jsonfile/categ.json');
    final data = json.decode(response);
    setState(() {
      for (var element in data['categ']) {
        dataCategory.add(CategoryModel.fromJson(element));
      }
    });
  }

  Future<void> getRecipe() async {
    final String response = await rootBoundle.rootBundle.loadString('jsonfile/recipe.json');
    final data = json.decode(response);
    setState(() {
      for (var element in data['recipe']) {
        dataRecipe.add(Recipe_Data.fromJson(element));
        //searchResult.add(Recipe_Data.fromJson(element));
      }
    });
  }


  @override
  void initState() {
    getCategory();
    getRecipe();
    super.initState();
    searchResult = dataRecipe;
    
  }

  @override
  void dispose() {
    getCategory();
    getRecipe();
    super.dispose();
  }
  
 void searchRecipe(String query) {
  final suggestion = searchResult.where((element) {
     final title = element.name!.toLowerCase();
     final input = query.toLowerCase();

     return title.contains(input);
  }).toList();
  setState(() {
    //searchResult = suggestion;
    dataRecipe = suggestion;
  });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Книга Рецептов',
              style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              
            )),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(31, 165, 165, 165),
              ),
            child: TextFormField(
            onChanged: searchRecipe,              
              controller: _searchControl,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Введите название рецепта...',
                hintStyle: TextStyle(fontSize: 20, color: Colors.black26),
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.black26,
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchControl.clear();
                  },
                  
                  )
              ),
            ),
            ),
          ),
          const SizedBox(height: 20),
          /*SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row (children: List.generate(dataCategory.length, (index) => Padding(
              padding: index==0? const EdgeInsets.only(left: 20, right: 20):EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = dataCategory[index].name_cat!;
                  });
                  pageController.jumpToPage(index);
                },
                child: CategoryItem(
                  categ: dataCategory[index],
                  selectedCategory: selectedCategory,
                ),
              ),
            )),
            ),
          ),*/
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: CupertinoButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ZakPage()));
                      },
                      child: Container(
                        height: 90,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 224, 28, 80),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(
                            offset: const Offset(3, 3),
                            color: Colors.brown,
                            spreadRadius: 0,
                            blurRadius: 5
                          )]
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 7,
                              left: 10,
                              child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                //color: Colors.blueGrey,
                                //border: Border.all(color: Color.fromARGB(255, 224, 28, 80)),
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                   //image: NetworkImage('https://pngicon.ru/file/uploads/sup.png')
                                   image: NetworkImage('https://img.icons8.com/?size=1x&id=cpjI6tcPnjEb&format=png')
                                )
                              ),
                              ),
                            ),
                            Positioned(
                              top: 27,
                              left: 90,
                              child: Text('Закуски', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 24)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: CupertinoButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SupPage()));
                      },
                      child: Container(
                        height: 90,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 224, 28, 80),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(
                            offset: const Offset(3, 3),
                            color: Colors.brown,
                            spreadRadius: 0,
                            blurRadius: 5
                          )]
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 7,
                              left: 10,
                              child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                //color: Colors.blueGrey,
                                //border: Border.all(color: Color.fromARGB(255, 224, 28, 80)),
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                   //image: NetworkImage('https://pngicon.ru/file/uploads/sup.png')
                                   image: NetworkImage('https://img.icons8.com/?size=512&id=81383&format=png')
                                )
                              ),
                              ),
                            ),
                            Positioned(
                              top: 27,
                              left: 100,
                              child: Text('Супы', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 26)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: CupertinoButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const VtorPage()));
                      },
                      child: Container(
                        height: 90,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 224, 28, 80),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(
                            offset: const Offset(3, 3),
                            color: Colors.brown,
                            spreadRadius: 0,
                            blurRadius: 5
                          )]
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 7,
                              left: 10,
                              child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                //color: Colors.blueGrey,
                                //border: Border.all(color: Color.fromARGB(255, 224, 28, 80)),
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                   //image: NetworkImage('https://pngicon.ru/file/uploads/sup.png')
                                   image: NetworkImage('https://img.icons8.com/?size=512&id=81211&format=png')
                                )
                              ),
                              ),
                            ),
                            Positioned(
                              top: 27,
                              left: 95,
                              child: Text('Второе', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 24)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  CupertinoButton(
                    onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DesPage()));
                      },
                    child: Container(
                      height: 90,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 224, 28, 80),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(
                          offset: const Offset(3, 3),
                          color: Colors.brown,
                          spreadRadius: 0,
                          blurRadius: 5
                        )]
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 7,
                            left: 10,
                            child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              //color: Colors.blueGrey,
                              //border: Border.all(color: Color.fromARGB(255, 224, 28, 80)),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                 //image: NetworkImage('https://pngicon.ru/file/uploads/sup.png')
                                 image: NetworkImage('https://img.icons8.com/?size=1x&id=81214&format=png')
                              )
                            ),
                            ),
                          ),
                          Positioned(
                            top: 27,
                            left: 87,
                            child: Text('Десерты', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 24)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),  
          Text('Все рецепты', style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold, color: Colors.black),),
          SizedBox(height: 10),    
              Page1(dataRecipe: dataRecipe)    
        ]
        ),
    

    );

  }

}

/*class Page1 extends StatelessWidget {
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
}*/

