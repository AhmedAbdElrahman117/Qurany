import 'package:flutter/material.dart';
import 'package:quran_app/core/constants.dart';

class DragHand extends StatelessWidget {
  const DragHand({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        width: MediaQuery.sizeOf(context).width * 0.3,
        height: 10,
        decoration: BoxDecoration(
          color: kTextColor,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
