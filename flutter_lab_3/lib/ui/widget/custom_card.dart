import 'package:flutter/material.dart';

class TluVerifiedBadge extends StatelessWidget {
  final String title;
  final String description;

  const TluVerifiedBadge({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.teal.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.teal, width: 0.8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.verified_user_rounded,
                color: Colors.teal,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                title.toUpperCase(),
                style: const TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.1,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              color: Colors.teal,
              fontSize: 13,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
