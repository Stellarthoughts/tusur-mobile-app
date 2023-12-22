import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual/screens/main/cubit/main_screen_cubit.dart';

class GameSearchBar extends StatelessWidget {
  const GameSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 15),
      child: SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            hintText: "Game Name",
            controller: controller,
            padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
            ),
            onSubmitted: (value) => {BlocProvider.of<MainScreenCubit>(context).searchGames(value)},
            leading: const Icon(Icons.search),
          );
        },
        suggestionsBuilder: (BuildContext context, SearchController controller) {
          return List<ListTile>.empty();
        },
      ),
    );
  }
}
