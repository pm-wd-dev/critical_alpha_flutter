import 'package:flutter/material.dart';

class RatingCard extends StatelessWidget {
  final String questionText;
  final String iconPath;
  final int rating;
  final Function(int) onRatingChanged;

  const RatingCard({
    super.key,
    required this.questionText,
    required this.iconPath,
    required this.rating,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // Icon Container
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                iconPath,
                width: 32,
                height: 32,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.psychology,
                    size: 24,
                    color: Colors.blue,
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Question and Rating
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  questionText,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    // Thumbs up rating
                    ...List.generate(5, (index) {
                      final isSelected = index < rating;
                      return GestureDetector(
                        onTap: () => onRatingChanged(index + 1),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.thumb_up,
                            size: 20,
                            color: isSelected ? Colors.blue : Colors.grey.shade400,
                          ),
                        ),
                      );
                    }),
                    const SizedBox(width: 8),
                    Text(
                      '$rating/5',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}