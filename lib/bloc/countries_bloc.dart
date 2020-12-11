

import 'package:flutter_app_new_task/model/countries.dart';
import 'package:flutter_app_new_task/repos/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sqflite/sqflite.dart';

class Countriesbloc{

  BehaviorSubject<List<CountriesData>> _repoSubject= BehaviorSubject();
  Repository repository =Repository();

  getReposData() async{

    List<CountriesData> data =await repository.repositoryData();
    _repoSubject.sink.add(data);

  }
  BehaviorSubject<List<CountriesData>> get repoSubject=>_repoSubject.stream;
}

final bloc = Countriesbloc();