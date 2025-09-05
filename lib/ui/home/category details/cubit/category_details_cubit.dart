import 'package:bloc/bloc.dart';

import '../../../../data/repository/sources_data/sources_data/repository/sources_repository_contract.dart';
import 'category_details_state.dart';

class CategoryDetailsCubit extends Cubit<CategoryDetailsState> {
  //todo:create object from dataSourcesRepo
  late SourcesRepositoryContract sourcesRepositoryContract;

  CategoryDetailsCubit({required this.sourcesRepositoryContract})
    : super(CategoryStateLoading()) {}

  //todo: handle logic & hold data
  //todo: give sources list
  Future<void> getSources(String categoryId) async {
    //todo: loading till the data come from api
    emit(CategoryStateLoading());
    try {
      //todo get the response from sources api
      var response = await sourcesRepositoryContract.getSources(categoryId);
      //todo: handle error
      if (response.status != 'ok') {
        emit(CategoryStateError(message: response.message!));

        return;
      }
      //todo: handle success
      else if (response.status == 'ok') {
        emit(CategoryStateSuccess(sourceList: response.sources!));

        return;
      }
    } catch (e) {
      emit(CategoryStateError(message: e.toString()));
    }
  }
}
