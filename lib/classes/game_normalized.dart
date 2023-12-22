import 'package:individual/helpers/unix_timestamp.dart';
import 'package:individual/models/game.dart';

class GameNormalized {
  late String url;
  late String name;
  late String genres;
  late String platforms;
  late String rating;
  late String date;
  late String story;
  late String summary;

  GameNormalized(Game game) {
    url = game.cover != null && game.cover!.url != null ? game.cover!.url! : "https://i.imgur.com/NgvovXt.png";
    name = game.name != null ? game.name! : "No name";
    genres = game.genres != null ? game.genres!.map((x) => x.name).join(", ") : "No genres";
    platforms = game.platforms != null ? game.platforms!.map((x) => x.name).join(", ") : "No platforms";
    rating = game.rating != null ? '${game.rating!.round()}/100' : "No rating";
    date = game.firstReleaseDate != null ? formatUnixTimestamp(game.firstReleaseDate!) : "No release date";
    story = game.storyline != null ? game.storyline! : "No storyline";
    summary = game.summary != null ? game.summary! : "No summary";
  }
}
