import 'package:app/feature/poke_detail/presentation/view/poke_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app/feature/poke_list/presentation/view/poke_list_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

// required List<NavigatorObserver> observers,
GoRouter getRouter() {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    // observers: observers,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const PokeListScreen();
        },
      ),
      GoRoute(
        path: '/detail',
        builder: (context, state) {
          return const PokeDetailScreen();
        },
      ),
    ],
  );
}
