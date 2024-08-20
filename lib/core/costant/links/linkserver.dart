class Applink {
  static const String server = "http://10.0.2.2/ecommerce";

//=================================ServerImages=================================

  static const String serverimage = "http://10.0.2.2/ecommerce/upload";

//==============================================================================

  static const String signup = "$server/auth/signup.php";

  static const String register = "$server/auth/register.php";

  static const String data = "$server/index.php";

  static const String verifycode = "$server/data/verifycode.php";

//===============================forgetpassword=================================

  static const String verifycode_forget =
      "$server/forgetpassword/verifycode.php";

  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";

  static const String checkemail = "$server/forgetpassword/checkemail.php";

//================================catigories====================================

  static const String home = "$server/catigories/Home.php";

//====================================Items=====================================

  static const String items = "$server/items/items.php";

  static const String search = "$server/items/search.php";

//====================================favorite==================================

  static const String favoriteAdd = "$server/favorite/favoriteAdd.php";

  static const String favoriteRemove = "$server/favorite/favoriteRemove.php";

  static const String favoriteView = "$server/favorite/favoriteView.php";

//===================================cart=======================================
  static const String cartadd = "$server/cart/add.php";

  static const String cartdelete = "$server/cart/delete.php";

  static const String cartview = "$server/cart/view.php";

  static const String getcount = "$server/cart/getcount.php";

//===================================Address====================================
  static const String addressadd = "$server/address/add.php";

  static const String addressview = "$server/address/view.php";

  static const String addressedit = "$server/address/edit.php";

  static const String addressdelete = "$server/address/delete.php";

//===================================coupon=====================================

  static const String checkcoupon = "$server/coupon/checkcoupon.php";

//===================================orders=====================================

  static const String addorder = "$server/order/add.php";

  static const String orderview = "$server/order/view.php";

  static const String orderdelete = "$server/order/delete.php";

//===================================ordersdetails==============================

  static const String orderdetails = "$server/detailsorder/view.php";
}
