import 'package:flutter/material.dart';

class MainScreenNothingFoundBody extends StatelessWidget {
  const MainScreenNothingFoundBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Text("Couldn't find games with this name!"),
      ),
    );
  }
}
