import 'package:individual/models/cover.dart';
import 'package:individual/models/genre.dart';
import 'package:individual/models/platform.dart';

class Game {
  int? id;
  Cover? cover;
  int? firstReleaseDate;
  List<Genres>? genres;
  String? name;
  List<Platforms>? platforms;
  double? rating;
  String? storyline;
  String? summary;
  String? url;

  Game(
      {this.id,
      this.cover,
      this.firstReleaseDate,
      this.genres,
      this.name,
      this.platforms,
      this.rating,
      this.storyline,
      this.summary,
      this.url});

  Game.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cover = json['cover'] != null ? Cover.fromJson(json['cover']) : null;
    firstReleaseDate = json['first_release_date'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
    name = json['name'];
    if (json['platforms'] != null) {
      platforms = <Platforms>[];
      json['platforms'].forEach((v) {
        platforms!.add(Platforms.fromJson(v));
      });
    }
    rating = json['rating'];
    storyline = json['storyline'];
    summary = json['summary'];
    url = json['url'];
  }
}
