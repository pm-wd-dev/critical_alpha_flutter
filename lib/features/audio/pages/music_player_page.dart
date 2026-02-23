import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';

class MusicPlayerPage extends StatelessWidget {
  final String trackId;
  
  const MusicPlayerPage({super.key, required this.trackId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Audio Player')),
      body: const Center(
        child: Text('Music Player - Coming Soon'),
      ),
    );
  }
}