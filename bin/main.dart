import 'package:api_tareas/api_tareas.dart';

Future main() async {
  final app = Application<RouterApi>()
    ..options.port = 8888;

  final count = Platform.numberOfProcessors ~/ 2;
  await app.start(numberOfInstances: count > 0 ? count : 1);
}
