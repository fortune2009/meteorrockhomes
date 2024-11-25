import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:meteorrockhome/shared/utils/all_packages.dart';
import 'package:meteorrockhome/shared/utils/assets.dart';
import 'package:meteorrockhome/shared/utils/colors.dart';
import 'package:meteorrockhome/shared/utils/styles.dart';

class GridCaption extends StatefulWidget {
  const GridCaption({super.key, this.title});
  final String? title;
  // final BuildContext? context;

  @override
  State<GridCaption> createState() => _GridCaptionState();
}

class _GridCaptionState extends State<GridCaption>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _alignmentAnimation;
  late Animation<Size> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _alignmentAnimation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    _sizeAnimation = Tween<Size>(
      begin: const Size(1, 1),
      end: Size(deviceWidth(context) / 2.5.w, 40),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    // Dispose the controller to avoid memory leaks
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: AnimatedBuilder(
          animation: _sizeAnimation,
          builder: (context, child) {
            return Align(
              alignment: _alignmentAnimation.value,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: _sizeAnimation.value.width,
                    // width: deviceWidth(context) / 3.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: AppColors.white.withOpacity(.5),
                        border:
                            Border.all(color: AppColors.white, width: 0.2.w)),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 5,
                          left: 10,
                          child: Styles.regular(
                            widget.title ?? "Hello",
                          ),
                        ),
                        Positioned(
                          top: 1,
                          right: 1,
                          child: Container(
                            width: 30.w,
                            height: 30.h,
                            decoration: const BoxDecoration(
                                color: AppColors.white, shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                SvgAssets.forward,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
