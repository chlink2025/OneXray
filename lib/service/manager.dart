import 'package:flutter/cupertino.dart';
import 'package:onexray/core/network/client.dart';
import 'package:onexray/service/background_task/service.dart';
import 'package:onexray/service/menu/short_cut/service.dart';
import 'package:onexray/service/menu/tray/service.dart';
import 'package:onexray/service/menu/window/service.dart';
import 'package:onexray/service/notification/service.dart';
import 'package:onexray/service/share/service.dart';
import 'package:onexray/service/toast/service.dart';
import 'package:onexray/service/vpn/service.dart';

abstract final class ServiceManager {
  static Future<void> serviceInit(BuildContext context) async {
    await NetClient().asyncInit();
    TrayService().init();
    await VpnService().asyncInit();
    ShareService().init();
    await NotificationService().asyncInit();
    if (context.mounted) {
      await ShortCutService().asyncInit(context);
    }
    await WindowService().asyncInit();
    await BackgroundTaskService().asyncInit();
    ToastService().init();
  }

  static void serviceDispose() {
    TrayService().dispose();
    VpnService().dispose();
    ShareService().dispose();
    NotificationService().dispose();
    ShortCutService().dispose();
    WindowService().dispose();
    BackgroundTaskService().dispose();
    ToastService().dispose();
  }
}
