import 'package:flutter/material.dart';

import 'package:testing_model/details/domain/models/details_model.dart';
import 'package:testing_model/details/external/details_external.dart';

class DetailsProvider with ChangeNotifier {
  final pokemonDetails = ValueNotifier<DetailsModel?>(null);

  Future<dynamic> getPokemonDetails(String urlDetails) async {
    await DetailsExternal().getPokemonDetails(urlDetails).then(
      (value) {
        pokemonDetails.value = value;
        notifyListeners();
      },
    );
  }
}
