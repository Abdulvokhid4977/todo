import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/presentation/bloc/main/main_bloc.dart';
import 'package:todo_app/presentation/pages/add_event_page/add_event_page.dart';
import 'package:todo_app/presentation/pages/details_page/details_page.dart';
import 'package:todo_app/presentation/pages/error/error_page.dart';
import 'package:todo_app/presentation/pages/main_page/main_page.dart';

part 'name_routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
GlobalKey<ScaffoldMessengerState>();

// final localSource = sl<LocalSource>();


sealed class AppRoutes {
  AppRoutes._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('route : ${settings.name}');
    }
    switch (settings.name) {

      case Routes.main:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => MainBloc(),
            child: const MainPage(),
          ),
        );
            case Routes.details:
              return MaterialPageRoute(builder: (_) => const DetailsPage());
            case Routes.add:
              return MaterialPageRoute(builder: (_) => const AddEventPage());
    // case Routes.initial:
    //   return MaterialPageRoute(
    //     builder: (_) =>
    //         BlocProvider(
    //           create: (_) => SplashBloc(),
    //           child: const SplashPage(),
    //         ),
    //   );
    //   case Routes.selectLang:
    //     return MaterialPageRoute(builder: (_) => const SelectLang());
    //   case Routes.shopping:
    //     return MaterialPageRoute(builder: (_) => const ShoppingCartPage());
    //   case Routes.orders:
    //     return MaterialPageRoute(builder: (_) => const OrdersPage());
    //   case Routes.profile:
    //     return MaterialPageRoute(builder: (_) => const ProfilePage());
    //   case Routes.details:
    //     return MaterialPageRoute(builder: (_) => const ProductDetailsPage());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }

  static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('Navigate to: $settings');
    }
    return MaterialPageRoute(
      builder: (_) => ErrorPage(
        settings: settings,
      ),
    );
  }
}