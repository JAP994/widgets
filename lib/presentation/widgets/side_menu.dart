import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/providers/drawer_state.dart';

class SideMenu extends ConsumerWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    final drawerState = ref.watch(drawerStateProvider);

    return NavigationDrawer(
      selectedIndex: drawerState,
      onDestinationSelected: (value) {
        ref.read(drawerStateProvider.notifier).setSelectedIndex(value);
        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: Text('Main'),
        ),
        ...appMenuItems.sublist(0, 3).map(
          (item) => NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.title),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Text('More options'),
        ),
        ...appMenuItems.sublist(3).map(
          (item) => NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.title),
          ),
        ),
      ],
    );
  }
}
