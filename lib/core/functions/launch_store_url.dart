import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';


Future<void> launchStoreUrl({required BuildContext context,required String storeUrl}) async {
  final Uri uri = Uri.parse(storeUrl);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
}