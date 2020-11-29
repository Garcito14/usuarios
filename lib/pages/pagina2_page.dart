import 'package:estados_app/Models/usuarios.dart';
import 'package:estados_app/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData
                ? Text('nombre: ${snapshot.data.nombre}')
                : Text('pagina 2');
          },
        ),
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
              final usuario = new Usuario(nombre: 'felipe', edad: 24);
              usuarioService.cargarUsuario(usuario);
            },
          ),
          MaterialButton(
            child: Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {
              usuarioService.cambiarEdad(23);
            },
          ),
          MaterialButton(
            child:
                Text('añadir profesion', style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {},
          )
        ],
      )),
    );
  }
}
