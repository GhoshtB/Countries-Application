

import 'package:flutter_app_new_task/model/countries.dart';

import 'api_provider.dart';

class Repository{

  ApiProvider provider= ApiProvider();

  Future<List<CountriesData>> repositoryData()=>provider.getRepositoryData();
}