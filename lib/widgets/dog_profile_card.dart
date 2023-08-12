import 'package:flutter/widgets.dart';

class DogProfileCard extends StatelessWidget {
  const DogProfileCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.type,
  });

  final String imageUrl;
  final String name;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.network(
            imageUrl,
            width: 200,
            height: 200,
          ),
          Text(name),
          Text(type),
        ],
      ),
    );
  }
}
