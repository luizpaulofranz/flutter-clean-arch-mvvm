import 'package:countries_app/modules/countries/data/data_source/country_ds.dart';
import 'package:countries_app/modules/countries/data/model/country_model.dart';
import 'package:dio/dio.dart';

class CountryDsImpl extends CountryDataSource {
  final Dio apiClient;

  CountryDsImpl({required this.apiClient});

  @override
  Future<List<CountryModel>> getCountries() async {
    final response = await apiClient.get('https://restcountries.com/v3.1/all');
    final dataList = response.data as List;
    // final dataList = dataList.
    // return dataList.map((c) => CountryModel.fromJson(c)).toList();
    return dataList
        .sublist(0, 45)
        .map((c) => CountryModel.fromJson(c))
        .toList();
  }

  @override
  Future<CountryModel?> getCountryByName(String name) async {
    final response =
        await apiClient.get('https://restcountries.com/v3.1/name/$name');

    return (CountryModel.fromJson(response.data.first));
  }
}
