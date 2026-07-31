import 'package:flutter/material.dart';

class TluVerifiedBadge extends StatelessWidget {
  final String title;

  const TluVerifiedBadge({super.key, this.title = "Title badge"});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),

        gradient : const LinearGradient(
          colors: [Color(0xFF0052D4), Color(0xFF4364F7), Color(0xFF6FB1FC)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4364F7).withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ]
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
            const Icon(
              Icons.verified,
              color: Colors.white,
              size: 18,
            ),
            SizedBox(width: 19),
            Text(
              title,
              style:TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            )

      ],),
    );
  }
}
