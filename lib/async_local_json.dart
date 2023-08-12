import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_new_app/models/dog.dart';
import 'package:flutter_new_app/widgets/dog_profile_card.dart';

class AsynchronousExample extends StatefulWidget {
  const AsynchronousExample({super.key});

  @override
  State<AsynchronousExample> createState() => _AsynchronousExampleState();
}

class _AsynchronousExampleState extends State<AsynchronousExample> {
  bool isLoading = true;
  Dog? dog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: dog != null
            ? DogProfileCard(
                imageUrl: dog!.imageUrl,
                name: dog!.name,
                type: dog!.type,
              )
            : ElevatedButton(
                onPressed: readJson,
                child: Text('Klik disini untuk mendapatkan data'),
              ),
      ),
    );
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/dogs.json');

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
