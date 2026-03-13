import 'package:flutter/material.dart';
import 'package:tv_program_manager/controllers/navigation_controller.dart';

class TvNavigationRail extends StatelessWidget {
  const TvNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return NavigationRail(
      backgroundColor: colorScheme.surfaceContainer,
      selectedIndex: NavigationController.to.currentIndex.value,
      onDestinationSelected: (index) =>
          NavigationController.to.changePage(index),
      groupAlignment: -0.85,
      labelType: NavigationRailLabelType.all,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home, color: Colors.white),
          label: Text("Home"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.tv_outlined),
          selectedIcon: Icon(Icons.tv, color: Colors.white),
          label: Text("TV Shows"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.analytics_outlined),
          selectedIcon: Icon(Icons.analytics, color: Colors.white),
          label: Text("Analytics"),
        ),
      ],
    );
  }
}
