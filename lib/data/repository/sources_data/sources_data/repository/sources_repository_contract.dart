import 'package:news/model/SourceResponse.dart';

abstract class SourcesRepositoryContract {
  Future<SourceResponse> getSources(String categoryId);
}
