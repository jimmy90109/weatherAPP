import 'package:flutter/material.dart';

class ErrorResult extends StatelessWidget {
  const ErrorResult({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return const Center(
      child: Text(
        'Something went wrong!',
        // style: theme.textTheme.headlineSmall,
      ),
    );
  }
}
