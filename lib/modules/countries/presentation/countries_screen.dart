import 'package:countries_app/core/base_view.dart';
import 'package:countries_app/modules/countries/presentation/country_screen.dart';
import 'package:countries_app/modules/countries/presentation/view_model/countries_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries'),
      ),
      body: BaseView<CountriesViewModel>(
        builder: (context, vm, _) {
          if (vm.model.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return GridView.count(
            crossAxisCount: 2,
            children: vm.model.countries.map(
              (e) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CountryScreen(
                        countryName: e.name,
                      ),
                    ),
                  ),
                  child: Card(
                    child: Column(children: [
                      Text(e.name),
                      SizedBox(
                        height: 150,
                        child: SvgPicture.network(e.flag),
                      ),
                    ]),
                  ),
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}
