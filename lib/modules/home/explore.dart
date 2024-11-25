import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meteorrockhome/modules/home/grid_caption.dart';
import 'package:meteorrockhome/shared/utils/all_packages.dart';
import 'package:meteorrockhome/shared/utils/assets.dart';
import 'package:meteorrockhome/shared/utils/colors.dart';

class Explore extends StatefulWidget {
  const Explore({super.key, this.controller, this.sizeAnimation});
  final controller;
  final sizeAnimation;

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: AnimatedBuilder(
          animation: widget.controller,
          builder: (context, child) {
            return SlideTransition(
                position: widget.sizeAnimation,
                child: SizedBox(
                  child: StaggeredGridView.countBuilder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) => Container(
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20.r),
                          border:
                              Border.all(color: AppColors.white, width: 8.w)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Stack(
                          children: [
                            Image.asset(
                              ImageAssets.gridPictures[index],
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                                bottom: 10.h,
                                left: 15.w,
                                // right: 20.w,
                                child: const GridCaption(
                                    // context: context,
                                    title: "Gladkova St., 25"))
                          ],
                        ),
                      ),
                    ),
                    staggeredTileBuilder: (int index) =>
                        // StaggeredTile.count(2, index.isEven ? 2 : 1),
                        const StaggeredTile.fit(2),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
                ));
          }),
    );
  }
}
