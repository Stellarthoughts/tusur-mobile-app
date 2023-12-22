import 'package:flutter/material.dart';
import 'package:individual/classes/game_normalized.dart';
import 'package:individual/screens/show_game/show_game_screen.dart';

class MainScreenResultBody extends StatelessWidget {
  final List<GameNormalized> games;

  const MainScreenResultBody({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: games.length,
        itemBuilder: gameEntry,
      ),
    );
  }

  Widget? gameEntry(context, index) {
    GameNormalized game = games[index];

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(game.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Text("🎮${game.genres}"),
                  const SizedBox(height: 8),
                  Text("💻${game.platforms}"),
                  const SizedBox(height: 8),
                  Text("⭐️${game.rating}"),
                  const SizedBox(height: 8),
                  Text("⏳${game.date}"),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ShowGameScreen(game: game);
                    },
                  ),
                ),
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    game.url,
                    width: 137,
                    height: 187,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
