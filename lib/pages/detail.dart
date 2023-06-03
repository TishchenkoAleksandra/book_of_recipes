import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cook/models/recipe_mod.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe_Data recipe;
  const RecipeDetail({Key? key, required this.recipe}) : super (key: key);
  @override
  State<RecipeDetail> createState() => _RecipeDetail();
}

class _RecipeDetail extends State<RecipeDetail> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height * .9,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 224, 227),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildListDelegate([
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Text(widget.recipe.name!,
                  style: CupertinoTheme.of(context)
                  .textTheme
                  .navLargeTitleTextStyle,
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 224, 28, 80)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.network(widget.recipe.imageUrl!,
                    fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.black87),
                      SizedBox(width: 5),
                      Text(widget.recipe.opis!,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.none,
                      ),
                      ),
                      
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Список ингредиентов',
                  style: CupertinoTheme.of(context)
                  .textTheme
                  .navTitleTextStyle
                  .copyWith(
                    fontSize: 25,
                  ),
                  ),
                  SizedBox(height: 15),
                  //Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    //children: [
                      Text(widget.recipe.ingr!,
                      style: TextStyle(color: Colors.black87, fontSize: 18, decoration: TextDecoration.none),
                      ),
                  SizedBox(height: 20),
                  Text('Приготовление',
                  style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(fontSize: 25),
                  ),
                  SizedBox(height: 15),
                  Text(widget.recipe.recipe!,
                  style: TextStyle(color: Colors.black87, fontSize: 18, decoration: TextDecoration.none)
                  ),
                    //],
                  //),
                  SizedBox(height: 40),
                  Center(
                    child: CupertinoButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      color: Color.fromARGB(255, 224, 28, 80),
                      child: Text('Назад'),
                    ),
                  ),
                  SizedBox(height: 20),
                  /*Center(
                    child: CupertinoButton(
                      onPressed: (){
                        showCupertinoDialog(
                        context: context, 
                        builder: (context){
                          return CupertinoAlertDialog(
                          title: Text('Вы уверены?'),
                          actions: [
                            CupertinoDialogAction(
                              child: Text('Отмена'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text('Да'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        );
                        },
                        );
                      },
                      color: Color.fromARGB(255, 15, 146, 141),
                      child: Text('Удалить'),
                  ),
                  ),*/
                  //SizedBox(height: 40),
                  ],
                )
            ]))
          ],
        ),
      ),
    );
  }
}