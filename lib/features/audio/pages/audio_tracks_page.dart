import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_fonts.dart';
import '../controllers/critical_alpha_audio_controller.dart';
import '../models/audio_models.dart';

class AudioTracksPage extends ConsumerStatefulWidget {
  final String categoryId;

  const AudioTracksPage({
    super.key,
    required this.categoryId,
  });

  @override
  ConsumerState<AudioTracksPage> createState() => _AudioTracksPageState();
}

class _AudioTracksPageState extends ConsumerState<AudioTracksPage> {
  @override
  void initState() {
    super.initState();
    // Load tracks for this category
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(criticalAlphaAudioControllerProvider.notifier)
          .loadTracksForCategory(widget.categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final audioState = ref.watch(criticalAlphaAudioControllerProvider);
    final category = audioState.selectedCategory;
    final tracks = audioState.currentCategoryTracks;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: Text(
          category?.name ?? 'Audio Tracks',
          style: const TextStyle(
            color: Colors.black,
            fontFamily: AppFonts.poppins,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: tracks.isEmpty && audioState.error == null
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
                        'Failed to load tracks',
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
                              .loadTracksForCategory(widget.categoryId);
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
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: tracks.length,
                  itemBuilder: (context, index) {
                    final track = tracks[index];
                    final isCurrentTrack = audioState.currentTrack?.id == track.id;
                    final isPlaying = isCurrentTrack && audioState.isPlaying;

                    return _buildTrackCard(track, isCurrentTrack, isPlaying);
                  },
                ),
    );
  }

  Widget _buildTrackCard(AudioTrack track, bool isCurrentTrack, bool isPlaying) {
    return GestureDetector(
      onTap: () async {
        final controller = ref.read(criticalAlphaAudioControllerProvider.notifier);

        // Always play the track first
        if (!isCurrentTrack) {
          await controller.playTrack(track);
        }

        // Navigate to music player
        if (context.mounted) {
          context.push('/audio/player');
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: isCurrentTrack ? AppColors.primary.withOpacity(0.05) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: isCurrentTrack
                ? AppColors.primary
                : AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(25),
          ),
          child: IconButton(
            icon: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              color: isCurrentTrack ? Colors.white : AppColors.primary,
            ),
            onPressed: () async {
              // Prevent the GestureDetector tap from firing
              final controller = ref.read(criticalAlphaAudioControllerProvider.notifier);

              if (isCurrentTrack) {
                // Just toggle play/pause for current track
                await controller.togglePlayPause();
              } else {
                // Start playing the track but don't navigate
                await controller.playTrack(track);
              }
            },
          ),
        ),
        title: Text(
          track.title,
          style: TextStyle(
            fontFamily: AppFonts.poppins,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: isCurrentTrack ? AppColors.primary : Colors.black87,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (track.description != null) ...[
              const SizedBox(height: 4),
              Text(
                track.description!,
                style: TextStyle(
                  fontFamily: AppFonts.poppins,
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: 14,
                  color: Colors.grey[500],
                ),
                const SizedBox(width: 4),
                Text(
                  track.formattedDuration,
                  style: TextStyle(
                    fontFamily: AppFonts.poppins,
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
                if (track.authorName != null) ...[
                  const SizedBox(width: 12),
                  Icon(
                    Icons.person,
                    size: 14,
                    color: Colors.grey[500],
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      track.authorName!,
                      style: TextStyle(
                        fontFamily: AppFonts.poppins,
                        fontSize: 12,
                        color: Colors.grey[500],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }
}