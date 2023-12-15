import 'package:flutter/material.dart';
import 'package:state_management/feature/travel/view/travel_view.dart';
import 'package:state_management/feature/travel/view/travel_view_with_viewmodel.dart';

class TravelTabView extends StatelessWidget {
  const TravelTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: TravelPages.values.length,
        child: const Scaffold(
          bottomNavigationBar: BottomAppBar(
            child: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home_filled)),
                Tab(icon: Icon(Icons.bookmark)),
                Tab(icon: Icon(Icons.notifications)),
                Tab(icon: Icon(Icons.person)),
              ],
            ),
          ),
          body: TabBarView(children: [
            TravelView(),
            SizedBox.shrink(),
            SizedBox.shrink(),
            TravelViewWithViewModel(),
          ]),
        ));
  }
}

enum TravelPages {
  home,
  bookmark,
  notification,
  profile,
}
