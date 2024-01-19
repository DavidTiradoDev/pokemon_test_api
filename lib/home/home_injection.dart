import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:testing_model/home/domain/home_provider.dart';
import 'package:testing_model/home/interface/home_page.dart';

class HomeInjection {
  HomeInjection._();

  static Widget injection() {
    return ListenableProvider<HomeProvider>(
      create: (context) => HomeProvider()..getPokemon(),
      child: const HomePage(),
    );
  }
}
