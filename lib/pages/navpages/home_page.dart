import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          // right: 20,
          left: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 70,
                // left: 20,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.black54,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            AppLargeText(text: "Discover"),
            const SizedBox(
              height: 40,
            ),
            Container(
              child: TabBar(
                labelPadding: EdgeInsets.only(left: 0, right: 40),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator:
                    CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                tabs: [
                  Tab(
                    text: "Places",
                  ),
                  Tab(
                    text: "Inspiration",
                  ),
                  Tab(
                    text: "Emotions",
                  ),
                ],
              ),
            ),
            Container(
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Text("1st View"),
                  Text("2nd View"),
                  Text("3rd View"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return CirclePainter(color: color, radius: radius);
  }
}

class CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  CirclePainter({required this.color, required this.radius});
  @override
  void paint(
    Canvas canvas,
    Offset offset,
    ImageConfiguration configuration,
  ) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;

    final Offset circleOffset = Offset(
      configuration.size!.width / 2 - radius / 2,
      configuration.size!.height - radius,
    );

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
