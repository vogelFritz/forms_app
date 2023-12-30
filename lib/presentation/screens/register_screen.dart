import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Usuario')),
      body: BlocProvider(
          create: (context) => RegisterCubit(), child: const _RegisterView()),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(size: 100),
              _RegisterForm(),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    return Form(
      key: _formKey,
      child: Column(children: [
        CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged: (value) {
              registerCubit.usernameChanged(value);
              _formKey.currentState?.validate();
            },
            validator: (value) {
              return (value == null || value.isEmpty || value.trim().isEmpty)
                  ? 'Campo requerido'
                  : (value.length < 6)
                      ? 'Debe tener al menos 6 letras'
                      : null;
            }),
        const SizedBox(height: 10),
        CustomTextFormField(
            label: 'Correo electrónico',
            onChanged: (value) {
              registerCubit.emailChanged(value);
              _formKey.currentState?.validate();
            },
            validator: (value) {
              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );
              return (value == null || value.isEmpty || value.trim().isEmpty)
                  ? 'Campo requerido'
                  : (value.length < 6)
                      ? 'Debe tener al menos 6 letras'
                      : (!emailRegExp.hasMatch(value))
                          ? 'No tiene formato de correo'
                          : null;
            }),
        const SizedBox(height: 10),
        CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChanged: (value) {
              registerCubit.passwordChanged(value);
              _formKey.currentState?.validate();
            },
            validator: (value) {
              return (value == null || value.isEmpty || value.trim().isEmpty)
                  ? 'Campo requerido'
                  : (value.length < 6)
                      ? 'Debe tener al menos 6 letras'
                      : null;
            }),
        const SizedBox(height: 20),
        FilledButton.tonalIcon(
            onPressed: () {
              _formKey.currentState?.validate();
              registerCubit.onSubmit();
            },
            label: const Text('Crear usuario'),
            icon: const Icon(Icons.save)),
      ]),
    );
  }
}
