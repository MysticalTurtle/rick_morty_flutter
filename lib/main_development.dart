import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rickandmorty/app/app.dart';
import 'package:rickandmorty/bootstrap.dart';
import 'package:rickandmorty/core/core.dart';
import 'package:rickandmorty/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dio = await DioInstance().getDioInstance(
    secureStorage: const FlutterSecureStorage(),
  );
  await di.init(dio: dio);
  await bootstrap(() => const App());
}
