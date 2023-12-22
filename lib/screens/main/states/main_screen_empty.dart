import 'package:flutter/material.dart';

class MainScreenEmptyBody extends StatelessWidget {
  const MainScreenEmptyBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Text(
          "Enter the game name in the search bar to find you favourite games!",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
