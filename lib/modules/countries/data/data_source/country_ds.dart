import 'package:countries_app/modules/countries/data/model/country_model.dart';

abstract class CountryDataSource {
  Future<List<CountryModel>> getCountries();
  Future<CountryModel?> getCountryByName(String name);
}
