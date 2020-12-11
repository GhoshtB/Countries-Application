
import 'dart:convert';
import 'package:flutter_app_new_task/model/countries.dart';
import 'package:flutter_app_new_task/util/constants.dart';
import 'package:http/http.dart' as http;
class ApiProvider{

  http.Client client= http.Client();

  Future<List<CountriesData>> getRepositoryData() async{

    var response=await http.get(base_url);
    /*page=${firstKey}&per_page=${keyword}*/
    print(base_url);

    List data=json.decode(response.body);
    List<CountriesData> datas=[];
    print(response.body);
    if(response.statusCode==200){
//      print(ReposData.fromJson(data));
     /*  data.map((e) =>
       datas.add(ReposData.fromJson(e)));*/
     return data.map((e) => CountriesData.fromJson(e)).toList();
    }else{
      throw Exception('Failed to load post');
    }

  }
}