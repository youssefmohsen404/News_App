import '../../../../../../model/SourceResponse.dart';
import '../../remote/sources_remote_data_sources_Contract.dart';
import '../sources_repository_contract.dart';

class SourcesRepositoryImplementation implements SourcesRepositoryContract {
  SourcesRemoteDataSourcesContract sourcesRemoteDataSourcesContract;

  SourcesRepositoryImplementation({
    required this.sourcesRemoteDataSourcesContract,
  });

  @override
  Future<SourceResponse> getSources(String categoryId) {
    // TODO: implement getSources
    return sourcesRemoteDataSourcesContract.getSources(categoryId);
  }
}
