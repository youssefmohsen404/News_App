import 'package:flutter/cupertino.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/SourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  //todo:hold data / handle logic
  List<Sources>? sourcesList;
  String? errorMessage;

  void getSources(String categoryId) async {
    //todo:reinitialize
    sourcesList = null;
    errorMessage = null;
    notifyListeners();

    try {
      var response = await ApiManager.getSources(categoryId);
      if (response?.status == 'error') {
        //todo:error
        errorMessage = response!.message!;
      } else {
        sourcesList = response!.sources!;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
