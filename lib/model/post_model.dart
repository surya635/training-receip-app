import 'package:flutter/foundation.dart';

class Posts {
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  Posts({
    required this.name,
    required this.images,
    required this.rating,
    required this.totalTime,
  });

  factory Posts.fromJson(dynamic json) {
    return Posts(
        name: json['name'] as String,
        images: json['images'][0]['hostedLargeUrl'] as String,
        rating: json['rating'] as double,
        totalTime: json['totalTime'] as String);
  }

  static List<Posts> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Posts.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}
