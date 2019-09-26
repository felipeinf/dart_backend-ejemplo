import 'api_tareas.dart';

class RouterApi extends ApplicationChannel {
  @override
  Controller get entryPoint {
    final router = Router();

    router
      .route("/ejemplo")
      .linkFunction((Request request) => Response.ok("Hola Mundo"));

    return router;
  }
}
