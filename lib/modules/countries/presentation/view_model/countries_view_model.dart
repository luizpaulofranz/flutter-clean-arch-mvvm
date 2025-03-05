import 'package:countries_app/core/base_view_model.dart';
import 'package:countries_app/core/request_result.dart';
import 'package:countries_app/modules/countries/domain/entity/country.dart';
import 'package:countries_app/modules/countries/domain/use_case/get_all_countries.dart';

class CountriesViewModel extends BaseViewModel {
  final GetAllCountries _getAllCountries;

  CountriesViewModel(this._getAllCountries);

  List<Country> countries = [];
  String? errorMessage;

  @override
  void init() {
    _getAllCountriesCall();
  }

  void _getAllCountriesCall() async {
    loading = true;
    final result = await _getAllCountries.execute();
    switch (result) {
      case Success<List<Country>>():
        countries = result.data;
      case Error<List<Country>>():
        errorMessage = result.message;
    }
    loading = false;
  }
}
