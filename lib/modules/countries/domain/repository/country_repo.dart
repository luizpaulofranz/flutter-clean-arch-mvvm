import 'package:countries_app/core/request_result.dart';
import 'package:countries_app/modules/countries/data/model/country_model.dart';

abstract class CountryRepo {
  Future<RequestResult<List<CountryModel>>> getCountries();
}
