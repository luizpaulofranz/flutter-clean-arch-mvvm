import 'package:countries_app/core/base_view_model.dart';
import 'package:countries_app/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    T viewModel,
    Widget? child,
  ) builder;
  const BaseView({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final viewModel = locator<T>();
    viewModel.init();
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<T>(builder: builder),
    );
  }
}
