import 'package:flutter/material.dart';

import '../model/food_model.dart';
import '../shared/constants.dart';
import 'details.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    Key? key,
    required this.food,
  }) : super(key: key);

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailsView(food: food)),
      ),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                ),
                BoxShadow(
                    color: Colors.white,
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: Offset(-3, -3))
              ]),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12), bottom: Radius.circular(2)),
                    child: Image.network(
                      food.images.length <= 3
                          ? food.images.first
                          : food.images[3],
                      errorBuilder: (context, error, stackTrace) =>
                          Image.network(noImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * .5,
                    decoration: const BoxDecoration(
                        // color: Colors.amber,
                        gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.white24],
                      end: Alignment.bottomLeft,
                      begin: Alignment.topLeft,
                    )),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                food.title,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text.rich(TextSpan(text: ))
                      Text(
                        food.description,
                        maxLines: 3,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
