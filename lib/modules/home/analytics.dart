import 'package:meteorrockhome/shared/utils/all_packages.dart';

class Analytics extends StatefulWidget {
  const Analytics({super.key, required this.controller, this.sizeAnimation4});
  final AnimationController controller;
  final sizeAnimation4;

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          Expanded(
            child: AnimatedBuilder(
                animation: widget.controller,
                builder: (context, child) {
                  return Container(
                    width: widget.sizeAnimation4.value,
                    height: widget.sizeAnimation4.value,
                    decoration: const BoxDecoration(
                      color: AppColors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(14.r),
                      child: Column(
                        children: [
                          Styles.regular("BUY",
                              fontSize:
                                  widget.sizeAnimation4.isAnimating ? 1 : 14.sp,
                              color: AppColors.white),
                          HSpace(24.h),
                          TweenAnimationBuilder<double>(
                              tween: Tween<double>(begin: 0, end: 1034),
                              duration: const Duration(seconds: 2),
                              builder: (context, value, child) {
                                return Styles.bold("${value.toInt()}",
                                    fontSize: widget.sizeAnimation4.isAnimating
                                        ? 20.sp
                                        : 40.sp,
                                    color: AppColors.white);
                              }),
                          HSpace(6.h),
                          Styles.regular("Offers",
                              fontSize:
                                  widget.sizeAnimation4.isAnimating ? 1 : 14.sp,
                              color: AppColors.white),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          WSpace(14.w),
          Expanded(
            child: AnimatedBuilder(
                animation: widget.controller,
                builder: (context, child) {
                  return Container(
                    width: widget.sizeAnimation4.value,
                    height: widget.sizeAnimation4.value,
                    // height: Platform.isAndroid ? 160.h : 180.h,
                    // width: Platform.isAndroid ? 160.w : 180.w,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.grey,
                          blurRadius: 0.122,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: [
                          Styles.regular("RENT",
                              fontSize:
                                  widget.sizeAnimation4.isAnimating ? 1 : 14.sp,
                              color: AppColors.grey),
                          HSpace(24.h),
                          TweenAnimationBuilder<double>(
                              tween: Tween<double>(begin: 0, end: 2212),
                              duration: const Duration(seconds: 2),
                              builder: (context, value, child) {
                                return Styles.bold("${value.toInt()}",
                                    fontSize: widget.sizeAnimation4.isAnimating
                                        ? 20.sp
                                        : 40.sp,
                                    color: AppColors.grey);
                              }),
                          HSpace(6.h),
                          Styles.regular("Offers",
                              fontSize: widget.sizeAnimation4.isAnimating
                                  ? 1.sp
                                  : 14.sp,
                              color: AppColors.grey),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
