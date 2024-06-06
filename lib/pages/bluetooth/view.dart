import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:setting/plugins/log.dart';
import 'logic.dart';

class BluetoothPage extends StatelessWidget {
  final logic = BluetoothLogic();

  BluetoothPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      toolBar: ToolBar(
        title: const Text("蓝牙"),
        actions: [
          ToolBarIconButton(
              label: "设置",
              icon: const MacosIcon(
                CupertinoIcons.settings,
              ),
              showLabel: false,
              onPressed: () {
                appDebugPrint("setting");
              }),
          const ToolBarIconButton(
            label: "设置",
            icon: MacosIcon(
              CupertinoIcons.search,
            ),
            showLabel: false,
            tooltipMessage: "设置",
          ),
          ToolBarPullDownButton(
            label: "Action",
            icon: CupertinoIcons.ellipsis_circle,
            items: [
              MacosPulldownMenuItem(
                label: 'New Folder',
                title: const Text('New Folder'),
                onTap: () => debugPrint('Creating new folder...'),
              ),
              MacosPulldownMenuItem(
                label: 'Open',
                title: const Text('Open'),
                onTap: () => debugPrint('Opening...'),
              ),
              MacosPulldownMenuItem(
                label: 'Open with...',
                title: const Text('Open with...'),
                onTap: () => debugPrint('Opening with...'),
              ),
              MacosPulldownMenuItem(
                label: 'Import from iPhone...',
                title: const Text('Import from iPhone...'),
                onTap: () => debugPrint('Importing...'),
              ),
              const MacosPulldownMenuDivider(),
              MacosPulldownMenuItem(
                label: 'Remove',
                enabled: false,
                title: const Text('Remove'),
                onTap: () => debugPrint('Deleting...'),
              ),
              MacosPulldownMenuItem(
                label: 'Move to Bin',
                title: const Text('Move to Bin'),
                onTap: () => debugPrint('Moving to Bin...'),
              ),
              const MacosPulldownMenuDivider(),
              MacosPulldownMenuItem(
                label: 'Tags...',
                title: const Text('Tags...'),
                onTap: () => debugPrint('Tags...'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
