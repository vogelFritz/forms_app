import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Usuario')),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const FlutterLogo(size: 500),
              TextFormField(),
              TextFormField(),
              TextFormField(),
              TextFormField(),
              FilledButton.tonalIcon(
                  onPressed: () {},
                  label: const Text('Crear usuario'),
                  icon: const Icon(Icons.save)),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
