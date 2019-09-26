class Tarea {

  Tarea(String id, String idUsuario, String descripcion) {
    _id = id;
    _idUsuario = idUsuario; 
    _descripcion = descripcion;
    _creado = DateTime.now();
    _modificado = DateTime.now();
  }

  String _id;
  String _idUsuario;
  String _descripcion;
  DateTime _creado;
  DateTime _modificado;

  Map<String, dynamic> toJson() => {
    '_id': _id,
    'idUsuario': idUsuario,
    'descripcion': _descripcion,
    'creado': _creado.toIso8601String(),
    'modificado': _modificado.toIso8601String()
  };

  String get id => _id;
  String get idUsuario => _idUsuario;

  set descripcion(String descripcion) {
    _descripcion = descripcion;
  }

  set modificado(DateTime fechaHoraActual) {
    _modificado = fechaHoraActual;
  }
}