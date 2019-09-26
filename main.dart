import 'package:api_tareas/api_tareas.dart';

Future main() async {
  const puerto = 8888;
  final app = Application<RouterApi>()
    ..options.port = puerto;

  final count = Platform.numberOfProcessors ~/ 2;
  await app.start(numberOfInstances: count > 0 ? count : 1);
}
