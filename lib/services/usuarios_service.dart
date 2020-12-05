import 'package:estados_app/Models/usuarios.dart';
import 'package:flutter/cupertino.dart';

class UsuariosService with ChangeNotifier {
  Usuario _usuario;

  Usuario get usuario => this._usuario;

  bool get existeUsuario => this.usuario != null ? true : false;

  set usuario(Usuario user) {
    this._usuario = user;
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    this._usuario.edad = edad;
    notifyListeners();
  }

  void removerUsuario() {
    this._usuario = null;
    notifyListeners();
  }

  void agregarProfesion() {
    this
        ._usuario
        .profesiones
        .add('profesion ${this._usuario.profesiones.length + 1}');
    notifyListeners();
  }
}
