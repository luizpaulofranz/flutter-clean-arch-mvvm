import 'package:countries_app/core/base_view_model.dart';
import 'package:countries_app/core/request_result.dart';
import 'package:countries_app/modules/countries/domain/entity/country.dart';
import 'package:countries_app/modules/countries/domain/use_case/get_all_countries.dart';
import 'package:countries_app/modules/countries/presentation/model/countries_model.dart';

class CountriesViewModel extends BaseViewModel<CountriesModel> {
  final GetAllCountries _getAllCountries;

  CountriesViewModel(this._getAllCountries);

  @override
  void init() {
    model = CountriesModel(
      countries: [],
      loading: true,
    );
    _getAllCountriesCall();
  }

  Future<void> _getAllCountriesCall() async {
    final result = await _getAllCountries.execute();
    switch (result) {
      case Success<List<Country>>():
        model = model.copyWith(
          countries: result.data,
          loading: false,
        );
      case Error<List<Country>>():
        model = model.copyWith(
          errorMessage: result.message,
          loading: false,
        );
    }
  }
}
