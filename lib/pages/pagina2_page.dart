import 'package:estados_app/Models/usuarios.dart';
import 'package:estados_app/services/usuarios_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuariosService>(context);
    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
            ? Text(usuarioService.usuario.nombre)
            : Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            child: Text('establecer usuario',
                style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {
              final usuarioService =
                  Provider.of<UsuariosService>(context, listen: false);
              final newUser = new Usuario(
                  nombre: 'felipe',
                  edad: 24,
                  profesiones: [
                    'fullstack developer',
                    'video jugador experto'
                  ]);
              usuarioService.usuario = newUser;
            },
          ),
          MaterialButton(
            child: Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {
              final usuarioService =
                  Provider.of<UsuariosService>(context, listen: false);
              usuarioService.cambiarEdad(12);
            },
          ),
          MaterialButton(
            child:
                Text('añadir profesion', style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {
              usuarioService.agregarProfesion();
            },
          )
        ],
      )),
    );
  }
}
