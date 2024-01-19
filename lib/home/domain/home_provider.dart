import 'package:flutter/material.dart';
import 'package:testing_model/home/domain/models/home_model.dart';
import 'package:testing_model/home/external/home_external.dart';

class HomeProvider extends ChangeNotifier {
  final pokemonList = ValueNotifier<HomeModel?>(null);

  Future<dynamic> getPokemon() async {
    await HomeExternal().getPokemon().then(
      (value) {
        pokemonList.value = value;
        notifyListeners();
      },
    );
  }
}
