import 'package:individual/classes/game_normalized.dart';

abstract class MainScreenState {}

class MainScreenEmptyState extends MainScreenState {}

class MainScreenLoadingState extends MainScreenState {}

class MainScreenResultState extends MainScreenState {
  List<GameNormalized> gameList;

  MainScreenResultState({required this.gameList});
}

class MainScreenNothingFoundState extends MainScreenState {}

class MainScreenErrorState extends MainScreenState {
  Exception err;

  MainScreenErrorState({required this.err});
}
