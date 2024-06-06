import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macos_ui/macos_ui.dart';
import 'logic.dart';

class WifiPage extends StatefulWidget {
  const WifiPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WifiPage();
  }
}

class _WifiPage extends State<WifiPage> {
  final logic = WifiLogic();

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
    return MacosScaffold(
      toolBar: const ToolBar(
        title: Text("Wi-Fi"),
      ),
      backgroundColor: const Color.fromARGB(1, 235, 237, 238),
      children: [
        ContentArea(builder: (context, controller) {
          return SingleChildScrollView(
            controller: controller,
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  color: const Color.fromARGB(1, 231, 233, 234),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Wi-Fi"),
                            ],
                          ),
                          Obx(
                            () => MacosSwitch(
                              value: logic.state.networkSwitch.value,
                              onChanged: (value) {
                                logic.state.networkSwitch.value = value;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        height: 1,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Lei的Wifi"),
                              Row(
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                    color: Colors.red,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  const Text("已连接"),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                    color: Colors.red,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  const Text("低安全性"),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: 12,
                                height: 12,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              MacosPulldownButton(
                                // disabledTitle: "",
                                // title: "aa",
                                icon: CupertinoIcons.settings,
                                items: [
                                  const MacosPulldownMenuItem(
                                    title: Text("自动加入"),
                                  ),
                                  const MacosPulldownMenuDivider(),
                                  const MacosPulldownMenuItem(
                                    title: Text("拷贝密码"),
                                  ),
                                  MacosPulldownMenuItem(
                                    title: const Text("设置网络..."),
                                    onTap: () => alertIpSetting(context),
                                  ),
                                  const MacosPulldownMenuDivider(),
                                  MacosPulldownMenuItem(
                                    title: const Text("忽略此网络..."),
                                    onTap: () => bottomIpSetting(context),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  void alertIpSetting(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 250), () {
      showMacosAlertDialog(
          context: context,
          barrierDismissible: true,
          builder: (_) {
            return UnconstrainedBox(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
                child: const Text("title"),
              ),
            );
          });
    });
  }

  void bottomIpSetting(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 250), () {
      showMacosSheet(
          context: context,
          barrierDismissible: true,
          builder: (_) {
            return MacosSheet(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
                child: const Text("title"),
              ),
            );
          });
    });
  }
}
