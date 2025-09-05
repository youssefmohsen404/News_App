import 'package:news/model/SourceResponse.dart';

abstract class SourcesRemoteDataSourcesContract {
  Future<SourceResponse> getSources(String categoryId);
}
