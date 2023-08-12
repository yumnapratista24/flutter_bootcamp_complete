import 'package:flutter_new_app/models/dog.dart';

class ListOfDogs {
  ListOfDogs({
    this.dogs = const <Dog>[],
  });

  List<Dog> dogs;

  factory ListOfDogs.fromJson(Map<String, dynamic> json) {
    List<Dog> result = [];

    for (var element in json['dogs']) {
      Dog dog = Dog(
        name: element['name'],
        imageUrl: element['imageUrl'],
        type: element['type'],
      );

      result.add(dog);
    }

    return ListOfDogs(dogs: result);
  }
}
