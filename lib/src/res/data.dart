// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_riverpod_base/src/res/assets.dart';

class AppData {
  static List<CategoryModel> categories = [
    CategoryModel(image: ImageAssets.photgraphy, title: "PhotoGraphy"),
    CategoryModel(image: ImageAssets.art, title: "Art"),
    CategoryModel(image: ImageAssets.music, title: "Music"),
    CategoryModel(image: ImageAssets.dance, title: "Dance")
  ];
  static List<StudioModel> recomendedStudios = [
    StudioModel(
        title: "Harmony Studios",
        image: ImageAssets.studio1,
        tag: "Photography",
        rating: 4.8,
        location: "Pune, Maharastra",
        rent: 1500),
    StudioModel(
        title: "The Dancextream",
        image: ImageAssets.studio2,
        tag: "Artistic Haven",
        rating: 4.8,
        location: "Pune, Maharastra",
        rent: 900),
    StudioModel(
        title: "Art Studios",
        image: ImageAssets.studio3,
        tag: "Music",
        rating: 4.8,
        location: "Pune, Maharastra",
        rent: 1500),
    StudioModel(
        title: "Photo Studios",
        image: ImageAssets.studio4,
        tag: "Art",
        rating: 4.8,
        location: "Pune, Maharastra",
        rent: 1200),
    StudioModel(
        title: "Harmony Studios",
        image: ImageAssets.studio5,
        tag: "Musci",
        rating: 4.8,
        location: "Pune, Maharastra",
        rent: 2000),];
        
  static List<StudioModel> nearByStudios = [
    StudioModel(
        title: "Harmony Studios",
        image: ImageAssets.studio1,
        tag: "Photography",
        rating: 4.8,
        location: "Pune, Maharastra",
        rent: 1500),
    StudioModel(
        title: "The Dancextream",
        image: ImageAssets.studio2,
        tag: "Artistic Haven",
        rating: 4.8,
        location: "Pune, Maharastra",
        rent: 900),
    StudioModel(
        title: "Art Studios",
        image: ImageAssets.studio3,
        tag: "Music",
        rating: 4.8,
        location: "Pune, Maharastra",
        rent: 1500),
    StudioModel(
        title: "Photo Studios",
        image: ImageAssets.studio4,
        tag: "Art",
        rating: 4.8,
        location: "Pune, Maharastra",
        rent: 1200),
    StudioModel(
        title: "Harmony Studios",
        image: ImageAssets.studio5,
        tag: "Musci",
        rating: 4.8,
        location: "Pune, Maharastra",
        rent: 2000),
  ];
}

class StudioModel {
  final String image;
  final String title;
  final String tag;
  final double rating;
  final String location;
  final double rent;
  StudioModel({
    required this.image,
    required this.title,
    required this.tag,
    required this.rating,
    required this.location,
    required this.rent,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'title': title,
      'tag': tag,
      'rating': rating,
      'location': location,
      'rent': rent,
    };
  }

  factory StudioModel.fromMap(Map<String, dynamic> map) {
    return StudioModel(
      image: map['image'] as String,
      title: map['title'] as String,
      tag: map['tag'] as String,
      rating: map['rating'] as double,
      location: map['location'] as String,
      rent: map['rent'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudioModel.fromJson(String source) =>
      StudioModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CategoryModel {
  final String image;
  final String title;
  CategoryModel({
    required this.image,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'title': title,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      image: map['image'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
