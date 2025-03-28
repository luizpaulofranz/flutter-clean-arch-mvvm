import 'package:countries_app/core/request_result.dart';
import 'package:countries_app/modules/countries/domain/entity/country.dart';
import 'package:countries_app/modules/countries/domain/repository/country_repo.dart';

class GetCountryByName {
  final CountryRepo _countryRepo;

  GetCountryByName(this._countryRepo);

  Future<RequestResult<Country>> execute(String name) =>
      _countryRepo.getCountryByName(name);
}
