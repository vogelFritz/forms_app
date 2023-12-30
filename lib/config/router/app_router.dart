import 'package:forms_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
  GoRoute(
      path: '/cubits', builder: (context, state) => const CubitCounterScreen()),
  GoRoute(
      path: '/bloc-counter',
      builder: (context, state) => const BlocCounterScreen()),
  GoRoute(
      path: '/new-user', builder: (context, state) => const RegisterScreen())
]);
