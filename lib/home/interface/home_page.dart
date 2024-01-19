import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import 'package:testing_model/home/domain/home_provider.dart';
import 'package:testing_model/home/interface/widget/pokemon_cards.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pokemons',
          style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => homeProvider.getPokemon(),
        child: GridView.count(
          crossAxisCount: 2, // Dos columnas
          children: List.generate(
            homeProvider.pokemonList.value?.results.length ?? 0,
            (index) => PokemonCards(index: index),
          ),
        ),
      ),
    );
  }
}
