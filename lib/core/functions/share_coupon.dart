import 'package:share_plus/share_plus.dart';
import 'package:wafarly/features/home/data/models/coupon_model/coupon_model.dart';

void shareCoupon({required CouponModel couponModel}) {
  Share.share(
      '${couponModel.storeUrl}\n${couponModel.title}\n${couponModel.code} :كود الكوبون هو');
}
void shareApp({required String link}) {
  Share.share(
      link);
}
