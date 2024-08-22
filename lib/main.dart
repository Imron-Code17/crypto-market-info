import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'lib.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: await getApplicationSupportDirectory());
    AppConfig.init(
      '',
      (await getApplicationSupportDirectory()).path,
      await PackageInfo.fromPlatform(),
      await DeviceInfoPlugin().deviceInfo,
    );
    setupInjection();
    await di.allReady();
    runApp(const App());
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}
