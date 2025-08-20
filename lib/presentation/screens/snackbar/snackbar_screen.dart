import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'ok', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Ut anim labore fugiat laboris est anim esse quis elit quis officia duis minim duis. Cillum esse enim sit cillum tempor culpa. Duis commodo cupidatat incididunt Lorem amet. Laboris ipsum ullamco voluptate sit elit veniam esse commodo nulla officia irure nulla ullamco tempor. Do adipisicing cillum sit ea tempor laboris voluptate. Dolor ex enim magna laborum quis anim.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbar y dialogos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text(
                      'Occaecat mollit qui deserunt eu et Lorem sit non enim ex aute. Aute nisi do consectetur dolor elit ut qui commodo voluptate aute. Proident ea fugiat consequat magna duis aute magna est occaecat nostrud.',
                    ),
                  ],
                );
              },
              child: const Text('Licencias usadas'),
            ),

            FilledButton.tonal(
              onPressed: () =>
                openDialog(context),
              child: const Text('Mostrar dialogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),

        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
