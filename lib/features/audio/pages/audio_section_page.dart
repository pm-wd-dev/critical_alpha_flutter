import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_fonts.dart';
import '../controllers/critical_alpha_audio_controller.dart';
import '../models/audio_models.dart';

class AudioSectionPage extends ConsumerStatefulWidget {
  const AudioSectionPage({super.key});

  @override
  ConsumerState<AudioSectionPage> createState() => _AudioSectionPageState();
}

class _AudioSectionPageState extends ConsumerState<AudioSectionPage> {
  @override
  void initState() {
    super.initState();
    // Load categories when page opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(criticalAlphaAudioControllerProvider.notifier).loadCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final audioState = ref.watch(criticalAlphaAudioControllerProvider);

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          // Stop audio when navigating back with system back button
          ref.read(criticalAlphaAudioControllerProvider.notifier).stopAudio();
        }
      },
      child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Stop audio when leaving audio section
            ref.read(criticalAlphaAudioControllerProvider.notifier).stopAudio();
            // Navigate directly to home tab instead of popping
            context.go('/');
          },
        ),
        title: const Text(
          'Member Audios',
          style: TextStyle(
            color: Colors.black,
            fontFamily: AppFonts.poppins,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: audioState.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            )
          : audioState.error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 64,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Failed to load categories',
                        style: TextStyle(
                          fontFamily: AppFonts.poppins,
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          ref
                              .read(criticalAlphaAudioControllerProvider.notifier)
                              .loadCategories();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                        ),
                        child: const Text(
                          'Retry',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: audioState.categories.length,
                  itemBuilder: (context, index) {
                    final category = audioState.categories[index];
                    return _buildCategoryCard(category);
                  },
                ),
      ),
    );
  }

  Widget _buildCategoryCard(AudioCategory category) {
    return GestureDetector(
      onTap: () {
        ref
            .read(criticalAlphaAudioControllerProvider.notifier)
            .selectCategory(category);
        context.push('/audio/tracks/${category.id}');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Category icon or image
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Icon(
                _getCategoryIcon(category.name),
                size: 40,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 12),
            // Category name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                category.name,
                style: const TextStyle(
                  fontFamily: AppFonts.poppins,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (category.audioCount != null) ...[
              const SizedBox(height: 4),
              Text(
                '${category.audioCount} audios',
                style: TextStyle(
                  fontFamily: AppFonts.poppins,
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String categoryName) {
    final name = categoryName.toLowerCase();
    if (name.contains('soft skill')) return Icons.psychology;
    if (name.contains('planning')) return Icons.calendar_today;
    if (name.contains('risk')) return Icons.warning_amber;
    if (name.contains('improvement')) return Icons.trending_up;
    if (name.contains('motivation')) return Icons.rocket_launch;
    if (name.contains('mindset')) return Icons.self_improvement;
    if (name.contains('resilience')) return Icons.shield;
    if (name.contains('assessment')) return Icons.assessment;
    if (name.contains('leadership')) return Icons.groups;
    if (name.contains('teamwork')) return Icons.group_work;
    if (name.contains('communication')) return Icons.chat;
    return Icons.audiotrack;
  }
}