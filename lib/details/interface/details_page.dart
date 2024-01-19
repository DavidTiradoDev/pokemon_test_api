import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:testing_model/details/domain/details_provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailsProvider = Provider.of<DetailsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.translate_rounded),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nombre: ${detailsProvider.pokemonDetails.value?.name}'),
            Text('ID: ${detailsProvider.pokemonDetails.value?.id}'),
            Text('Altura: ${detailsProvider.pokemonDetails.value?.height}'),
            Text('Peso: ${detailsProvider.pokemonDetails.value?.weight}'),
            Text(
                'Tipo: ${detailsProvider.pokemonDetails.value?.types.map((type) => type.type.name).toList().join(', ')}'),
          ],
        ),
      ),
    );
  }
}
