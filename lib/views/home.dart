import 'dart:convert';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:rest/shared/constants.dart';
import 'package:rest/views/details.dart';
import '../model/food_model.dart';
import 'appbar.dart';
import 'list_builder.dart';

Future<List<FoodModel>> isolatedConvertor(data) async {
  try {
    List<FoodModel> list = <FoodModel>[];
    for (var element in data) {
      final food = FoodModel.fromJsonData(element);
      if (food != null) list.add(food);
    }
    return list;
  } catch (e) {
    debugPrint(e.toString());
    return [];
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = false;
  List<FoodModel> foodList = <FoodModel>[];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 245, 246),
      appBar: const GlassBar(),
      extendBodyBehindAppBar: true,
      body: RefreshIndicator(
        edgeOffset: 80,
        onRefresh: () async => getData(),
        child: loading
            ? const Center(child: CircularProgressIndicator.adaptive())
            : FoodListBuilder(foodList: foodList),
      ),
    );
  }

  getData() async {
    try {
      setloading(true);
      debugPrint("Fetching data...");
      final body = {"practical_type": "3"};
      final response = await http.post(Uri.parse(appUrl), body: body);
      debugPrint('Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        foodList = await compute(isolatedConvertor, jsonData['data']);
        debugPrint("Found ${foodList.length} results");
      }
      setloading(false);
    } catch (e) {
      debugPrint(e.toString());
      setloading(false);
    }
  }

  setloading(bool isIt) => setState(() => loading = isIt);
}
