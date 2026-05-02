import 'package:flutter/material.dart';
import '../../../../Core/Constants/assets.dart';
import '../../Data/Models/onboarding_models.dart';

class OnboardingBody extends StatelessWidget {
  final OnboardingModel model;
  final int pageIndex;
  final int currentPage;
  final int totalPages;
  final VoidCallback onPressed;

  const OnboardingBody({
    super.key,
    required this.model,
    required this.pageIndex,
    required this.currentPage,
    required this.totalPages,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //
        Expanded(
          flex: 3,
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 60, 20, 10),
            decoration: BoxDecoration(
              color: model.pageColor ?? const Color(0xFF1E319D),
              borderRadius: BorderRadius.circular(40),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 40, 25, 10),
                  child: // FIX: wrapped with FittedBox to prevent horizontal overflow
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      model.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Text(
                    model.subTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                ),
                Expanded(child: _OnboardingIllustration(pageIndex: pageIndex)),
              ],
            ),
          ),
        ),

        Container(
          height: 130,
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20, 5, 20, 10),
          decoration: BoxDecoration(
            color: model.pageColor ?? const Color(0xFF1E319D),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      model.buttonText,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  totalPages,
                  (i) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: i == currentPage ? 10 : 5.5,
                    height: 8,
                    decoration: BoxDecoration(
                      color: i == currentPage ? Colors.white : Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Illustrations

class _OnboardingIllustration extends StatelessWidget {
  final int pageIndex;
  const _OnboardingIllustration({required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    switch (pageIndex) {
      case 0:
        return const _Page0Illustration();
      case 1:
        return const _Page1Illustration();
      case 2:
        return const _Page2Illustration();
      case 3:
        return const _Page3Illustration();
      default:
        return const SizedBox.shrink();
    }
  }
}

class _Page0Illustration extends StatelessWidget {
  const _Page0Illustration();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: -h * 0.00001,
              right: w * 0.0005,
              child: Image.asset(Assets.imagesPolygon1, width: w * 0.65),
            ),
            Positioned(
              top: h * 0.20,
              right: w * 0.15,
              child: Image.asset(Assets.imagesPolygon2, width: w * 0.25),
            ),
            Positioned(
              bottom: h * 0.15,
              right: w * 0.20,
              child: Image.asset(Assets.imagesEllipse5, width: w * 0.55),
            ),
          ],
        );
      },
    );
  }
}

class _Page1Illustration extends StatelessWidget {
  const _Page1Illustration();
  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _CirclesPainter(), size: Size.infinite);
  }
}

class _CirclesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8;
    final radius = size.width * 0.30;
    canvas.drawCircle(
      Offset(size.width * 0.55, size.height * 0.53),
      radius,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.90, size.height * 0.60),
      radius,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.62, size.height * 0.80),
      radius,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _Page2Illustration extends StatelessWidget {
  const _Page2Illustration();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -h * 0.10,
              left: w * 0.10,
              child: Image.asset(Assets.imagesStar1, width: w * 0.92),
            ),
            Positioned(
              top: h * 0.15,
              left: w * 0.30,
              child: Image.asset(Assets.imagesStar2, width: w * 0.71),
            ),
            Positioned(
              bottom: -h * 0.15,
              right: w * 0.00001,
              top: h * 0.1,
              child: Image.asset(Assets.imagesStar3, width: w * 0.52),
            ),
          ],
        );
      },
    );
  }
}

class _Page3Illustration extends StatelessWidget {
  const _Page3Illustration();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: h * 0.001,
              left: w * 0.40,
              child: Image.asset(Assets.imagesStar4, width: w * 0.60),
            ),
            Positioned(
              bottom: h * 0.10,
              left: w * 0.18,
              child: Image.asset(Assets.imagesStar6, width: w * 0.80),
            ),
            Positioned(
              bottom: h * 0.55,
              left: w * 0.10,
              child: Image.asset(Assets.imagesStar5, width: w * 0.10),
            ),
            Positioned(
              bottom: h * 0.70,
              left: w * 0.82,
              child: Image.asset(Assets.imagesStar7, width: w * 0.17),
            ),
          ],
        );
      },
    );
  }
}
