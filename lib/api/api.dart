import 'package:http/http.dart' as http;
import 'dart:convert';

final headers = {
    'Client-ID': 'cahd8v9tgk590axgn80pas4zjq2d86',
    'Authorization': 'Bearer ukbkybsb81knum8pqoxhpl3mkxzlqq',
  };

Future<List<dynamic>> searchGame(String input) async {
  const url = 'https://api.igdb.com/v4/games';

  final body = 'search "$input"; fields name, platforms.name, first_release_date, genres.name, rating, storyline, summary, cover.url, url;';
  
  final response = await http.post(Uri.parse(url), headers: headers, body: body);

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}