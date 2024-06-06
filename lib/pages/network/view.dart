import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:provider/provider.dart';
import 'package:setting/pages/second/view.dart';
import 'package:setting/pages/themes/theme.dart';
import 'package:setting/plugins/log.dart';
import 'logic.dart';

class NetworkPage extends StatelessWidget {
  final logic = NetworkLogic();

  NetworkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      toolBar: ToolBar(),
      children: [
        ContentArea(
          builder: (BuildContext context, ScrollController scrollController) {
            return _page1(context);
          },
        ),
      ],
    );
  }

  Widget _page1(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Text("System Theme"),
              const SizedBox(width: 8),
              MacosRadioButton<ThemeMode>(
                value: ThemeMode.system,
                groupValue: context.watch<AppTheme>().mode,
                onChanged: (value) {
                  context.read<AppTheme>().mode = value!;
                },
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Text("Light Theme"),
              const SizedBox(
                width: 24,
              ),
              MacosRadioButton<ThemeMode>(
                value: ThemeMode.light,
                groupValue: context.watch<AppTheme>().mode,
                onChanged: (value) {
                  context.read<AppTheme>().mode = value!;
                },
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Text("Dark Theme"),
              const SizedBox(
                width: 26,
              ),
              MacosRadioButton<ThemeMode>(
                value: ThemeMode.dark,
                groupValue: context.watch<AppTheme>().mode,
                onChanged: (value) {
                  context.read<AppTheme>().mode = value!;
                },
              ),
            ],
          ),
          PushButton(
            controlSize: ControlSize.regular,
            onPressed: () {
              // logic.state.currentIndex.value = 1;
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) {
                  return SecondPage();
                }),
              );
            },
            child: const Text("Next Page"),
          ),
          HelpButton(
            onPressed: () {
              appDebugPrint("help");
            },
          ),
          const SizedBox(
            width: 300,
            child: MacosSearchField(
              placeholder: "Search for a country",
              results: [
                SearchResultItem("a"),
                SearchResultItem("b"),
              ],
            ),
          ),
          const MacosTooltip(
            message: "Hello",
            child: Text("你好"),
          ),
          const ProgressCircle(
            value: 70,
          ),
          const ProgressBar(
            value: 30,
          ),
          MacosDatePicker(
            onDateChanged: (date) => debugPrint('$date'),
          ),
          MacosTimePicker(
            onTimeChanged: (time) => debugPrint('$time'),
          ),
          Obx(
            () => CapacityIndicator(
              value: logic.state.indicatorValue.value,
              onChanged: (value) {
                logic.state.indicatorValue.value = value;
              },
            ),
          ),
          Obx(
            () => RatingIndicator(
              amount: 5,
              value: logic.state.ratingValue.value,
              onChanged: (value) {
                logic.state.ratingValue.value = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
