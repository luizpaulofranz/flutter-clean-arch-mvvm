import 'package:countries_app/modules/countries/data/data_source/country_ds.dart';
import 'package:countries_app/modules/countries/data/data_source/country_ds_impl.dart';
import 'package:countries_app/modules/countries/data/repository/country_repo_impl.dart';
import 'package:countries_app/modules/countries/domain/repository/country_repo.dart';
import 'package:countries_app/modules/countries/domain/use_case/get_all_countries.dart';
import 'package:countries_app/modules/countries/presentation/view_model/countries_view_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
void init() {
  // htttp client
  locator.registerLazySingleton<Dio>(() => Dio());

  // Data Sources
  locator.registerFactory<CountryDataSource>(
    () => CountryDsImpl(apiClient: locator()),
  );

  // Repos
  locator.registerFactory<CountryRepo>(() => CountryRepoImpl(locator()));

  // Use Cases
  locator.registerFactory<GetAllCountries>(
    () => GetAllCountries(locator()),
  );

  // viewModels
  locator.registerFactory<CountriesViewModel>(
    () => CountriesViewModel(locator()),
  );
}
