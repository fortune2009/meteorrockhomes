import 'package:flutter_svg/svg.dart';
import 'package:meteorrockhome/shared/utils/assets.dart';
import 'package:meteorrockhome/shared/utils/colors.dart';
import 'package:meteorrockhome/shared/utils/styles.dart';

import '../shared/utils/all_packages.dart';
import 'bottom_nav_model.dart';

class BottomNav extends StatefulWidget {
  final bool? showProviderProfile;

  const BottomNav({super.key, this.showProviderProfile});
  @override
  State<StatefulWidget> createState() {
    return _BottomNav();
  }
}

class _BottomNav extends State<BottomNav>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _alignmentAnimation;
  late Animation<Size> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Define alignment animation (bottom-left to center)
    _alignmentAnimation = AlignmentTween(
      begin: const Alignment(0, 20),
      end: Alignment.bottomCenter,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    ));
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sizeAnimation = Tween<Size>(
      begin: const Size(50, 90),
      end: Size(deviceWidth(context) / 1.2.w, 90),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.detached:
        // _fetchData(context);
        break;
      default:
        break;
    }
  }

  _fetchData(BuildContext context) {}

  Future<bool> showExitPopup() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Styles.regular('Exit App',
                fontSize: 14.sp, color: AppColors.black),
            content: Styles.regular('Do you want to exit an App?',
                fontSize: 14.sp, color: AppColors.black),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Styles.regular('No',
                    fontSize: 14.sp, color: AppColors.black),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Styles.regular('Yes',
                    fontSize: 14.sp, color: AppColors.black),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavModel>(builder: (context, model, child) {
      return WillPopScope(
        onWillPop: showExitPopup,
        child: Scaffold(
          backgroundColor: AppColors.white,
          // bottomNavigationBar: BottomNavigationBar(
          //     onTap: (index) => model.updateIndex(index, context),
          //     type: BottomNavigationBarType.fixed,
          //     selectedItemColor: AppColors.orange,
          //     selectedLabelStyle: TextStyle(
          //         color: AppColors.white,
          //         fontSize: 12.sp,
          //         fontWeight: FontWeight.w500),
          //     unselectedLabelStyle: TextStyle(
          //         color: AppColors.white,
          //         fontSize: 12.sp,
          //         fontWeight: FontWeight.w500),
          //     backgroundColor: AppColors.black,
          //     currentIndex: model.currentIndex,
          //     items: SvgAssets.navigationSvgs
          //         .map((e) => BottomNavigationBarItem(
          //               activeIcon: SvgPicture.asset(
          //                 e,
          //                 color: AppColors.white,
          //               ),
          //               icon: SvgPicture.asset(
          //                 e,
          //                 color: AppColors.white,
          //               ),
          //               label: "",
          //             ))
          //         .toList()),
          floatingActionButton: Align(
            alignment: Alignment.bottomLeft,
            child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Align(
                    alignment: _alignmentAnimation.value,
                    child: SizedBox(
                      // height: 90.h,
                      // width: deviceWidth(context) / 1.2.w,
                      width: _sizeAnimation.value.width,
                      height: _sizeAnimation.value.height,
                      // padding: EdgeInsets.all(8.r),
                      child: ClipRRect(
                        // clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.circular(100.r),
                        child: BottomNavigationBar(
                            onTap: (index) => model.updateIndex(index, context),
                            type: BottomNavigationBarType.fixed,
                            selectedItemColor: AppColors.orange,
                            showUnselectedLabels: false,
                            showSelectedLabels: false,
                            backgroundColor: AppColors.black2,
                            currentIndex: model.currentIndex,
                            // selectedIconTheme: IconThemeData(fill: 12),
                            items: SvgAssets.navigationSvgs
                                .map((e) => BottomNavigationBarItem(
                                      activeIcon: Container(
                                        padding: EdgeInsets.all(14.r),
                                        decoration: BoxDecoration(
                                            color: AppColors.orange,
                                            borderRadius:
                                                BorderRadius.circular(100.r)),
                                        child: SvgPicture.asset(
                                          e,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      icon: InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: Container(
                                          padding: EdgeInsets.all(12.r),
                                          decoration: BoxDecoration(
                                              color: AppColors.black3,
                                              borderRadius:
                                                  BorderRadius.circular(100.r)),
                                          child: SvgPicture.asset(
                                            e,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                      label: "",
                                    ))
                                .toList()),
                      ),
                    ),
                  );
                }),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          // items: userBottomTabItems(context)),
          body: SizedBox(
              height: deviceHeight(context).h,
              width: deviceWidth(context).w,
              child: model.children[model.currentIndex]),
        ),
      );
    });
  }

  // userBottomTabItems(BuildContext context) {
  //   return [
  //     BottomNavigationBarItem(
  //       activeIcon: SvgPicture.asset(
  //         SvgAssets.search,
  //       ),
  //       icon: SvgPicture.asset(
  //         SvgAssets.search,
  //       ),
  //       label: "",
  //     ),
  //     BottomNavigationBarItem(
  //       activeIcon: SvgPicture.asset(
  //         SvgAssets.message,
  //       ),
  //       icon: SvgPicture.asset(
  //         SvgAssets.message,
  //       ),
  //       label: "",
  //     ),
  //     BottomNavigationBarItem(
  //       activeIcon: SvgPicture.asset(
  //         SvgAssets.home,
  //       ),
  //       icon: SvgPicture.asset(
  //         SvgAssets.home,
  //       ),
  //       label: "",
  //     ),
  //     BottomNavigationBarItem(
  //       activeIcon: SvgPicture.asset(
  //         SvgAssets.heart,
  //       ),
  //       icon: SvgPicture.asset(
  //         SvgAssets.heart,
  //       ),
  //       label: "",
  //     ),
  //     BottomNavigationBarItem(
  //       activeIcon: SvgPicture.asset(
  //         SvgAssets.user,
  //       ),
  //       icon: SvgPicture.asset(
  //         SvgAssets.user,
  //       ),
  //       label: "",
  //     ),
  //   ];
  // }
}
