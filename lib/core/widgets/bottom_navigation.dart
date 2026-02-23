import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'custom_floating_bottom_nav.dart';
import 'custom_drawer.dart';

// Global key to control drawer from anywhere
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class ScaffoldWithBottomNavigation extends ConsumerWidget {
  final Widget child;

  const ScaffoldWithBottomNavigation({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      body: child,
      drawer: const CustomDrawer(),
      bottomNavigationBar: const CustomFloatingBottomNav(),
    );
  }
}

// Helper function to open drawer from anywhere
void openDrawer() {
  scaffoldKey.currentState?.openDrawer();
}