import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/animations.dart';

class AnimationCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double width;
  final double? height;
  final EdgeInsetsGeometry padding;
  final bool isGlass;

  const AnimationCard({
    super.key,
    required this.child,
    this.onTap,
    this.width = 300,
    this.height,
    this.padding = const EdgeInsets.all(20),
    this.isGlass = false,
  });

  @override
  State<AnimationCard> createState() => _AnimationCardState();
}

class _AnimationCardState extends State<AnimationCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: AppAnimations.hoverDuration,
          curve: AppAnimations.hoverCurve,
          width: widget.width,
          height: widget.height,
          padding: widget.padding,
          transform: Matrix4.identity()
            ..translate(0.0, _isHovered ? AppAnimations.hoverTranslateY : 0.0)
            ..scale(_isHovered ? AppAnimations.hoverScale : 1.0),
          decoration: BoxDecoration(
            color: widget.isGlass
                ? Theme.of(context).colorScheme.surface.withValues(alpha: .1)
                : Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            gradient: widget.isGlass ? null : AppTheme.darkCardGradient,
            boxShadow: _isHovered
                ? AppTheme.floatingShadow(isDark)
                : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
            border: Border.all(
              color: _isHovered
                  ? AppTheme.accentColor.withValues(alpha: .5)
                  : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
