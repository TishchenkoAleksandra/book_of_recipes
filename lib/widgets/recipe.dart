import 'package:cook/models/recipe_mod.dart';
import 'package:flutter/material.dart';
import 'package:cook/pages/home_page.dart';

class RecipeItem extends StatelessWidget {
  final Recipe_Data recipe;
  const RecipeItem({
    Key? key, required this.recipe,
  }) :super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: MediaQuery.of(context).size.height*0.2+10,
      //width: MediaQuery.of(context).size.width*0.9,
      height: MediaQuery.of(context).size.height*0.2-10,
      width: MediaQuery.of(context).size.width*0.9,
      child: Stack(
        children: [
          Positioned(
            top: 5,
            left: 10,
            child: Container(
                      height: MediaQuery.of(context).size.height*0.2-40,
                      width: MediaQuery.of(context).size.width*0.9-20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 255, 203, 207),
                        boxShadow: [
            BoxShadow(
              offset: const Offset(3, 3),
              color: Colors.brown,
              spreadRadius: 0,
              blurRadius: 5
            )
                        ]
                      ),
            ),
          ),
          Positioned(
            top: 16,
            left: 20,
            right: 0,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Stack(
                    children: [
                      Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        border: Border.all(color: Color.fromARGB(255, 224, 28, 80)),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                           //image: NetworkImage('https://kedem.ru/photo/recipe/rname/garenyj-ris-s-ovoshchami.jpg')
                           image: NetworkImage(recipe.imageUrl!)
                        )
                      ),
                      //child: Image(image: NetworkImage(items[index].imageUrl.toString()),fit: BoxFit.fill,),
                    ),
                    ],
                  ),
                ),
                SizedBox(width: 5),
                    Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recipe.name!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87
              ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.access_time, color: Colors.black,),
                  Text(
                    recipe.opis!,
                  //maxLines: 2, overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.brown
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400, 
                    fontStyle: FontStyle.italic,
                    overflow: TextOverflow.ellipsis,
                  ),
                  ),
                ],
              ),
            ],
                    ),
              ],
            ),
          ),

          
        ],
      ),
    );
  }
}


