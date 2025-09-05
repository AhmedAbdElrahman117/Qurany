import 'package:flutter/material.dart';

class ConnectionErrorMessage extends StatelessWidget {
  const ConnectionErrorMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const PopupMenuItem(
      child: Center(
        child: Text(
          'No Internet Connection',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
