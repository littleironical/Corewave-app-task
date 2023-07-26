import 'package:corewave_app_task/presentation/main/main_view.dart';
import 'package:corewave_app_task/presentation/main/other_pages/booking_page.dart';
import 'package:corewave_app_task/presentation/main/other_pages/history_page.dart';
import 'package:corewave_app_task/presentation/main/other_pages/profile_page.dart';
import 'package:corewave_app_task/presentation/main/your_car_details/your_car_details.dart';
import 'package:corewave_app_task/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static const String homeRoute = '/home';
  static const String bookingRoute = '/booking';
  static const String historyRoute = '/history';
  static const String profileRoute = '/profile';
  static const String yourCarDetails = '/your-car-details';
}

class RouteGenerator {
  static Route<dynamic> route(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case RouteManager.homeRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case RouteManager.bookingRoute:
        return MaterialPageRoute(builder: (_) => const BookingPage());
      case RouteManager.historyRoute:
        return MaterialPageRoute(builder: (_) => const HistoryPage());
      case RouteManager.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case RouteManager.yourCarDetails:
        return MaterialPageRoute(builder: (_) => const YourCarDetails());      
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text(StringManager.pageNotFound),
        ),
      ),
    );
  }
}
