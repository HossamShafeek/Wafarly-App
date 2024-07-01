import 'package:wafarly/config/local/cache_helper.dart';
import 'package:wafarly/core/utils/app_constants.dart';

Future<void> clearCash()async{
  CacheHelper.removeData(key: AppConstants.cacheFavoritesModel).then((value)async {
   await CacheHelper.removeData(key: AppConstants.cacheUserModel);
   await CacheHelper.removeData(key: 'userType');
  await  CacheHelper.removeData(key: 'userId');
    AppConstants.userType = '';
    AppConstants.userId = '';
  });
}