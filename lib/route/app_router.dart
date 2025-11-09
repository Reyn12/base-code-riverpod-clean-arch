import 'package:go_router/go_router.dart';
import '../features/auth/presentation/pages/register_page.dart';

final appRouter = GoRouter(
  initialLocation: '/register',
  routes: [
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterPage(),
    ),
  ],
);

