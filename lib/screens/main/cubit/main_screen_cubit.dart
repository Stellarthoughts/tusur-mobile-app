import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual/api/api.dart';
import 'package:individual/classes/game_normalized.dart';
import 'package:individual/models/game.dart';
import 'package:individual/screens/main/cubit/main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenEmptyState());

  List<GameNormalized>? lastLoaded;

  Future<void> searchGames(String title) async {
    try {
      emit(MainScreenLoadingState());

      List<dynamic> apiData = await searchGame(title);

      if (apiData.isEmpty) {
        emit(MainScreenNothingFoundState());
        return;
      }

      List<Game> games = List<Game>.empty(growable: true);

      for (var entry in apiData) {
        games.add(Game.fromJson(entry));
      }

      List<GameNormalized> gamesNormalized = games.map((x) => GameNormalized(x)).toList();

      lastLoaded = gamesNormalized;
      emit(MainScreenResultState(gameList: gamesNormalized));
      return;
    } on Exception catch (e) {
      emit(MainScreenErrorState(err: e));
      return;
    }
  }

  Future<void> switchBack() async {
    if (lastLoaded != null) {
      emit(MainScreenResultState(gameList: lastLoaded!));
    } else {
      emit(MainScreenEmptyState());
    }
    return;
  }
}
