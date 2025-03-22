import 'package:countries_app/core/base_view.dart';
import 'package:countries_app/modules/countries/presentation/view_model/country_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CountryScreen extends StatelessWidget {
  final String countryName;
  const CountryScreen({super.key, required this.countryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country - $countryName'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BaseView<CountryViewModel>(
            onViewModelReady: (vm) => vm.setCountryName(countryName),
            builder: (context, viewModel, _) {
              if (viewModel.model.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              return Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Name: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(viewModel.model.country!.name),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Capital: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(viewModel.model.country!.capital),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Region: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(viewModel.model.country!.region),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Population: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(viewModel.model.country!.population.toString()),
                    ],
                  ),
                  SvgPicture.network(viewModel.model.country!.flag),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
