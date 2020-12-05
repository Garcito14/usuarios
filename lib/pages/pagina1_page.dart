import 'package:estados_app/Models/usuarios.dart';
import 'package:estados_app/services/usuarios_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuariosService>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              usuarioService.removerUsuario();
            },
          )
        ],
        title: Text('Pagina 1'),
      ),
      body: usuarioService.existeUsuario
          ? InformacionUsuario(usuarioService.usuario)
          : Center(child: Text('hola')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario(this.usuario);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text('nombre: ${this.usuario.nombre}'),
          ),
          ListTile(
            title: Text('edad ${this.usuario.edad}'),
          ),
          Divider(),
          Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...this
              .usuario
              .profesiones
              .map((e) => ListTile(
                    title: Text(e),
                  ))
              .toList()
          /*  ListTile(
            title: Text('Profesion 1'),
          ),
         */
        ],
      ),
    );
  }
}
