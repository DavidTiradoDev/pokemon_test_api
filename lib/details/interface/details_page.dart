import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        height: 250,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const FadeInImage(
                          placeholder:
                              NetworkImage('https://placekitten.com/200/300'),
                          image:
                              NetworkImage('https://placekitten.com/200/300'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    SizedBox(
                      width: 150,
                      height: 250,
                      child: Text(
                        'Es un Pokémon con apariencia de gato, y está basado en el Maneki-neko (gato de la suerte japonés). En su cabeza porta un amuleto en forma de moneda. Se trata de una antigua moneda japonesa hecha de oro llamada Koban, símbolo de la buena fortuna en Japón. De ahí aparece su principal ataque llamado día de pago, que consiste en lanzar muchas monedas al oponente que aparentemente salen de su cabeza. También es reconocido por tener un color con un tono parecido al beige y un tono marrón al final de cada pata trasera y cola, incluso obtiene tono negro en cada oreja. Este contenido proviene de wikidex.net, y debe darse atribución a sus autores, tal como especifica la licencia. Se prohíbe su uso a PlagioDex (el wiki de FANDOOM), por copiar reiteradamente sin dar atribución',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 12,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.nunito(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Le gustan los objetos brillantes y sobre todo los objetos redondos, por lo que las monedas se convierten en sus objetos favoritos, no dejará de jugar con estos objetos hasta terminar rendido. E incluso cuando duerme, lo hará aferrado cariñosamente a sus preciados objetos. Se le ha visto maullando en las noches para que la gente le lance objetos para callarlo, así este Pokémon consigue muchos objetos brillantes. Si este Pokémon se enfurece mostrará sus garras, la cuales se extienden varios centímetros. También puede ocultarlas, para caminar con sus almohadillas siendo muy sigilosos para pasar inadvertido. Durante el día se la pasa dormido, solo siendo activo de noche para vigilar su territorio y buscar monedas perdidas. Este contenido proviene de wikidex.net, y debe darse atribución a sus autores, tal como especifica la licencia. Se prohíbe su uso a PlagioDex (el wiki de FANDOOM), por copiar reiteradamente sin dar atribución',
                overflow: TextOverflow.ellipsis,
                maxLines: 12,
                textAlign: TextAlign.justify,
                style: GoogleFonts.nunito(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const _PokemonAtributes(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PokemonAtributes extends StatelessWidget {
  const _PokemonAtributes({super.key});

  @override
  Widget build(BuildContext context) {
    final detailsProvider = Provider.of<DetailsProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nombre: ${detailsProvider.pokemonDetails.value?.name.toUpperCase()}',
          style: GoogleFonts.nunito(fontSize: 15),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'ID: ${detailsProvider.pokemonDetails.value?.id}',
          style: GoogleFonts.nunito(fontSize: 15),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Altura: ${detailsProvider.pokemonDetails.value?.height}',
          style: GoogleFonts.nunito(fontSize: 15),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Peso: ${detailsProvider.pokemonDetails.value?.weight}',
          style: GoogleFonts.nunito(fontSize: 15),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Tipo: ${detailsProvider.pokemonDetails.value?.types.map((type) => type.type.name).toList().join(', ').toUpperCase()}',
          style: GoogleFonts.nunito(fontSize: 15),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Habilidades: ${detailsProvider.pokemonDetails.value?.abilities.map((abilities) => abilities.ability.name).toList().join(' , ').toUpperCase()}',
          style: GoogleFonts.nunito(fontSize: 15),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
