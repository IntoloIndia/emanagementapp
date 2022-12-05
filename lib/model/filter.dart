import 'dart:collection';

import 'package:emanagementapp/model/category.dart';
import 'package:emanagementapp/model/filter_category.dart';
import 'package:equatable/equatable.dart';

class Filter extends Equatable {
  final List<CategoryFilter> categoryFilters;
  final List<PriceFilter> priceFilters;

  Filter(
      {this.categoryFilters = const <CategoryFilter>[],
      this.priceFilters = const <PriceFilter>[]});

  Filter copyWith(
      {List<CategoryFilter>? categoryFilters,
      List<PriceFilter>? priceFilters}) {
    return Filter(
      categoryFilters: categoryFilters ?? this.categoryFilters,
      priceFilters: priceFilters ?? this.priceFilters,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw [categoryFilters, priceFilters];
}
