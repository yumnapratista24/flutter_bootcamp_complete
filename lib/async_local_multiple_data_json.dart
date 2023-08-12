import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_new_app/models/dog.dart';
import 'package:flutter_new_app/models/list_of_dogs.dart';
import 'package:flutter_new_app/widgets/dog_profile_card.dart';
import 'package:http/http.dart' as http;

class AsynchronousMultipleExample extends StatefulWidget {
  const AsynchronousMultipleExample({super.key});

  @override
  State<AsynchronousMultipleExample> createState() =>
      _AsynchronousMultipleExampleState();
}

class _AsynchronousMultipleExampleState
    extends State<AsynchronousMultipleExample> {
  bool isLoading = true;
  ListOfDogs? dogs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: dogs != null
            ? ListView.builder(
                itemCount: dogs!.dogs.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final Dog dog = dogs!.dogs[index];

                  return DogProfileCard(
                    imageUrl: dog.imageUrl,
                    name: dog.name,
                    type: dog.type,
                  );
                },
              )
            : ElevatedButton(
                onPressed: fetchDogs,
                child: Text('Klik disini untuk mendapatkan data'),
              ),
      ),
    );
  }

  Future<void> fetchDogs() async {
    final response = await http.get(
      Uri.parse('http://localhost:3001/dogs'),
    );

    if (response.statusCode == 200) {
      ListOfDogs res = ListOfDogs.fromJson(
        jsonDecode(response.body),
      );

      setState(() {
        dogs = res;
      });
    }
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/multiple_dogs.json');

    final Map<String, dynamic> data = await json.decode(response);

    ListOfDogs res = ListOfDogs.fromJson(data);

    setState(() {
      dogs = res;
    });
  }
}
