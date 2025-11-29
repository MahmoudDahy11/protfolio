import 'dart:math';
import 'package:flutter/material.dart';

class ParticleBackground extends StatefulWidget {
  const ParticleBackground({super.key});

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    for (int i = 0; i < 50; i++) {
      _particles.add(Particle(_random));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        for (var particle in _particles) {
          particle.update();
        }
        return CustomPaint(
          painter: ParticlePainter(
            _particles,
            Theme.of(context).brightness == Brightness.dark,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

class Particle {
  late double x;
  late double y;
  late double speed;
  late double theta;
  late double radius;
  late double opacity;

  Particle(Random random) {
    x = random.nextDouble();
    y = random.nextDouble();
    speed = random.nextDouble() * 0.002 + 0.001;
    theta = random.nextDouble() * 2 * pi;
    radius = random.nextDouble() * 2 + 1;
    opacity = random.nextDouble() * 0.5 + 0.1;
  }

  void update() {
    x += speed * cos(theta);
    y += speed * sin(theta);

    if (x < 0 || x > 1 || y < 0 || y > 1) {
      x = (x + 1) % 1;
      y = (y + 1) % 1;
    }
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final bool isDark;

  ParticlePainter(this.particles, this.isDark);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isDark ? Colors.white : Colors.black
      ..style = PaintingStyle.fill;

    for (var particle in particles) {
      paint.color = (isDark ? Colors.white : Colors.black).withValues(
        alpha: particle.opacity,
      );
      canvas.drawCircle(
        Offset(particle.x * size.width, particle.y * size.height),
        particle.radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
