class CouponModel {
  int? couponId;
  String? couponName;
  int? couponCount;
  String? couponExpiredata;
  int? couponDicount;

  CouponModel(
      {this.couponId,
      this.couponName,
      this.couponCount,
      this.couponExpiredata,
      this.couponDicount});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponCount = json['coupon_count'];
    couponExpiredata = json['coupon_expiredata'];
    couponDicount = json['coupon_dicount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coupon_id'] = couponId;
    data['coupon_name'] = couponName;
    data['coupon_count'] = couponCount;
    data['coupon_expiredata'] = couponExpiredata;
    data['coupon_dicount'] = couponDicount;
    return data;
  }
}
