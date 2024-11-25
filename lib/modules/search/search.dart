import 'dart:ui';

import 'package:google_place/google_place.dart';
import 'package:meteorrockhome/shared/utils/all_packages.dart';

class SearchEstate extends StatefulWidget {
  const SearchEstate({super.key});

  @override
  State<SearchEstate> createState() => _SearchEstateState();
}

class _SearchEstateState extends State<SearchEstate>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;
  late AnimationController _controller3;
  late Animation<Alignment> _alignmentAnimation;
  late Animation<Alignment> _alignmentAnimation2;
  late Animation<Alignment> _alignmentAnimation3;
  late Animation<Size> _sizeAnimation;
  late Animation<Size> _sizeAnimation2;
  late Animation<Size> _sizeAnimation3;
  late Animation<Size> _sizeAnimation4;
  late Animation<Size> _sizeAnimation5;
  late Animation<Size> _sizeAnimation6;

  late GoogleMapController _mapController;
  late GooglePlace googlePlace;
  final Set<Marker> _markers = {};
  final GlobalKey _markerKey = GlobalKey();
  BitmapDescriptor? _customMarkerIcon;
  final double _containerHeightSize = 40;
  final double _containerWidthSize = 70;
  List<AutocompletePrediction> predictions = [];
  bool onTapOption = false;
  String svg = SvgAssets.stack;
  int optionIndex = 0;
  final LatLng _initialPosition =
      const LatLng(37.7749, -122.4194); // Default: San Francisco
  List<Map<String, dynamic>> properties = [
    {"id": 1, "name": "12mn \$", "lat": 37.7749, "lng": -122.4194},
    {"id": 2, "name": "11mn \$", "lat": 37.7849, "lng": -122.4494},
    {"id": 3, "name": "7,8mn \$", "lat": 37.7349, "lng": -122.4294},
    {"id": 4, "name": "8,5mn \$", "lat": 37.7649, "lng": -122.4394},
    {"id": 5, "name": "13,3mn \$", "lat": 37.7949, "lng": -122.4294},
    {"id": 6, "name": "6,95mn \$", "lat": 37.7449, "lng": -122.4494},
  ];
  String _darkMapStyle = "";

  // bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _loadMapStyles();
    googlePlace = GooglePlace("AIzaSyD6t33UKg70jLJUVik6qjmruNSpElfYhkU");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _generateMarkerIcon().then((_) {
        _setMarkers();
      });
    });
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _alignmentAnimation = AlignmentTween(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    ));
    _alignmentAnimation2 = AlignmentTween(
      begin: Alignment.center,
      end: Alignment.center,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    _sizeAnimation = Tween<Size>(
      begin: const Size(1, 1),
      end: const Size(70, 40),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sizeAnimation2 = Tween<Size>(
      begin: const Size(1, 1),
      end: Size(deviceWidth(context) / 1.2, 48),
    ).animate(CurvedAnimation(
      parent: _controller2,
      curve: Curves.easeIn,
    ));
    _sizeAnimation3 = Tween<Size>(
      begin: const Size(1, 1),
      end: Size(48, 48),
    ).animate(CurvedAnimation(
      parent: _controller2,
      curve: Curves.ease,
    ));
    _sizeAnimation4 = Tween<Size>(
      begin: const Size(1, 1),
      end: Size(40.w, 40.h),
    ).animate(CurvedAnimation(
      parent: _controller2,
      curve: Curves.ease,
    ));
    _sizeAnimation5 = Tween<Size>(
      begin: const Size(1, 1),
      end: Size(160.w, 40.h),
    ).animate(CurvedAnimation(
      parent: _controller2,
      curve: Curves.ease,
    ));

    _controller2.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  Future _loadMapStyles() async {
    _darkMapStyle =
        await rootBundle.loadString('assets/json/dark_mode_style.json');
  }

  Future<void> _generateMarkerIcon() async {
    try {
      RenderRepaintBoundary boundary = _markerKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary;

      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ImageByteFormat.png);
      final Uint8List pngBytes = byteData!.buffer.asUint8List();

      setState(() {
        _customMarkerIcon = BitmapDescriptor.fromBytes(pngBytes);
      });
    } catch (e) {
      debugPrint("Error generating marker icon: $e");
    }
  }

  void _setMarkers() async {
    if (_customMarkerIcon == null) {
      debugPrint("Custom marker icon is not ready yet.");
      return;
    }
    for (var property in properties) {
      _markers.add(
        Marker(
          markerId: MarkerId(property['id'].toString()),
          position: LatLng(property['lat'], property['lng']),
          icon: _customMarkerIcon ?? BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
            title: property['name'],
            onTap: () => _showPropertyDetails(property),
          ),
        ),
      );
    }

    setState(() {});
  }

  void _showPropertyDetails(Map<String, dynamic> property) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(property['name']),
          content: const Text("More details about this property..."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  void _search(String query) async {
    final result = await googlePlace.autocomplete.get(query);
    if (result != null && result.predictions != null) {
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

  void _goToLocation(double lat, double lng) {
    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lng),
          zoom: 14,
        ),
      ),
    );
  }

  void optionsAnimation() {
    _controller3 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _alignmentAnimation3 = AlignmentTween(
      begin: Alignment.center,
      end: Alignment.center,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
    _sizeAnimation6 = Tween<Size>(
      begin: const Size(1, 1),
      end: Size(205.w, 240.h),
    ).animate(CurvedAnimation(
      parent: _controller3,
      curve: Curves.ease,
    ));
    _controller3.forward();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _generateMarkerIcon().then((_) {
        _setMarkers();
      });
    });
    return Scaffold(
      body: Stack(
        children: [
          // Google Map
          GoogleMap(
            padding: EdgeInsets.symmetric(vertical: 200.h),
            onMapCreated: (controller) {
              _mapController = controller;
              if (_darkMapStyle.isNotEmpty) {
                _mapController.setMapStyle(_darkMapStyle);
              }
            },
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 12,
            ),
            markers: _markers,
          ),

          // Animated Marker Widget (Invisible, off-screen)
          Positioned(
            top: -9999, // Keep it offscreen
            child: RepaintBoundary(
              key: _markerKey,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Align(
                      alignment: _alignmentAnimation.value,
                      child: Container(
                        width:
                            optionIndex != 1 ? 30 : _sizeAnimation.value.width,
                        height: _sizeAnimation.value.height,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              topRight: Radius.circular(10.r),
                              bottomRight: Radius.circular(10.r),
                            ),
                            shape: BoxShape.rectangle,
                            color: AppColors.orange),
                        child: optionIndex == 1
                            ? Center(
                                child: Styles.medium(properties[0]["name"],
                                    color: AppColors.white),
                              )
                            : const Icon(Icons.business_sharp,
                                color: AppColors.white),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // Search Bar
          Positioned(
            top: 70.h,
            left: 40.w,
            right: 40.w,
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: AnimatedBuilder(
                        animation: _controller2,
                        builder: (context, child) {
                          return Align(
                            alignment: _alignmentAnimation2.value,
                            child: Container(
                              width: _sizeAnimation2.value.width,
                              height: _sizeAnimation2.value.height,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(80.r),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: TextField(
                                onChanged: _search,
                                decoration: InputDecoration(
                                  hintText: "Search location",
                                  hintStyle:
                                      const TextStyle(color: AppColors.grey),
                                  // contentPadding: EdgeInsets.symmetric(
                                  //     vertical: 10.h, horizontal: 15.w),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  border: InputBorder.none,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: SvgPicture.asset(SvgAssets.search),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: AnimatedBuilder(
                      animation: _controller2,
                      builder: (context, child) {
                        return Align(
                          alignment: _alignmentAnimation2.value,
                          child: Container(
                            width: _sizeAnimation3.value.width,
                            height: _sizeAnimation3.value.height,
                            padding: EdgeInsets.all(10.r),
                            margin: EdgeInsets.only(left: 8.r),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(80.r),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: SvgPicture.asset(SvgAssets.filter),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),

          // Options
          Positioned(
            bottom: Platform.isAndroid ? 115.h : 150.h,
            left: 40.w,
            right: 40.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            optionsAnimation();
                            onTapOption = true;
                          });
                        },
                        child: AnimatedBuilder(
                            animation: _controller2,
                            builder: (context, child) {
                              return Align(
                                alignment: _alignmentAnimation2.value,
                                child: Container(
                                  width: _sizeAnimation4.value.width,
                                  height: _sizeAnimation4.value.height,
                                  padding: EdgeInsets.all(10.r),
                                  decoration: BoxDecoration(
                                    color: AppColors.white.withOpacity(.5),
                                    borderRadius: BorderRadius.circular(100.r),
                                    border: Border.all(
                                        color: AppColors.white, width: 0.5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: SvgPicture.asset(svg,
                                      color: AppColors.white),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
                HSpace(8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: AnimatedBuilder(
                          animation: _controller2,
                          builder: (context, child) {
                            return Align(
                              alignment: _alignmentAnimation2.value,
                              child: Container(
                                width: _sizeAnimation4.value.width,
                                height: _sizeAnimation4.value.height,
                                padding: EdgeInsets.all(10.r),
                                decoration: BoxDecoration(
                                  color: AppColors.white.withOpacity(.5),
                                  borderRadius: BorderRadius.circular(100.r),
                                  border: Border.all(
                                      color: AppColors.white, width: 0.5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: SvgPicture.asset(
                                  SvgAssets.send,
                                  color: AppColors.white,
                                ),
                              ),
                            );
                          }),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: AnimatedBuilder(
                          animation: _controller2,
                          builder: (context, child) {
                            return Align(
                              alignment: _alignmentAnimation2.value,
                              child: Container(
                                width: _sizeAnimation5.value.width,
                                height: _sizeAnimation5.value.height,
                                padding: EdgeInsets.all(10.r),
                                decoration: BoxDecoration(
                                  color: AppColors.white.withOpacity(.5),
                                  borderRadius: BorderRadius.circular(80.r),
                                  border: Border.all(
                                      color: AppColors.white, width: 0.5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(SvgAssets.list,
                                        color: AppColors.white),
                                    Styles.regular("List of variants",
                                        color: AppColors.white,
                                        fontSize: _sizeAnimation5.isAnimating
                                            ? 1
                                            : null)
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Options popup
          if (onTapOption)
            Positioned(
              bottom: Platform.isAndroid ? 115.h : 150.h,
              left: 40,
              // right: 180,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: AnimatedBuilder(
                    animation: _controller3,
                    builder: (context, child) {
                      return Align(
                        alignment: _alignmentAnimation3.value,
                        child: Container(
                          width: _sizeAnimation6.value.width,
                          height: _sizeAnimation6.value.height,
                          // width: 205,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: optionNames.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                minLeadingWidth: 3,
                                leading: SvgPicture.asset(
                                    SvgAssets.optionIcons[index],
                                    color: optionIndex == index
                                        ? AppColors.orange
                                        : AppColors.black2),
                                title: Styles.regular(optionNames[index],
                                    color: optionIndex == index
                                        ? AppColors.orange
                                        : AppColors.black2),
                                onTap: () {
                                  setState(() {
                                    onTapOption = false;
                                    svg = SvgAssets.optionIcons[index];
                                    optionIndex = index;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      );
                    }),
              ),
            ),

          // Search Results
          if (predictions.isNotEmpty)
            Positioned(
              top: 125,
              left: 40,
              right: 50,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: predictions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(predictions[index].description!),
                      onTap: () {
                        final placeId = predictions[index].placeId!;
                        googlePlace.details.get(placeId).then((details) {
                          if (details != null &&
                              details.result != null &&
                              details.result!.geometry != null) {
                            final location =
                                details.result!.geometry!.location!;
                            _goToLocation(location.lat!, location.lng!);
                            setState(() {
                              predictions.clear();
                            });
                          }
                        });
                      },
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
