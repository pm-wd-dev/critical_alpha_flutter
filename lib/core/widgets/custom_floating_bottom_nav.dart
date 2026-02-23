import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomFloatingBottomNav extends ConsumerWidget {
  const CustomFloatingBottomNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocation = GoRouterState.of(context).uri.path;

    // Determine which tab is active (only 3 tabs now)
    int currentIndex = 0;
    if (currentLocation.startsWith('/home')) {
      currentIndex = 0;
    } else if (currentLocation.startsWith('/goals')) {
      currentIndex = 1;
    } else if (currentLocation.startsWith('/results')) {
      currentIndex = 2;
    } else if (currentLocation.startsWith('/audio')) {
      // Redirect audio to home
      currentIndex = 0;
    } else if (currentLocation.startsWith('/settings')) {
      // Redirect settings to home
      currentIndex = 0;
    }

    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Home Tab
            _buildNavItem(
              context: context,
              activeIcon: Icons.home,
              inactiveIcon: Icons.home_outlined,
              label: 'Home',
              isActive: currentIndex == 0,
              onTap: () => context.go('/home'),
            ),

            // Plans Tab with clipboard + plus icon
            _buildPlansNavItem(
              context: context,
              label: 'Plans',
              isActive: currentIndex == 1,
              onTap: () => context.go('/goals'),
            ),

            // Results Tab with clipboard + check icon
            _buildResultsNavItem(
              context: context,
              label: 'Results',
              isActive: currentIndex == 2,
              onTap: () => context.go('/results'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required IconData activeIcon,
    required IconData inactiveIcon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: EdgeInsets.symmetric(
              horizontal: isActive ? 14 : 12,
              vertical: isActive ? 10 : 8,
            ),
            decoration: BoxDecoration(
              color: isActive ? const Color(0xFF0147D9) : Colors.transparent,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isActive ? activeIcon : inactiveIcon,
                  color: isActive ? Colors.white : const Color(0xFF9CA3AF),
                  size: 22,
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: isActive
                      ? Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            label,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlansNavItem({
    required BuildContext context,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: EdgeInsets.symmetric(
              horizontal: isActive ? 14 : 12,
              vertical: isActive ? 10 : 8,
            ),
            decoration: BoxDecoration(
              color: isActive ? const Color(0xFF0147D9) : Colors.transparent,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Clipboard with plus icon
                SizedBox(
                  width: 22,
                  height: 22,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(
                        isActive ? Icons.assignment : Icons.assignment_outlined,
                        color: isActive ? Colors.white : const Color(0xFF9CA3AF),
                        size: 22,
                      ),
                      Positioned(
                        right: -2,
                        bottom: -2,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: isActive ? Colors.white : const Color(0xFF9CA3AF),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isActive ? const Color(0xFF0147D9) : Colors.white,
                              width: 1.2,
                            ),
                          ),
                          child: Icon(
                            Icons.add,
                            color: isActive ? const Color(0xFF0147D9) : Colors.white,
                            size: 7,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: isActive
                      ? Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            label,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResultsNavItem({
    required BuildContext context,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: EdgeInsets.symmetric(
              horizontal: isActive ? 14 : 12,
              vertical: isActive ? 10 : 8,
            ),
            decoration: BoxDecoration(
              color: isActive ? const Color(0xFF0147D9) : Colors.transparent,
              borderRadius: BorderRadius.circular(25),
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Clipboard with check icon
                  Icon(
                    isActive ? Icons.assignment_turned_in : Icons.assignment_turned_in_outlined,
                    color: isActive ? Colors.white : const Color(0xFF9CA3AF),
                    size: 22,
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: isActive
                        ? Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Text(
                              label,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}