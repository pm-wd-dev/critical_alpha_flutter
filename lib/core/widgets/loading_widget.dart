import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../constants/app_constants.dart';

enum LoadingType {
  circular,
  linear,
  shimmer,
  skeleton,
  dots,
  pulse,
}

class LoadingWidget extends StatelessWidget {
  final LoadingType type;
  final String? message;
  final Color? color;
  final double? size;
  final double? strokeWidth;
  final bool showMessage;

  const LoadingWidget({
    super.key,
    this.type = LoadingType.circular,
    this.message,
    this.color,
    this.size,
    this.strokeWidth,
    this.showMessage = true,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case LoadingType.circular:
        return _buildCircularLoading(context);
      case LoadingType.linear:
        return _buildLinearLoading(context);
      case LoadingType.shimmer:
        return _buildShimmerLoading();
      case LoadingType.skeleton:
        return _buildSkeletonLoading();
      case LoadingType.dots:
        return _buildDotsLoading();
      case LoadingType.pulse:
        return _buildPulseLoading();
    }
  }

  Widget _buildCircularLoading(BuildContext context) {
    final indicator = SizedBox(
      width: size ?? 24,
      height: size ?? 24,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 3,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? AppColors.primary,
        ),
      ),
    );

    if (!showMessage || message == null) {
      return Center(child: indicator);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        indicator,
        const SizedBox(height: 16),
        Text(
          message!,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildLinearLoading(BuildContext context) {
    final indicator = LinearProgressIndicator(
      backgroundColor: AppColors.grey200,
      valueColor: AlwaysStoppedAnimation<Color>(
        color ?? AppColors.primary,
      ),
    );

    if (!showMessage || message == null) {
      return indicator;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        indicator,
        const SizedBox(height: 16),
        Text(
          message!,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: AppColors.grey200,
      highlightColor: AppColors.grey100,
      child: Container(
        width: size ?? double.infinity,
        height: size ?? 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppBorderRadius.medium),
        ),
      ),
    );
  }

  Widget _buildSkeletonLoading() {
    return Shimmer.fromColors(
      baseColor: AppColors.grey200,
      highlightColor: AppColors.grey100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: 200,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 150,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDotsLoading() {
    return const _DotsLoadingAnimation();
  }

  Widget _buildPulseLoading() {
    return _PulseLoadingAnimation(
      color: color ?? AppColors.primary,
      size: size ?? 50,
    );
  }
}

class _DotsLoadingAnimation extends StatefulWidget {
  const _DotsLoadingAnimation();

  @override
  State<_DotsLoadingAnimation> createState() => _DotsLoadingAnimationState();
}

class _DotsLoadingAnimationState extends State<_DotsLoadingAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _controller3 = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _startAnimations();
  }

  void _startAnimations() async {
    while (mounted) {
      await _controller1.forward();
      await Future.delayed(const Duration(milliseconds: 200));
      await _controller2.forward();
      await Future.delayed(const Duration(milliseconds: 200));
      await _controller3.forward();
      await Future.delayed(const Duration(milliseconds: 200));

      _controller1.reset();
      _controller2.reset();
      _controller3.reset();
      await Future.delayed(const Duration(milliseconds: 400));
    }
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(_controller1),
        const SizedBox(width: 8),
        _buildDot(_controller2),
        const SizedBox(width: 8),
        _buildDot(_controller3),
      ],
    );
  }

  Widget _buildDot(AnimationController controller) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.scale(
          scale: 0.5 + (controller.value * 0.5),
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.3 + (controller.value * 0.7)),
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}

class _PulseLoadingAnimation extends StatefulWidget {
  final Color color;
  final double size;

  const _PulseLoadingAnimation({
    required this.color,
    required this.size,
  });

  @override
  State<_PulseLoadingAnimation> createState() => _PulseLoadingAnimationState();
}

class _PulseLoadingAnimationState extends State<_PulseLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: widget.color.withOpacity(0.3 + (_animation.value * 0.7)),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              width: widget.size * 0.6,
              height: widget.size * 0.6,
              decoration: BoxDecoration(
                color: widget.color,
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }
}

// Specialized loading widgets for common use cases
class PageLoadingWidget extends StatelessWidget {
  final String? message;

  const PageLoadingWidget({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingWidget(
          type: LoadingType.circular,
          message: message ?? AppStrings.loading,
          size: 36,
        ),
      ),
    );
  }
}

class ButtonLoadingWidget extends StatelessWidget {
  final Color? color;
  final double size;

  const ButtonLoadingWidget({
    super.key,
    this.color,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      type: LoadingType.circular,
      color: color ?? AppColors.white,
      size: size,
      strokeWidth: 2,
      showMessage: false,
    );
  }
}

class ListLoadingWidget extends StatelessWidget {
  final int itemCount;

  const ListLoadingWidget({
    super.key,
    this.itemCount = 5,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      padding: AppPadding.medium,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: AppPadding.medium,
            child: const LoadingWidget(
              type: LoadingType.skeleton,
              showMessage: false,
            ),
          ),
        );
      },
    );
  }
}

class GridLoadingWidget extends StatelessWidget {
  final int itemCount;
  final int crossAxisCount;

  const GridLoadingWidget({
    super.key,
    this.itemCount = 6,
    this.crossAxisCount = 2,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: itemCount,
      padding: AppPadding.medium,
      itemBuilder: (context, index) {
        return Card(
          child: const LoadingWidget(
            type: LoadingType.shimmer,
            showMessage: false,
          ),
        );
      },
    );
  }
}

class OverlayLoadingWidget extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final String? message;
  final Color? backgroundColor;

  const OverlayLoadingWidget({
    super.key,
    required this.child,
    required this.isLoading,
    this.message,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: backgroundColor ??
                   AppColors.black.withOpacity(0.5),
            child: Center(
              child: Card(
                child: Padding(
                  padding: AppPadding.large,
                  child: LoadingWidget(
                    type: LoadingType.circular,
                    message: message ?? AppStrings.loading,
                    size: 36,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class RefreshLoadingWidget extends StatelessWidget {
  final VoidCallback onRefresh;
  final Widget child;

  const RefreshLoadingWidget({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      color: AppColors.primary,
      backgroundColor: AppColors.white,
      child: child,
    );
  }
}