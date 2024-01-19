import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import 'package:testing_model/details/details_injection.dart';
import 'package:testing_model/home/domain/home_provider.dart';

class PokemonCards extends StatelessWidget {
  const PokemonCards({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsInjection.injection(
                homeProvider.pokemonList.value?.results[index].url ?? ''),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            width: 200,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: const FadeInImage(
                placeholder: NetworkImage('https://placekitten.com/200/200'),
                image: NetworkImage(
                    'https://media.vandal.net/i/1440x1080/2-2023/202322512533121_1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 200,
            width: 200,
            padding: const EdgeInsets.symmetric(vertical: 10),
            margin: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Text(
                  homeProvider.pokemonList.value?.results[index].name
                          .toUpperCase() ??
                      '',
                  style: GoogleFonts.nunito(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
