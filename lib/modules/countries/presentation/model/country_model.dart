import 'package:countries_app/core/base_model.dart';
import 'package:countries_app/modules/countries/domain/entity/country.dart';

class CountryModel extends BaseModel {
  Country? country;
  final String? errorMessage;

  CountryModel({
    required super.loading,
    this.country,
    this.errorMessage,
  });

  @override
  CountryModel copyWith({
    Country? country,
    String? errorMessage,
    bool? loading,
  }) {
    return CountryModel(
      loading: loading ?? this.loading,
      country: country ?? this.country,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
