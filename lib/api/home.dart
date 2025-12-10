import 'package:hello_flutter/constants/conf.dart';
import 'package:hello_flutter/utils/fetch.dart';
import 'package:hello_flutter/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListService() async {
  return (await fetch.get(HttpConf.BANNER_LIST, {}) as List).map((item) {
    return BannerItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

Future<List<HeadCategoryItem>> getHeadCategoryListService() async {
  return (await fetch.get(HttpConf.HEAD_CATEGORY_LIST, {}) as List).map((item) {
    return HeadCategoryItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

Future<SuggestionResultRes> getSuggestionResultListService() async {
  final res = SuggestionResultRes.fromJson(
    await fetch.get(HttpConf.HOT_LIST, {}),
  );
  print(res);
  return res;
}
