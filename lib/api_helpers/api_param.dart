class ApiParam {
  static const String apiKey = "api_key";
  static const String email = "email";
  static const String password = "password";
  static const String name = "name";
  static const String businessName = "business_name";
  static const String token = "token";
  static const String request = "request";
  static const String phone = "phone";
  static const String businessId = "business_id";
  static const String url = "url";
  static Map<String, String> get header => {
        // 'Content-Type': 'application/json',
        // 'Accept': 'application/json',
        // 'Authorization': 'Bearer ${StorageHelper().loginData.authtoken}',
      };
}

class Requests {
  static const String register = "register";
  static const String uploadProfilePicture = "register";
  static const String login = "login";
  static const String businessLogin = "business_login";
  static const String getCategories = "get_categories";
  static const String getBusiness = "get_business";
  static const String resetPassword = "reset_password";
  static const String registerBusiness = "business_register";
  static const String addSession = "add_session";
  static const String getSessions = "get_session";
  static const String getBusnessDetails = "get_business_details";
  static const String addLogo= "add_logo"; 
}
