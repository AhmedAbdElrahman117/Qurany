import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: LinearProgressIndicator(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xFFA5583A),
        ),
      ),
    );
  }
}
