import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rest/model/food_model.dart';

import '../shared/constants.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.food});

  final FoodModel food;
  static ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                CarouselSlider(
                    items: List.generate(
                        food.images.length,
                        (index) => Image.network(
                              food.images[index],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.network(
                                noImage,
                                fit: BoxFit.cover,
                              ),
                            )),
                    options: CarouselOptions(
                        autoPlay: true, viewportFraction: 1, aspectRatio: 1))
              ],
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.width - 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    // margin: EdgeInsets.only(
                    //     top: MediaQuery.of(context).size.width - 20),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 8)
                        ],
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(24))),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              food.title,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: primary.withOpacity(.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text.rich(TextSpan(
                                  text: "₹ ",
                                  style: const TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: food.price,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade900,
                                            fontWeight: FontWeight.bold))
                                  ])),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text.rich(
                          TextSpan(
                              text: "Description: ",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                              children: [
                                TextSpan(
                                    text: food.description,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.w300))
                              ]),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: const [
                            Text(
                              "Vitamins",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Wrap(
                              spacing: 12,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: List.generate(
                                  food.vitamins.length,
                                  (index) => Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            border: Border.all(
                                                color:
                                                    primary.withOpacity(.4))),
                                        child: Text(
                                          food.vitamins[index],
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      )),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: const [
                            Text(
                              "Minerals",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        const Divider(),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            spacing: 12,
                            runSpacing: 8,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: List.generate(
                                food.minerals.length,
                                (index) => Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 2),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: primary.withOpacity(.1)),
                                      child: Text(
                                        food.minerals[index],
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    )),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: const [
                            Text(
                              "Pros",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        const Divider(),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: List.generate(
                                  food.pros.length,
                                  (index) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.5, right: 8),
                                              child: Icon(
                                                CupertinoIcons.circle_fill,
                                                color: Colors.grey.shade300,
                                                size: 14,
                                              ),
                                            ),
                                            Expanded(
                                                child: Text(food.pros[index]))
                                          ],
                                        ),
                                      )),
                            )),
                        const SizedBox(height: 12),
                        Row(
                          children: const [
                            Text(
                              "Cons",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        const Divider(),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: List.generate(
                                  food.cons.length,
                                  (index) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.5, right: 8),
                                              child: Icon(
                                                CupertinoIcons.circle_fill,
                                                color: Colors.grey.shade300,
                                                size: 14,
                                              ),
                                            ),
                                            Expanded(
                                                child: Text(food.cons[index]))
                                          ],
                                        ),
                                      )),
                            )),
                        SizedBox(
                            height: MediaQuery.of(context).padding.bottom + 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 8.0, left: 6),
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        color: Colors.white54, shape: BoxShape.circle),
                    child: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class ImageAppbar extends StatelessWidget {
  const ImageAppbar({
    Key? key,
    required String heroTag,
    required FoodModel item,
  })  : _heroTag = heroTag,
        _item = item,
        super(key: key);

  final String _heroTag;
  final FoodModel _item;
//  stretchModes: const [StretchMode.zoomBackground],
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      expandedHeight: MediaQuery.of(context).size.width,
      stretch: true,
      onStretchTrigger: () async => Navigator.of(context).pop(),
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true, //Text
          background: Hero(
            tag: _heroTag,
            child: Image.network(
              _item.images.first,
              fit: BoxFit.cover,
              errorBuilder: (context, _, __) => Image.network(
                noImage,
                fit: BoxFit.cover,
              ),
            ),
          )),
      /* flexibleSpace: FlexibleSpaceBar(
        title: Image.network(
          _item.images.first,
          errorBuilder: (context, error, stackTrace) => Image.network(noImage),
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
        ),
        stretchModes: const [StretchMode.zoomBackground],
        background: Hero(
          tag: _heroTag,
          child: Image.network(
            _item.images.first,
            errorBuilder: (context, error, stackTrace) =>
                Image.network(noImage),
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
          ), /* Container(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(45)),
              boxShadow: [
                BoxShadow(blurRadius: 6, color: Colors.black.withOpacity(.1))
              ],
              image: DecorationImage(
                  image: NetworkImage(
                    _item.images.first,
                  ),
                  fit: BoxFit.cover),
            ),
          ), */
        ),
      ), */
      title: ClipRRect(
        borderRadius: BorderRadius.circular(45),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.black12,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _item.title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
