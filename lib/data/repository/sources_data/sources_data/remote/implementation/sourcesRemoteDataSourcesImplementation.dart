import 'package:news/api/api_manager.dart';

import '../../../../../../model/SourceResponse.dart';
import '../sources_remote_data_sources_Contract.dart';

class SourcesRemoteDataSourcesImplementation
    implements SourcesRemoteDataSourcesContract {
  ApiManager apiManager;

  SourcesRemoteDataSourcesImplementation({required this.apiManager});

  @override
  Future<SourceResponse> getSources(String categoryId) async {
    // TODO: implement getSources
    var response = await apiManager.getSources(categoryId);
    return response;
  }
}
