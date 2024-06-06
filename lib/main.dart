import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:provider/provider.dart';
import 'package:setting/pages/home/view.dart';
import 'package:setting/pages/themes/theme.dart';
import 'package:window_manager/window_manager.dart';

Future<void> configureMacosWindowUtils() async {
  const config = MacosWindowUtilsConfig(
    toolbarStyle: NSWindowToolbarStyle.unified,
  );
  await config.apply();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureMacosWindowUtils();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(800, 600),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const AppPage());
}

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppTheme(),
      builder: (context, _) {
        final appTheme = context.watch<AppTheme>();
        return PlatformMenuBar(
          menus: const [
            PlatformMenu(
              label: 'View',
              menus: [
                PlatformProvidedMenuItem(
                  type: PlatformProvidedMenuItemType.toggleFullScreen,
                ),
              ],
            ),
            PlatformMenu(
              label: 'Window',
              menus: [
                PlatformProvidedMenuItem(
                  type: PlatformProvidedMenuItemType.minimizeWindow,
                ),
                PlatformProvidedMenuItem(
                  type: PlatformProvidedMenuItemType.zoomWindow,
                ),
              ],
            ),
          ],
          child: MacosApp(
            title: "Macos Setting",
            themeMode: appTheme.mode,
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          ),
        );
      },
    );
  }
}
