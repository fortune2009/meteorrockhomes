import 'dart:ui';

import 'package:meteorrockhome/shared/utils/all_packages.dart';

import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meteorrockhome/shared/utils/colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

// class Profile extends StatefulWidget {
//   const Profile({super.key});
//
//   @override
//   State<Profile> createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   // with SingleTickerProviderStateMixin {
// //   late AnimationController _controller;
// //   late Animation<double> _rippleAnimation;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = AnimationController(
// //       vsync: this,
// //       duration: Duration(milliseconds: 800), // Duration of ripple animation
// //     );
// //
// //     _rippleAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
// //       CurvedAnimation(parent: _controller, curve: Curves.easeOut),
// //     );
// //   }
// //
// //   void _startRippleAnimation() {
// //     _controller.reset();
// //     _controller.forward();
// //   }
// //
// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Reverse Ripple Animation"),
// //       ),
// //       body: Center(
// //         child: GestureDetector(
// //           onTap: _startRippleAnimation,
// //           child: AnimatedBuilder(
// //             animation: _rippleAnimation,
// //             builder: (context, child) {
// //               return CustomPaint(
// //                 painter: RipplePainter(
// //                   progress: _rippleAnimation.value,
// //                   borderColor: Colors.white,
// //                 ),
// //                 child: Container(
// //                   height: 150,
// //                   width: 150,
// //                   alignment: Alignment.center,
// //                   decoration: const BoxDecoration(
// //                     color: Colors.grey,
// //                     shape: BoxShape.circle,
// //                   ),
// //                   child: const Text(
// //                     "Tap Me",
// //                     style: TextStyle(color: Colors.white, fontSize: 18),
// //                   ),
// //                 ),
// //               );
// //             },
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class RipplePainter extends CustomPainter {
// //   final double progress; // Progress of the animation (from 1 to 0)
// //   final Color borderColor; // Color of the ripple border
// //
// //   RipplePainter({required this.progress, required this.borderColor});
// //
// //   @override
// //   void paint(Canvas canvas, Size size) {
// //     final paint = Paint()
// //       ..color = borderColor.withOpacity(progress)
// //       ..style = PaintingStyle.stroke
// //       ..strokeWidth = 4.0; // Width of the ripple border
// //
// //     // Calculate the ripple radius based on the progress
// //     final radius = size.width / 2 * progress;
// //
// //     // Draw the ripple circle
// //     canvas.drawCircle(
// //       Offset(size.width / 2, size.height / 2),
// //       radius,
// //       paint,
// //     );
// //   }
// //
// //   @override
// //   bool shouldRepaint(covariant RipplePainter oldDelegate) {
// //     return oldDelegate.progress != progress;
// //   }
// // }
//
// // class AnimatedMarkerMap extends StatefulWidget {
// //   const AnimatedMarkerMap({super.key});
// //
// //   @override
// //   _AnimatedMarkerMapState createState() => _AnimatedMarkerMapState();
// // }
// //
// // class _AnimatedMarkerMapState extends State<AnimatedMarkerMap> {
//   final Set<Marker> _markers = {};
//   late GoogleMapController _controller;
//   GlobalKey _markerKey = GlobalKey(); // Key to capture the widget
//   BitmapDescriptor? _animatedMarkerIcon;
//   double _containerHeightSize = 30; // Initial size of the marker
//   double _containerWidthSize = 50; // Initial size of the marker
//   bool _isAnimating = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _generateMarkerIcon();
//   }
//
//   // Function to render a Flutter widget to a BitmapDescriptor
//   Future<void> _generateMarkerIcon() async {
//     RenderRepaintBoundary boundary =
//         _markerKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
//     final image = await boundary.toImage(pixelRatio: 3.0);
//     final byteData = await image.toByteData(format: ImageByteFormat.png);
//     final Uint8List pngBytes = byteData!.buffer.asUint8List();
//
//     setState(() {
//       _animatedMarkerIcon = BitmapDescriptor.fromBytes(pngBytes);
//     });
//   }
//
//   // Function to add the marker to the map
//   void _addMarker(LatLng position) async {
//     if (_animatedMarkerIcon != null) {
//       final marker = Marker(
//         markerId: MarkerId(position.toString()),
//         position: position,
//         icon: _animatedMarkerIcon!,
//       );
//
//       setState(() {
//         _markers.add(marker);
//       });
//     }
//   }
//
//   // Function to animate the marker
//   void _startMarkerAnimation() {
//     if (_isAnimating) return;
//
//     _isAnimating = true;
//     Timer.periodic(Duration(milliseconds: 50), (timer) {
//       setState(() {
//         // _containerHeightSize += 2;
//         _containerHeightSize = 30;
//         _containerWidthSize = 50;
//         if (_containerHeightSize > 100 && _containerWidthSize > 100) {
//           _containerHeightSize = 30;
//           _containerWidthSize = 50;
//           _isAnimating = false;
//           timer.cancel();
//         }
//       });
//
//       // Regenerate the icon after each size update
//       _generateMarkerIcon();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         GoogleMap(
//           initialCameraPosition: CameraPosition(
//             target: LatLng(37.7749, -122.4194), // Example: San Francisco
//             zoom: 12,
//           ),
//           markers: _markers,
//           onMapCreated: (controller) => _controller = controller,
//           onTap: (position) {
//             _addMarker(position);
//             _startMarkerAnimation();
//           },
//         ),
//         // The widget to be converted to a marker
//         Positioned(
//           top: -9999, // Keep it offscreen
//           child: RepaintBoundary(
//             key: _markerKey,
//             child: AnimatedContainer(
//               duration: Duration(milliseconds: 300),
//               width: _containerWidthSize,
//               height: _containerHeightSize,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10.r),
//                     topRight: Radius.circular(10.r),
//                     bottomRight: Radius.circular(10.r),
//                   ),
//                   shape: BoxShape.rectangle,
//                   color: AppColors.orange),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
