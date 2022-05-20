import 'package:flutter/material.dart';

import '../model/food_model.dart';
import '../shared/constants.dart';
import 'card.dart';
import 'details.dart';

class FoodListBuilder extends StatelessWidget {
  const FoodListBuilder({
    Key? key,
    required this.foodList,
  }) : super(key: key);

  final List<FoodModel> foodList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
      shrinkWrap: true,
      itemCount: foodList.length,
      itemBuilder: (BuildContext context, int index) {
        final food = foodList[index];
        return FoodCard(food: food);
      },
    );
  }
}
