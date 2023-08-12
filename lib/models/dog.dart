class Dog {
  Dog({
    required this.name,
    required this.imageUrl,
    required this.type,
  });

  final String name;
  final String imageUrl;
  final String type;

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
      name: json['name'],
      imageUrl: json['imageUrl'],
      type: json['type'],
    );
  }
}
