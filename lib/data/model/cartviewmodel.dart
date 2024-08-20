class CartViewModel {
  int? sumprice;
  int? countitems;
  int? iId;
  String? iName;
  String? iNameAr;
  String? iImage;
  String? iDesc;
  String? iDescAr;
  int? iCount;
  int? iActive;
  int? iPrice;
  int? iDiscount;
  String? iData;
  int? itemsCat;
  int? cartId;
  int? cartUserid;
  int? cartItemid;

  CartViewModel(
      {this.sumprice,
      this.countitems,
      this.iId,
      this.iName,
      this.iNameAr,
      this.iImage,
      this.iDesc,
      this.iDescAr,
      this.iCount,
      this.iActive,
      this.iPrice,
      this.iDiscount,
      this.iData,
      this.itemsCat,
      this.cartId,
      this.cartUserid,
      this.cartItemid});

  CartViewModel.fromJson(Map<String, dynamic> json) {
    sumprice = json['sumprice'];
    countitems = json['countitems'];
    iId = json['i_id'];
    iName = json['i_name'];
    iNameAr = json['i_name_ar'];
    iImage = json['i_image'];
    iDesc = json['i_desc'];
    iDescAr = json['i_desc_ar'];
    iCount = json['i_count'];
    iActive = json['i_active'];
    iPrice = json['i_price'];
    iDiscount = json['i_discount'];
    iData = json['i_data'];
    itemsCat = json['items_cat'];
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartItemid = json['cart_itemid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sumprice'] = sumprice;
    data['countitems'] = countitems;
    data['i_id'] = iId;
    data['i_name'] = iName;
    data['i_name_ar'] = iNameAr;
    data['i_image'] = iImage;
    data['i_desc'] = iDesc;
    data['i_desc_ar'] = iDescAr;
    data['i_count'] = iCount;
    data['i_active'] = iActive;
    data['i_price'] = iPrice;
    data['i_discount'] = iDiscount;
    data['i_data'] = iData;
    data['items_cat'] = itemsCat;
    data['cart_id'] = cartId;
    data['cart_userid'] = cartUserid;
    data['cart_itemid'] = cartItemid;
    return data;
  }
}
