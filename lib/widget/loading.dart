import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Loading Weather',
          // style: theme.textTheme.headlineSmall,
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
