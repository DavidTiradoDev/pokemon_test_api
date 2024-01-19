import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testing_model/home/domain/models/home_model.dart';

class HomeExternal {
  Future<HomeModel?> getPokemon() async {
    const apiUrl = 'https://pokeapi.co/api/v2/pokemon/';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = HomeModel.fromMap(json.decode(response.body));

      for (final pokemon in data.results) {
        print('Nombre: ${pokemon.name}');
        print('URL: ${pokemon.url}');
        print('---');
      }
      return data;
    } else {
      print('Error en la solicitud: ${response.statusCode}');
      return null;
    }
  }
}
