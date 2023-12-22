import 'package:flutter/material.dart';

class MainScreenLoadingBody extends StatelessWidget {
  const MainScreenLoadingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
