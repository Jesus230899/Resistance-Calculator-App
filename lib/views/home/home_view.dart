library home_view;

import 'package:resistance_calculator_app/core/models/color_band_model.dart';
import 'package:resistance_calculator_app/theme/theme.dart';
import 'package:resistance_calculator_app/widgets/alerts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'home_mobile.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = HomeViewModel();
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => viewModel,
        onModelReady: (viewModel) => viewModel.onInit(context),
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
              mobile: _HomeMobile(viewModel), tablet: _HomeMobile(viewModel));
        });
  }
}
