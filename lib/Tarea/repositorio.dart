import 'package:api_tareas/Tarea/modelo.dart';
 
final List<Tarea> _tareas = [
  Tarea("3f7f70c8-2372-48a7-8d90-e1f439f56cc7", "1", "Regar las plantas")
];

class RepositorioTarea {
  Tarea agregarTarea(Tarea tarea) {
    _tareas.add(tarea);
    return tarea;
  }

  List<Tarea> obtenerTareas(String idUsuario) {
    if(idUsuario == null) {
      return _tareas;
    }

    return _tareas
      .where((tarea) => tarea.idUsuario == idUsuario)
      .toList();
  }

  Tarea modificarTarea(String id, String descripcion) {
    final Tarea tareaBuscada = _tareas.firstWhere((tarea) => tarea.id == id);
    final int index = _tareas.indexOf(tareaBuscada);
    tareaBuscada.descripcion = descripcion;
    tareaBuscada.modificado = DateTime.now();
    _tareas.insert(index, tareaBuscada);
    return tareaBuscada;
  }

  Tarea eliminarTarea(String id) {
    final Tarea tareaBuscada = _tareas.firstWhere((tarea) => tarea.id == id);
    final int index = _tareas.indexOf(tareaBuscada);
    _tareas.removeAt(index);
    return tareaBuscada;
  }
}