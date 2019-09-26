import 'package:api_tareas/Tarea/modelo.dart';
import 'package:api_tareas/Tarea/repositorio.dart';
import 'package:api_tareas/api_tareas.dart';
import 'package:uuid/uuid.dart';

class ControladorDeRedTarea extends ResourceController {

  final RepositorioTarea repositorio = RepositorioTarea();
  final Uuid generadorId = Uuid();
  
  @Operation.get()
  Future<Response> obtenerTareas() async {
    final tareas = repositorio.obtenerTareas(null)
      .map((tarea) => tarea.toJson())
      .toList();

    return Response.ok(tareas);
  }

  @Operation.get('id')
  Future<Response> obtenerTareasUsuario() async {
    final idUsuario = request.path.variables['id'];
    final tareas = repositorio.obtenerTareas(idUsuario)
      .map((tarea) => tarea.toJson())
      .toList();

    return Response.ok(tareas);
  }

  @Operation.post('id')
  Future<Response> crearTarea() async {
    final Map<String, dynamic> body = await request.body.decode();
    final idUsuario = request.path.variables['id'];
    final id = generadorId.v4();
    final tarea = repositorio.agregarTarea( Tarea(id, idUsuario, body['descripcion'].toString()))
      .toJson();

    return Response.ok(tarea);
  }

  @Operation.put('id')
  Future<Response> modificarTarea() async {
    final Map<String, dynamic> body = await request.body.decode();
    final id = request.path.variables['id'];

    final tarea = repositorio.modificarTarea(id, body['descripcion'].toString());
    return Response.ok(tarea);
  }

  @Operation.delete('id')
  Future<Response> eliminarTarea() async {
    final id = request.path.variables['id'];
    final tarea = repositorio.eliminarTarea(id);
    return Response.ok(tarea);
  }
}
