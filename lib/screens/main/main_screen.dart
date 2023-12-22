import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:individual/screens/main/cubit/main_screen_cubit.dart";
import "package:individual/screens/main/cubit/main_screen_state.dart";
import "package:individual/screens/main/states/main_screen_empty.dart";
import "package:individual/screens/main/states/main_screen_error.dart";
import "package:individual/screens/main/states/main_screen_loading.dart";
import "package:individual/screens/main/states/main_screen_nothing_found.dart";
import "package:individual/screens/main/states/main_screen_result.dart";
import "package:individual/screens/main/widgets/game_search_bar.dart";

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return buildMainScreen();
  }

  BlocBuilder<MainScreenCubit, MainScreenState> buildMainScreen() {
    return BlocBuilder<MainScreenCubit, MainScreenState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Game Search"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: const MainScreenBody(),
      );
    });
  }
}

class MainScreenBody extends StatelessWidget {
  const MainScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const GameSearchBar(),
          buildMainScreenBody(),
        ],
      ),
    );
  }

  BlocBuilder<MainScreenCubit, MainScreenState> buildMainScreenBody() {
    return BlocBuilder<MainScreenCubit, MainScreenState>(builder: (context, state) {
      if (state is MainScreenEmptyState) {
        return const MainScreenEmptyBody();
      }
      if (state is MainScreenLoadingState) {
        return const MainScreenLoadingBody();
      }
      if (state is MainScreenResultState) {
        return MainScreenResultBody(games: state.gameList);
      }
      if (state is MainScreenNothingFoundState) {
        return const MainScreenNothingFoundBody();
      }
      if (state is MainScreenErrorState) {
        return MainScreenErrorBody(err: state.err);
      }
      return Container();
    });
  }
}
