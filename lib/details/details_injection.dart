import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_model/details/domain/details_provider.dart';
import 'package:testing_model/details/interface/details_page.dart';

class DetailsInjection {
  DetailsInjection._();

  static Widget injection(String urlDetails) {
    return ListenableProvider(
      create: (context) => DetailsProvider()..getPokemonDetails(urlDetails),
      child: const DetailsPage(),
    );
  }
}
