import 'package:meteorrockhome/shared/utils/all_packages.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _controller,
      _controller2,
      _controller3,
      _controller4;
  late Animation<double> _borderRadiusAnimation,
      _sizeAnimation,
      _sizeAnimation4,
      _dropAnimation4;

  late Animation<Alignment> _alignmentAnimation2;
  late Animation<Size> _sizeAnimation2;

  late Animation<Offset> _sizeAnimation3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _borderRadiusAnimation = Tween<double>(begin: 3, end: 20).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _sizeAnimation = Tween<double>(begin: 3, end: 52).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    _sizeAnimation4 =
        Tween<double>(begin: 3, end: Platform.isAndroid ? 160.h : 180.h)
            .animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _alignmentAnimation2 = AlignmentTween(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    _sizeAnimation2 = Tween<Size>(
      begin: const Size(1, 1),
      end: const Size(170, 40),
    ).animate(CurvedAnimation(
      parent: _controller2,
      curve: Curves.easeIn,
    ));

    _controller3 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controller4 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _dropAnimation4 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation
    _controller.forward();
    _controller2.forward();
    _controller4.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sizeAnimation3 = Tween<Offset>(
      begin: Offset(0.w, 1.h),
      end: Offset(0.w, 0.h),
    ).animate(CurvedAnimation(
      parent: _controller3,
      curve: Curves.easeIn,
    ));

    _controller3.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            tileMode: TileMode.clamp,
            colors: [
              AppColors.white,
              AppColors.orange.withOpacity(.01),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.35, 0.8], // Where each color starts
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            Platform.isAndroid ? HSpace(45.h) : HSpace(55.h),
            Header(
              sizeAnimation1: _sizeAnimation2,
              sizeAnimation: _sizeAnimation,
              controller: _controller,
              alignmentAnimation: _alignmentAnimation2,
              borderRadiusAnimation: _borderRadiusAnimation,
            ),
            HSpace(40.h),
            Welcome(
              dropAnimation4: _dropAnimation4,
            ),
            HSpace(32.h),
            Analytics(
              controller: _controller,
              sizeAnimation4: _sizeAnimation4,
            ),
            HSpace(30.h),
            Explore(
              controller: _controller3,
              sizeAnimation: _sizeAnimation3,
            ),
            HSpace(100.h),
          ],
        ),
      ),
    );
  }
}
