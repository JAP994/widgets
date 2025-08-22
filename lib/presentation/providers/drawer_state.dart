import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerState extends Notifier<int> {
  @override
  int build() => 0;

  void setSelectedIndex(int index) {
    state = index;
  }
}

final drawerStateProvider = NotifierProvider<DrawerState, int>(DrawerState.new);
