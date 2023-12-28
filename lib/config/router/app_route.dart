import '../../features/booking/presentation/view/create_booking.dart';
import '../../features/destination/presentation/view/destination_detail.dart';
import '../../features/home/presentation/view/navigation_bar_view.dart';
import '../../features/splash/presentation/view/splash_view.dart';
import '../../features/user/presentation/view/login_view.dart';
import '../../features/user/presentation/view/signup_view.dart';

class AppRoute {
  AppRoute._();

  static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static const String destinationUserRoute = '/destinationUser';
  static const String bookingRoute = '/booking';
//

  static getApplicationRoute() {
    return {
      splashRoute: (context) => const SplashPage(),
      loginRoute: (context) => const LoginView(),
      homeRoute: (context) => const NavigatorBarView(),
      signupRoute: (context) => const SignUpView(),
      destinationUserRoute: (context) => const DestinationUserView(),
      bookingRoute: (context) => const BookingView(),
      //
    };
  }
}
