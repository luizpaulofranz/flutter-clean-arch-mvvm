import 'package:countries_app/core/request_result.dart';
import 'package:countries_app/modules/countries/data/data_source/country_ds.dart';
import 'package:countries_app/modules/countries/data/model/country_model.dart';
import 'package:countries_app/modules/countries/domain/repository/country_repo.dart';

class CountryRepoImpl implements CountryRepo {
  final CountryDataSource dataSource;

  CountryRepoImpl(this.dataSource);

  @override
  Future<RequestResult<List<CountryModel>>> getCountries() async {
    try {
      final countries = await dataSource.getCountries();
      return Success(countries);
    } catch (e) {
      return Error(e.toString());
    }
  }

  @override
  Future<RequestResult<CountryModel>> getCountryByName(String name) async {
    try {
      final country = await dataSource.getCountryByName(name);
      if (country == null) return Error("Country not found");
      return Success(country);
    } catch (e) {
      return Error(e.toString());
    }
  }
}
