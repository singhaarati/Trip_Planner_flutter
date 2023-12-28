class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://10.0.2.2:3007/";
  //static const String baseUrl = "http://192.168.137.1:3007/";

  // ====================== Auth Routes ======================
  static const String login = "users/login";
  static const String register = "users/register";
  static const String getUserInfo = "users/userinfo";
  static const String updateUserById = "users/userinfo";
  static const String uploadImage = "/upload/";
  static const String imageUrl = "http://10.0.2.2:3007/uploads/";
  //static const String imageUrl = "http://192.168.137.1:3007/uploads/";

  //-------------- Destination Routes ------------------
  static const String getAllDestination = "/destination/";
  static const String getDestinationById = "/destination/";
  static const String createDestination = "/destination/";
  static const String deleteDestinationById = "/destination/";

  //---------Booking Routes--------------
  static const String createBookingDestinationById = "/bookings/";
  static const String getAllBookings = "/bookings/all";
}
