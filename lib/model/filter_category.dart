import 'package:emanagementapp/model/category.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final int id;
  final String name;

  Category({required this.id, required this.name});

  @override
  List<Object> get props => [id, name];

  static List<Category> categories = [
    Category(id: 1, name: "abhishek"),
    Category(id: 2, name: "Shubham"),
    Category(id: 3, name: "Umer"),
  ];
}

class CategoryFilter extends Equatable {
  final int id;
  final Category category;
  final bool value;

  CategoryFilter(
      {required this.id, required this.category, required this.value});

  CategoryFilter copyWidth({int? id, Category? category, bool? value}) {
    return CategoryFilter(
        id: id ?? this.id,
        category: category ?? this.category,
        value: value ?? this.value);
  }

  @override
  List<Object> get props => [id, category, value];

  static List<CategoryFilter> filters = Category.categories
      .map((category) =>
          CategoryFilter(id: category.id, category: category, value: false))
      .toList();
      
  // static List<CategoryFilter> catego ries = [
  //   CategoryFilter(id: 1, name: "abhishek"),
  //   CategoryFilter(id: 2, name: "Shubham"),
  //   CategoryFilter(id: 3, name: "Umer"),
  // ];

}

class Price extends Equatable {
  final int id;
  final String price;

  Price({
    required this.id,
    required this.price,
  });

  @override
   List<Object?> get props => [id, price];
   static List<Price> prices = [
    Price(id: 1, price: '10'),
    Price(id: 2, price: '20'),
    Price(id: 3, price: '30'),
   ];
}

class PriceFilter extends Equatable {
  final int id;
  final Price price;
  final bool value;

  PriceFilter(
      {required this.id, required this.price, required this.value});

  PriceFilter copyWidth({int? id, Price? price, bool? value}) {
    return PriceFilter(
        id: id ?? this.id,
        price: price ?? this.price,
        value: value ?? this.value);
  }

  @override
  List<Object> get props => [id, price, value];

  static List<PriceFilter> filters = Price.prices
      .map((price) =>
          PriceFilter(id: price.id, price: price, value: false))
      .toList();
  // static List<CategoryFilter> catego ries = [
  //   CategoryFilter(id: 1, name: "abhishek"),
  //   CategoryFilter(id: 2, name: "Shubham"),
  //   CategoryFilter(id: 3, name: "Umer"),
  // ];
}