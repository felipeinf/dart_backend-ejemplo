class Usuario {

  Usuario(String id, String nombre) {
    _id = id;
    _nombre = nombre;
  }

  String _id;
  String _nombre;
  DateTime _creado;
  DateTime _modificado;

  Map<String, dynamic> toJson() => {
    '_id': _id,
    'nombre': _nombre,
    'creado': _creado.toIso8601String(),
    'modificado': _modificado.toIso8601String()
  };

  String get id => _id;

  set nombre(String nombre) {
    _nombre = nombre;
  }

  set modificado(DateTime fechaHora) {
    _modificado = fechaHora;
  }
}
