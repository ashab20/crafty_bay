class Urls {
  static const String _baseUrl = 'http://ecom-api.teamrabbil.com/api';
  // static const String _baseUrl = 'http://craftybay.teamrabbil.com/api';


  static String sentEmailOtp(String email) => '$_baseUrl/UserLogin/$email';

  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';

  static String readProfile = '$_baseUrl/ReadProfile';
  static String createProfile = '$_baseUrl/CreateProfile';
  static String homeBanner = '$_baseUrl/ListProductSlider';
  static String categoryList = '$_baseUrl/CategoryList';
  static String popularProduct = '$_baseUrl/ListProductByRemark/Popular';
  static String specialProduct = '$_baseUrl/ListProductByRemark/Special';
  static String newProduct = '$_baseUrl/ListProductByRemark/New';

  static String productsByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';

  static String productDetails(int productId) =>
      '$_baseUrl/ProductDetailsById/$productId';
  static String addToCart = '$_baseUrl/CreateCartList';
  static String cartList = '$_baseUrl/CartList';
  static String deleteCartList(int id) => "$_baseUrl/DeleteCartList/$id";
  static String createInvoice = '$_baseUrl/InvoiceCreate';

//   Product Review
  static String listReviewByProduct(int productId) => '$_baseUrl/ListReviewByProduct/$productId';
  static String createProductReview =  '$_baseUrl/CreateProductReview';

//   Wishlist
  static String addToWishList(int id) => "$_baseUrl/CreateWishList/$id";
  static String wishList = "$_baseUrl/ProductWishList";
  static String removeWishList(int id) => "$_baseUrl/RemoveWishList/$id";


}