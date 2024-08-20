class Itemsmodel {
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
  int? cId;
  String? cName;
  String? cNameAr;
  String? cImage;
  String? cTime;
  int? favoriteA;
  int? discountprice;

  Itemsmodel(
      {this.iId,
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
      this.cId,
      this.cName,
      this.cNameAr,
      this.cImage,
      this.cTime,
      this.favoriteA,
      this.discountprice});

  Itemsmodel.fromJson(Map<String, dynamic> json) {
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
    cId = json['c_id'];
    cName = json['c_name'];
    cNameAr = json['c_name_ar'];
    cImage = json['c_image'];
    cTime = json['c_time'];
    favoriteA = json['favorite_a'];
    discountprice = json['discountprice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['c_id'] = cId;
    data['c_name'] = cName;
    data['c_name_ar'] = cNameAr;
    data['c_image'] = cImage;
    data['c_time'] = cTime;
    data['favorite_a'] = favoriteA;
    data['discountprice'] = discountprice;
    return data;
  }
}
