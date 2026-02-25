import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_fonts.dart';
import '../controllers/critical_alpha_audio_controller.dart';

class MusicPlayerPage extends ConsumerWidget {
  const MusicPlayerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioState = ref.watch(criticalAlphaAudioControllerProvider);
    final controller = ref.read(criticalAlphaAudioControllerProvider.notifier);
    final track = audioState.currentTrack;

    if (track == null) {
      // No track selected - go back
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pop();
      });
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

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
            // Stop audio when leaving music player
            ref.read(criticalAlphaAudioControllerProvider.notifier).stopAudio();
            context.pop();
          },
        ),
        title: const Text(
          'Now Playing',
          style: TextStyle(
            color: Colors.black,
            fontFamily: AppFonts.poppins,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Album art / Icon
            Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(
                Icons.audiotrack,
                size: 100,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 30),

            // Track title
            Text(
              track.title,
              style: const TextStyle(
                fontFamily: AppFonts.poppins,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),

            // Author/Artist
            if (track.authorName != null)
              Text(
                track.authorName!,
                style: TextStyle(
                  fontFamily: AppFonts.poppins,
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            const SizedBox(height: 24),

            // Progress bar
            Column(
              children: [
                Slider(
                  value: audioState.progress.clamp(0.0, 1.0),
                  onChanged: (value) {
                    final newPosition = (value * audioState.duration).toInt();
                    controller.seekTo(newPosition);
                  },
                  activeColor: AppColors.primary,
                  inactiveColor: Colors.grey[300],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        audioState.formattedPosition,
                        style: TextStyle(
                          fontFamily: AppFonts.poppins,
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        audioState.formattedDuration,
                        style: TextStyle(
                          fontFamily: AppFonts.poppins,
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Playback controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Skip backward 15s
                IconButton(
                  onPressed: () => controller.skipBackward(),
                  icon: const Icon(Icons.replay_10),
                  iconSize: 36,
                  color: Colors.black87,
                ),

                // Previous track (if playlist exists)
                IconButton(
                  onPressed: null, // Disabled for now
                  icon: const Icon(Icons.skip_previous),
                  iconSize: 40,
                  color: Colors.grey,
                ),

                // Play/Pause button
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () => controller.togglePlayPause(),
                    icon: Icon(
                      audioState.isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 40,
                    ),
                    iconSize: 60,
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                  ),
                ),

                // Next track (if playlist exists)
                IconButton(
                  onPressed: null, // Disabled for now
                  icon: const Icon(Icons.skip_next),
                  iconSize: 40,
                  color: Colors.grey,
                ),

                // Skip forward 15s
                IconButton(
                  onPressed: () => controller.skipForward(),
                  icon: const Icon(Icons.forward_10),
                  iconSize: 36,
                  color: Colors.black87,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Playback speed controls
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.speed, size: 20, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(
                    'Speed:',
                    style: TextStyle(
                      fontFamily: AppFonts.poppins,
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(width: 8),
                  ...[1.0, 1.5, 2.0].map((speed) {
                    final isSelected = audioState.playbackSpeed == speed;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: GestureDetector(
                        onTap: () => controller.setPlaybackSpeed(speed),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primary
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            '${speed}x',
                            style: TextStyle(
                              fontFamily: AppFonts.poppins,
                              fontSize: 14,
                              color: isSelected ? Colors.white : Colors.grey[700],
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),

            // Show buffering indicator if needed
            if (audioState.isBuffering)
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              ),
          ],
        ),
        ),
      ),
      ),
    );
  }
}