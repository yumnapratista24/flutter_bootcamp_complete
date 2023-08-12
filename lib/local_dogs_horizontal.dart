import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_new_app/models/dog.dart';
import 'package:flutter_new_app/widgets/dog_profile_card.dart';

class LocalDogsHorizontal extends StatefulWidget {
  const LocalDogsHorizontal({super.key});

  @override
  State<LocalDogsHorizontal> createState() => _LocalDogsHorizontalState();
}

class _LocalDogsHorizontalState extends State<LocalDogsHorizontal> {
  bool isLoading = true;
  Dog? dog;

  List<Dog> dogs = <Dog>[
    Dog(
      name: 'dog 1',
      imageUrl:
          'https://images.dog.ceo/breeds/schnauzer-miniature/n02097047_2605.jpg',
      type: 'bulldog',
    ),
    Dog(
      name: 'dog 2',
      imageUrl:
          'https://images.dog.ceo/breeds/schnauzer-miniature/n02097047_2605.jpg',
      type: 'bulldog',
    ),
    Dog(
      name: 'dog 3',
      imageUrl:
          'https://images.dog.ceo/breeds/schnauzer-miniature/n02097047_2605.jpg',
      type: 'bulldog',
    ),
    Dog(
      name: 'dog 4',
      imageUrl:
          'https://images.dog.ceo/breeds/schnauzer-miniature/n02097047_2605.jpg',
      type: 'bulldog',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: dogs.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final Dog dog = dogs[index];

            return DogProfileCard(
              imageUrl: dog.imageUrl,
              name: dog.name,
              type: dog.type,
            );
          },
        ));
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/multiple_dogs.json');

    final Map<String, dynamic> data = await json.decode(response);

    Dog res = Dog(
      imageUrl: data['imageUrl'],
      type: data['type'],
      name: data['name'],
    );

    setState(() {
      dog = res;
    });
  }
}
