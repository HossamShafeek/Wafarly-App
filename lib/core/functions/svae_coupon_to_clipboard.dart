import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:wafarly/core/functions/show_snack_bar.dart';

void saveCouponCodeToClipboard({
  required BuildContext context,
  required String couponCode,
}) {
  Clipboard.setData(ClipboardData(text: couponCode));
  showSuccessSnackBar(context: context, message: 'تم نسخ كود الكوبون بنجاح');
}
