import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:monkeytypemobile/features/splash/presentation/pages/splash_page.dart';

part "name_routes.dart";

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: Routes.splashScreen,

  routes: <RouteBase>[
    GoRoute(
      path: Routes.splashScreen,
      name: Routes.splashScreen,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, _) => const SplashPage(),
    ),

    // StatefulShellRoute.indexedStack(
    //   parentNavigatorKey: rootNavigatorKey,
    //   builder: (_, GoRouterState state, StatefulNavigationShell navigationShell) {
    //     return BlocProvider(
    //       create: (context) => MainBloc(),
    //       child: MainScreen(
    //         key: state.pageKey,
    //         navigationShell: navigationShell,
    //       ),
    //     );
    //   },
    //   branches: <StatefulShellBranch>[
    //     StatefulShellBranch(
    //       initialLocation: Routes.home,
    //       routes: <RouteBase>[
    //         GoRoute(
    //           path: Routes.home,
    //           name: Routes.home,
    //           builder: (_, __) => BlocProvider(
    //             create: (context) => sl<HomeBloc>(),
    //             child: HomeScreen(),
    //           ),
    //           routes: [
    //             GoRoute(
    //               path: Routes.profileCreator,
    //               name: Routes.profileCreator,
    //               parentNavigatorKey: rootNavigatorKey,
    //               builder: (_, state) {
    //                 final data = state.extra as Map<String, dynamic>?;
    //                 final id = data?['user_id'] ?? state.uri.queryParameters['user_id'];
    //                 final fundraising = state.uri.queryParameters.containsKey("fundraising");

    //                 return BlocProvider(
    //                   create: (context) => sl<ProfileCreatorBloc>(),
    //                   child: ProfileCreatorScreen(
    //                     userId: id is int ? id : int.parse(id),
    //                     fundraising: fundraising,
    //                   ),
    //                 );
    //               },
    //             ),
    //             GoRoute(
    //               path: Routes.postSingle,
    //               name: Routes.postSingle,
    //               parentNavigatorKey: rootNavigatorKey,
    //               builder: (_, state) {
    //                 if (state.uri.queryParameters.containsKey("deep_link")) {
    //                   final id = state.uri.queryParameters['post_id'];
    //                   return BlocProvider(
    //                     create: (context) => sl<SingleBloc>(),
    //                     child: PostSinglePage(postId: int.tryParse(id ?? "")),
    //                   );
    //                 }

    //                 final data = state.extra;

    //                 if (data is ContentItem) {
    //                   return BlocProvider(
    //                     create: (context) => sl<SingleBloc>(),
    //                     child: PostSinglePage(
    //                       contentItem: data,
    //                       initialMediaPage: 0,
    //                     ),
    //                   );
    //                 } else if (data is Map<String, dynamic>) {
    //                   return BlocProvider(
    //                     create: (context) => sl<SingleBloc>(),
    //                     child: PostSinglePage(
    //                       contentItem: data['contentItem'] as ContentItem,
    //                       initialMediaPage: data['initialMediaPage'] as int? ?? 0,
    //                     ),
    //                   );
    //                 } else {
    //                   throw Exception('Invalid data type for postSingle route');
    //                 }
    //               },
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //     StatefulShellBranch(
    //       initialLocation: Routes.chats,
    //       routes: <RouteBase>[
    //         GoRoute(
    //           path: Routes.chats,
    //           name: Routes.chats,
    //           builder: (_, __) => BlocProvider(
    //             create: (context) => sl<ChatsBloc>(),
    //             child: ChatsScreen(),
    //           ),
    //         ),
    //       ],
    //     ),
    //     StatefulShellBranch(
    //       initialLocation: Routes.inbox,
    //       routes: <RouteBase>[
    //         GoRoute(
    //           path: Routes.inbox,
    //           name: Routes.inbox,
    //           builder: (_, __) => BlocProvider(
    //             create: (context) => sl<InboxBloc>(),
    //             child: InboxPage(),
    //           ),
    //         ),
    //       ],
    //     ),
    //     StatefulShellBranch(
    //       initialLocation: Routes.profile,
    //       routes: <RouteBase>[
    //         GoRoute(
    //           path: Routes.profile,
    //           name: Routes.profile,
    //           builder: (_, state) => (state.extra as bool? ?? localSource.isCreator)
    //               ? BlocProvider(
    //                   create: (context) => sl<CreatorInfoBloc>(),
    //                   child: CreatorPage(),
    //                 )
    //               : ProfilePage(),
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
  ],
);
