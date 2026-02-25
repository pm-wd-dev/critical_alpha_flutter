import 'package:flutter/material.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';

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
          // Icon Container — 7.2: increased from 48→56
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                iconPath,
                width: 40,
                height: 40,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.psychology,
                    size: 30,
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
                    // 7.3: Native-style thumb icons using custom assets
                    ...List.generate(5, (index) {
                      final isSelected = index < rating;
                      return GestureDetector(
                        onTap: () => onRatingChanged(index + 1),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Image.asset(
                            isSelected
                                ? AppAssets.thumbFill
                                : AppAssets.thumb,
                            width: 24,
                            height: 24,
                            color: isSelected
                                ? AppColors.primary
                                : Colors.grey.shade400,
                            colorBlendMode: BlendMode.srcIn,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                isSelected
                                    ? Icons.thumb_up
                                    : Icons.thumb_up_outlined,
                                size: 24,
                                color: isSelected
                                    ? AppColors.primary
                                    : Colors.grey.shade400,
                              );
                            },
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
