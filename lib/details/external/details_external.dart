import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:testing_model/details/domain/models/details_model.dart';

class DetailsExternal {
  Future<DetailsModel?> getPokemonDetails(String urlDetails) async {
    final apiUrl = urlDetails;

    // Realizar la solicitud HTTP
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Analizar la respuesta JSON
      final data = DetailsModel.fromMap(json.decode(response.body));

      // Imprimir información detallada del Pokémon
      print('Nombre: ${data.name}');
      print('ID: ${data.id}');
      print('Altura: ${data.height}');
      print('Peso: ${data.weight}');
      print('Tipos: ${data.types.map((type) => type.type.name).toList()}');
      // Agrega más detalles según tus necesidades
      return data;
    } else {
      print('Error en la solicitud: ${response.statusCode}');
      return null;
    }
  }
}
