import '../../shared/utils/all_packages.dart';

class Header extends StatefulWidget {
  const Header(
      {super.key,
      required this.sizeAnimation1,
      required this.alignmentAnimation,
      required this.sizeAnimation,
      required this.controller,
      required this.borderRadiusAnimation});
  final Animation<double> sizeAnimation;
  final Animation<Size> sizeAnimation1;
  final Animation<Alignment> alignmentAnimation;
  final AnimationController controller;
  final Animation<double> borderRadiusAnimation;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: AnimatedBuilder(
                animation: widget.sizeAnimation1,
                builder: (context, child) {
                  return Align(
                    alignment: widget.alignmentAnimation.value,
                    child: Container(
                      width: widget.sizeAnimation1.value.width,
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.grey,
                            blurRadius: 0.5,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: SvgPicture.asset(SvgAssets.location,
                                color: widget.sizeAnimation1.isAnimating
                                    ? AppColors.white
                                    : AppColors.grey),
                          ),
                          Expanded(
                            flex: 4,
                            child: Styles.regular("Saint Petersburg",
                                fontSize: widget.sizeAnimation1.isAnimating
                                    ? 1
                                    : null,
                                color: AppColors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          AnimatedBuilder(
              animation: widget.controller,
              builder: (context, child) {
                return Container(
                  width: widget.sizeAnimation.value,
                  height: widget.sizeAnimation.value,
                  decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(
                          widget.borderRadiusAnimation.value)
                      // )
                      ),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage(ImageAssets.profile),
                  ),
                );
              })
        ],
      ),
    );
  }
}
