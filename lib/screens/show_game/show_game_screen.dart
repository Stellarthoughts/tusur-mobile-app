import 'package:flutter/material.dart';
import 'package:individual/classes/game_normalized.dart';

class ShowGameScreen extends StatelessWidget {
  final GameNormalized game;

  const ShowGameScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game Search"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: SingleChildScrollView(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(game.url, width: 264, height: 374, fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: buildGameInfo(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildGameInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
            child: Text(
          game.name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )),
        const SizedBox(height: 12),
        Text("Genre: 🎮${game.genres}"),
        const SizedBox(height: 8),
        Text("Platforms: 💻${game.platforms}"),
        const SizedBox(height: 8),
        Text("Rating: ⭐️${game.rating}"),
        const SizedBox(height: 8),
        Text("First date of release: ⏳${game.date}"),
        const SizedBox(height: 18),
        const Text(
          "Summary 💬",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        Text(game.summary),
        const SizedBox(height: 18),
        const Text(
          "Storyline 📖",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        Text(game.story),
      ],
    );
  }
}
