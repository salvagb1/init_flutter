import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Páginas
import 'package:init_flutter/ui/pages/auth/complete_profile.dart';
import 'package:init_flutter/ui/pages/auth/create_account.dart';
import 'package:init_flutter/ui/pages/auth/login.dart';
import 'package:init_flutter/ui/pages/auth/welcome_home.dart';
import 'package:init_flutter/ui/pages/dashboard/home.dart';
import 'package:init_flutter/ui/pages/dashboard/navigatorbtn/activity_btn.dart';
import 'package:init_flutter/ui/pages/dashboard/navigatorbtn/home_btn.dart';
import 'package:init_flutter/ui/pages/dashboard/navigatorbtn/profile_btn.dart';
import 'package:init_flutter/ui/pages/dashboard/notification/notification.dart';
import 'package:init_flutter/ui/pages/welcome/stared_four.dart';
import 'package:init_flutter/ui/pages/welcome/stared_one.dart';
import 'package:init_flutter/ui/pages/welcome/stared_three.dart';
import 'package:init_flutter/ui/pages/welcome/stared_two.dart';

// Provider
import 'package:init_flutter/shared/providers/auth_provider.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final isLoggedIn = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(path: '/home', builder: (context, state) => const HomePage()),
      GoRoute(path: '/createAccount', builder: (context, state) => const CreateAccount()),
      GoRoute(path: '/completeProfile', builder: (context, state) => const CompleteProfile()),
      GoRoute(path: '/activityBtn', builder: (context, state) => const ActivityBtn()),
      GoRoute(path: '/homeBtn', builder: (context, state) => const HomeBtn()),
      GoRoute(path: '/profileBtn', builder: (context, state) => const ProfileBtn()),
      GoRoute(path: '/notificationFitness', builder: (context, state) => const NotificationFitness()),
      GoRoute(path: '/welcomeHome', builder: (context, state) => const WelcomeHome()),
      GoRoute(path: '/staredOne', builder: (context, state) => const StaredOne()),
      GoRoute(path: '/staredTwo', builder: (context, state) => const StaredTwo()),
      GoRoute(path: '/staredThree', builder: (context, state) => const StaredThree()),
      GoRoute(path: '/staredFour', builder: (context, state) => const StaredFour()),
    ],
    redirect: (context, state) {
      final goingToLogin = state.matchedLocation == '/login';

      return isLoggedIn.when(
        data: (user) {
          final loggedIn = user != null;

          if (!loggedIn && !goingToLogin) return '/login';
          if (loggedIn && goingToLogin) return '/home';
          return null;
        },
        loading: () => null, // No redirige mientras carga
        error: (_, __) => '/login', // Redirige si hay error
      );
    },
    debugLogDiagnostics: true,
  );
});
