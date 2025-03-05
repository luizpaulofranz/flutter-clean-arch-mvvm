import 'package:countries_app/core/request_result.dart';
import 'package:countries_app/modules/countries/domain/entity/country.dart';
import 'package:countries_app/modules/countries/domain/repository/country_repo.dart';

class GetAllCountries {
  final CountryRepo _countryRepo;

  GetAllCountries(this._countryRepo);

  Future<RequestResult<List<Country>>> execute() => _countryRepo.getCountries();
}
