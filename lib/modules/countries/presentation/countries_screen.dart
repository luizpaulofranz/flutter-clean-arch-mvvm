import 'package:countries_app/core/base_view.dart';
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
        body: BaseView<CountriesViewModel>(builder: (context, vm, _) {
          if (vm.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return GridView.count(
            crossAxisCount: 2,
            children: vm.countries.map(
              (e) {
                return Card(
                  child: Column(children: [
                    Text(e.name),
                    // Text(e.capital),
                    // Text(e.region),
                    // Text(e.population.toString()),
                    SizedBox(
                      height: 150,
                      child: SvgPicture.network(e.flag),
                    ),
                  ]),
                );
              },
            ).toList(),
          );
        })
        //   ],
        // ),

        //   Column(
        //     children: vm.countries.map(
        //       (e) {
        //         return Card(
        //           child: Column(children: [
        //             Text(e.name),
        //             // Text(e.capital),
        //             // Text(e.region),
        //             // Text(e.population.toString()),
        //             SvgPicture.network(e.flag),
        //           ]),
        //         );
        //       },
        //     ).toList(),
        //   );
        // })
        // GridView.count(
        //   crossAxisCount: 2,
        //   children: [
        //     BaseConsumer<CountriesViewModel>(builder: (context, vm, _) {
        //       if (vm.loading) {
        //         return const Center(child: CircularProgressIndicator());
        //       }
        //       return Column(
        //         children: vm.countries.map(
        //           (e) {
        //             return Card(
        //               child: Column(children: [
        //                 Text(e.name),
        //                 // Text(e.capital),
        //                 // Text(e.region),
        //                 // Text(e.population.toString()),
        //                 SvgPicture.network(e.flag),
        //               ]),
        //             );
        //           },
        //         ).toList(),
        //       );
        //     })
        //   ],
        // ),
        // body: Column(
        // children: [
        //   Expanded(
        //     child: BaseConsumer<CountriesViewModel>(builder: (context, vm, _) {
        //       if (vm.loading) {
        //         return const Center(child: CircularProgressIndicator());
        //       }
        //       return Column(
        //           children: vm.countries.map(
        //         (e) {
        //           return Card(
        //             child: Column(children: [
        //               Text(e.name),
        //               Text(e.capital),
        //               Text(e.region),
        //               Text(e.population.toString()),
        //               SvgPicture.network(e.flag),
        //             ]),
        //           );
        //         },
        //       ).toList());
        //     }),
        //   ),
        // ],
        // child: GridView.count(
        //   shrinkWrap: true,
        //   padding: EdgeInsets.all(10),
        //   mainAxisSpacing: 10,
        //   crossAxisSpacing: 10,
        //   crossAxisCount: 2,
        //   children:
        //   [BaseConsumer<CountriesViewModel>(builder: (context, vm, _){
        //     return vm.model.countries.map((e) {
        //       return Card(
        //         child: Column(
        //           children: [
        //             Text(e.name),
        //             Text(e.capital),
        //             Text(e.region),
        //             Text(e.population.toString()),
        //             SvgPicture.network(e.flag),
        //           ),
        //         ),
        //   },
        //   ).toList(),},),]
        // [
        //   Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       SizedBox(
        //         height: 150,
        //         child: SvgPicture.network("https://flagcdn.com/ua.svg"),
        //       ),
        //       const SizedBox(height: 10),
        //       const Text("Ukraine"),
        //     ],
        //   ),
        //   // SizedBox(
        //   //   height: 400,
        //   //   child: SvgPicture.network("https://flagcdn.com/ua.svg"),
        //   // ),
        //   // SizedBox(
        //   //   height: 400,
        //   //   child: SvgPicture.network("https://flagcdn.com/ua.svg"),
        //   // ),
        // ],
        // ),
        );
  }
}
