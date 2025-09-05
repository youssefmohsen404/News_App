import '../../../../model/SourceResponse.dart';

abstract class CategoryDetailsState {}

class CategoryStateLoading extends CategoryDetailsState {}

class CategoryStateInitial extends CategoryDetailsState {}

class CategoryStateError extends CategoryDetailsState {
  String message;

  CategoryStateError({required this.message});
}

class CategoryStateSuccess extends CategoryDetailsState {
  List<Sources> sourceList;

  CategoryStateSuccess({required this.sourceList});
}
