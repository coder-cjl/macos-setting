import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'logic.dart';

class SliderPage extends StatefulWidget {
  Function(int)? onChanged;

  SliderPage({
    super.key,
    this.onChanged,
  });

  @override
  State<StatefulWidget> createState() {
    return _SliderPage();
  }
}

class _SliderPage extends State<SliderPage> {
  final logic = SliderLogic();

  @override
  void initState() {
    logic.onInit();
    super.initState();
    logic.onReady();
  }

  @override
  void dispose() {
    logic.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SidebarItems(
      items: logic.state.networks
          .map(
            (e) => SidebarItem(
              leading: Container(
                width: 20,
                height: 20,
                color: Colors.red,
              ),
              label: Text(e.name),
            ),
          )
          .toList(),
      currentIndex: logic.state.currentIndex,
      onChanged: (index) {
        logic.state.currentIndex = index;
        widget.onChanged?.call(index);
        setState(() {});
      },
    );
  }
}
