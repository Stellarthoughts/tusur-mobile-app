import 'package:flutter/material.dart';

class MainScreenErrorBody extends StatelessWidget {
  final Exception err;

  const MainScreenErrorBody({
    super.key,
    required this.err,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text('Error has occured: ${err.toString()}'),
      ),
    );
  }
}
