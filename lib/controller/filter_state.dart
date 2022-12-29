import 'package:emanagementapp/model/filter_category.dart';
import 'package:equatable/equatable.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object> get props => [];
}

abstract class FilterState extends Equatable {
  const FilterState();
}

class FiltersLoad extends FilterState {
  @override
  // TODO: implement props
  List<Object?> get props => throw [];
}

class CategoryFilterUpdated extends FilterEvent {
  final CategoryFilter categoryFilter;

  CategoryFilterUpdated({required this.categoryFilter});

  @override
  List<Object> get props => [categoryFilter];
}

class PriceFilterUpdated extends FilterEvent {
  final PriceFilter priceFilter;

  PriceFilterUpdated({required this.priceFilter});

  @override
  List<Object> get props => [priceFilter];
}
