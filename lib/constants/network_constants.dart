import 'package:karmalab_assignment/views/authentication/forgot/forgot_password.dart';

class NetworkConstants {
  // base url
  static const String baseURL = "https://baburhaatbd.com/";
  // endpoints for login and signup:
  static const String registerAPI = "api/auth/register";
  static const String loginAPI = "api/auth/login";
  static const String forgotPassWord = "api/auth/forgot-password";
  static const String verifyOtp = "api/auth/verify-otp";
  static const String resetPassApi = "api/auth/reset-password";
  static const String googleAuth = "/api/auth/google";
  static const String googleLoginSuccessRedirectTo= "/api/auth/google/callback";
  static const String logoutUser = "api/auth/logout";
  static const String updatePassword = "api/auth/update-password";
  static const String forgotPassword = "api/auth/forgot-password";
  static const String resetPassword = "api/auth/reset-password";


  // Users
  static const String getAllUsers = "api/users";
  static String getUserById(String userId) => "api/users/$userId";
  static const String getMe = "api/users/me";
  static String updateUserById(String userId) => "api/users/$userId";
  static const String updateMe = "api/users/me";
  static String deleteUserById(String userId) => "api/users/$userId";
  static const String deleteMe = "api/users/me";


  // Example of uploading an image
  static const String uploadImage = "api/auth/register"; // Example endpoint for image upload

  // To get all users with pagination and filters
  static String getUsers({int? page, int? limit, String? sort, String? search, String? fields}) {
    final queryParams = <String>[];
    if (page != null) queryParams.add('_page=$page');
    if (limit != null) queryParams.add('_limit=$limit');
    if (sort != null) queryParams.add('_sort=$sort');
    if (search != null) queryParams.add('_search=$search');
    if (fields != null) queryParams.add('_fields=$fields');
    final queryString = queryParams.isNotEmpty ? '?${queryParams.join('&')}' : '';
    return 'api/users$queryString';
  }



  // Endpoints for products
  static const String getProducts = "api/products";
  static const String createProduct = "api/products";
  static String getProductById(String id) => "api/products/$id";
  static String getProductBySlug(String slug) => "api/products/$slug";
  static String updateProductById(String id) => "api/products/$id";
  static String updateProductBySlug(String slug) => "api/products/$slug";
  static String deleteProductById(String id) => "api/products/$id";
  static String deleteProductBySlug(String slug) => "api/products/$slug";
  static const String getRandomProducts = "api/products/get-random-products";
  // Endpoints for user products
  static String getUserProducts(String userId) => "api/users/$userId/products";
  // Endpoints for like product
  static String toggleLikeProduct(String productId) => "api/products/$productId/like";

// Endpoints for review:

  static const String getAllReviews = "api/reviews";
  static String getReviewsByProductId(String productId) => "api/products/$productId/reviews";
  static String getReviewsByUserId(String userId) => "api/users/$userId/reviews";
  static const String getLoggedInUserReviews = "api/me/reviews";
  static const String createReview = "api/reviews";
  static String getReviewById(String reviewId) => "api/reviews/$reviewId";
  static String updateReviewById(String reviewId) => "api/reviews/$reviewId";
  static String deleteReviewById(String reviewId) => "api/reviews/$reviewId";

  // Specific endpoints for reviews by product or user
  static String getReviewByProductIdAndReviewId(String productId, String reviewId) => "api/products/$productId/reviews/$reviewId";
  static String getReviewByUserIdAndReviewId(String userId, String reviewId) => "api/users/$userId/reviews/$reviewId";
  static String getReviewByLoggedInUserAndReviewId(String reviewId) => "api/me/reviews/$reviewId";

  // Vouchers
  static const String getAllVouchers = "api/vouchers";
  static String getVoucherById(String voucherId) => "api/vouchers/$voucherId";
  static const String createVoucher = "api/vouchers";
  static String updateVoucherById(String voucherId) => "api/vouchers/$voucherId";
  static String deleteVoucherById(String voucherId) => "api/vouchers/$voucherId";

  // Categories
  static const String getAllCategories = "api/categories";
  static String getCategoryById(String categoryId) => "api/categories/$categoryId";
  static const String createCategory = "api/categories";
  static String updateCategoryById(String categoryId) => "api/categories/$categoryId";
  static String deleteCategoryById(String categoryId) => "api/categories/$categoryId";

  // SubCategories
  static const String getAllSubCategories = "api/sub-categories";
  static String getSubCategoryById(String subCategoryId) => "api/sub-categories/$subCategoryId";
  static const String createSubCategory = "api/sub-categories";
  static String updateSubCategoryById(String subCategoryId) => "api/sub-categories/$subCategoryId";
  static String deleteSubCategoryById(String subCategoryId) => "api/sub-categories/$subCategoryId";

  // Packages
  static const String getAllPackages = "api/packages";
  static String getPackageById(String packageId) => "api/packages/$packageId";
  static const String createPackage = "api/packages";
  static String updatePackageById(String packageId) => "api/packages/$packageId";
  static String deletePackageById(String packageId) => "api/packages/$packageId";

  // Payments
  static const String getAllPayments = "api/payments";
  static String getPaymentsByUserId(String userId) => "api/users/$userId/payments";
  static String getPaymentById(String paymentId) => "api/payments/$paymentId";
  static const String createPayment = "api/payments";
  static String updatePaymentById(String paymentId) => "api/payments/$paymentId";
  static String deletePaymentById(String paymentId) => "api/payments/$paymentId";
  static const String getPaymentRequest = "api/payments/request";
  static String successPayment(String transactionId) => "api/payments/success/$transactionId";
  static String cancelPayment(String transactionId) => "api/payments/cancel/$transactionId";

  // Others
  static const String getAllOthers = "api/others";
  static String getOtherById(String otherId) => "api/others/$otherId";
  static const String createOther = "api/others";
  static String updateOtherById(String otherId) => "api/others/$otherId";
  static String deleteOtherById(String otherId) => "api/others/$otherId";

}
