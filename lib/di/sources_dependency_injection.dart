import 'package:news/api/api_manager.dart';
import 'package:news/data/repository/sources_data/sources_data/remote/implementation/sourcesRemoteDataSourcesImplementation.dart';
import 'package:news/data/repository/sources_data/sources_data/remote/sources_remote_data_sources_Contract.dart';
import 'package:news/data/repository/sources_data/sources_data/repository/implementation/sources_repository_implementation.dart';
import 'package:news/data/repository/sources_data/sources_data/repository/sources_repository_contract.dart';

//todo: view model ====> sourcesRepoCContract
//todo: sourcesRepoContract ===> obj sourcesRemoteDataContract
//todo: sourcesRemoteDataContract ===> obj ApiManager

SourcesRepositoryContract injectSourcesRepo() {
  return SourcesRepositoryImplementation(
    sourcesRemoteDataSourcesContract: injectSourcesRemoteDataContract(),
  );
}

SourcesRemoteDataSourcesContract injectSourcesRemoteDataContract() {
  return SourcesRemoteDataSourcesImplementation(apiManager: injectApiManager());
}

ApiManager injectApiManager() {
  return ApiManager();
}
