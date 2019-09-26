import 'package:api_tareas/Tarea/controlador_de_red.dart';

import 'api_tareas.dart';

class RouterApi extends ApplicationChannel {
  @override
  Controller get entryPoint {
    final router = Router();

    router
      .route("/tarea[/:id]")
      .link(() => ControladorDeRedTarea());

    return router;
  }
}
