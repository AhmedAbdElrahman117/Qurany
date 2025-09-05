import 'package:flutter/material.dart';
import 'package:quran_app/core/constants.dart';

class ListItem extends StatelessWidget {
  const ListItem(
      {super.key, required this.icon, required this.title, this.onTap});

  final IconData icon;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: const Border(
              right: BorderSide(
                width: 10,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: kTextColor,
              ),
            ),
          ),
          child: ListTile(
            leading: Icon(
              icon,
              color: kTextColor,
            ),
            title: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color(0xFFA5583A),
              ),
            ),
            tileColor: kBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
