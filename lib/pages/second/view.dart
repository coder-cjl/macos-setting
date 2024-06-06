import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'logic.dart';

class SecondPage extends StatefulWidget {
  SecondPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SecondPage();
  }
}

class _SecondPage extends State<SecondPage> {
  final logic = SecondLogic();

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      toolBar: const ToolBar(
        title: Text("Second"),
      ),
      children: [
        ContentArea(
          builder: (BuildContext context, ScrollController scrollController) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PushButton(
                  controlSize: ControlSize.regular,
                  onPressed: () {
                    Navigator.of(context).maybePop();
                  },
                  child: const Text("Last Page"),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
