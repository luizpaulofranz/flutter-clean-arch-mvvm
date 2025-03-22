import 'package:countries_app/core/base_view_model.dart';
import 'package:countries_app/core/request_result.dart';
import 'package:countries_app/modules/countries/domain/entity/country.dart';
import 'package:countries_app/modules/countries/domain/use_case/get_country_by_name.dart';
import 'package:countries_app/modules/countries/presentation/model/country_model.dart'
    show CountryModel;

class CountryViewModel extends BaseViewModel<CountryModel> {
  final GetCountryByName _getCountryByName;

  CountryViewModel(this._getCountryByName);

  @override
  void init() {
    model = CountryModel(
      country: null,
      loading: true,
    );
  }

  void setCountryName(String name) {
    _getCountryByNameCall(name);
  }

  Future<void> _getCountryByNameCall(String name) async {
    final result = await _getCountryByName.execute(name);
    switch (result) {
      case Success<Country>():
        model = model.copyWith(
          country: result.data,
          loading: false,
        );
      case Error<Country>():
        model = model.copyWith(
          errorMessage: result.message,
          loading: false,
        );
    }
  }
}
