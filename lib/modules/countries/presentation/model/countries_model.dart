import 'package:countries_app/core/base_model.dart';
import 'package:countries_app/modules/countries/domain/entity/country.dart';

class CountriesModel extends BaseModel {
  final List<Country> countries;
  final String? errorMessage;

  CountriesModel({required super.loading, required this.countries, this.errorMessage,});

  @override
  CountriesModel copyWith({
    List<Country>? countries, 
    String? errorMessage, 
    bool? loading,
  }) {
    return CountriesModel(
      loading: loading ?? this.loading, 
      countries: countries ?? this.countries, 
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}