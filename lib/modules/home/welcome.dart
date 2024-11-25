import 'package:meteorrockhome/shared/utils/all_packages.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key, this.dropAnimation4});
  final dropAnimation4;

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.dropAnimation4,
        builder: (context, child) {
          return ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: const [
                  Colors.transparent,
                  Colors.white,
                  Colors.transparent,
                ],
                stops: [
                  widget.dropAnimation4.value - 0.05, // Narrow line
                  widget.dropAnimation4.value,
                  widget.dropAnimation4.value + 0.05,
                ],
              ).createShader(rect);
            },
            blendMode: BlendMode.srcATop,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Styles.regular("Hi, Marina",
                      fontSize: 24.sp, color: AppColors.grey),
                  HSpace(6.h),
                  Styles.semiBold("let's select your",
                      fontSize: 36.sp, color: AppColors.black),
                  Styles.semiBold("perfect place",
                      fontSize: 36.sp, color: AppColors.black),
                ],
              ),
            ),
          );
        });
  }
}
