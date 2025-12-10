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
  return SuggestionResultRes.fromJson(await fetch.get(HttpConf.HOT_LIST, {}));
}

Future<SuggestionResultRes> getInvogueResultListService() async {
  return SuggestionResultRes.fromJson(
    await fetch.get(HttpConf.IN_VOGUE_LIST, {}),
  );
}

Future<SuggestionResultRes> getOnsstopResultListService() async {
  return SuggestionResultRes.fromJson(
    await fetch.get(HttpConf.ONE_STOP_LIST, {}),
  );
}

Future<List<HomeRecommendRes>> getHomeRecommendListService(
  Map<String, dynamic> params,
) async {
  return (await fetch.get(HttpConf.HOME_RECOMMEND_LIST, params) as List).map((
    item,
  ) {
    return HomeRecommendRes.fromJson(item as Map<String, dynamic>);
  }).toList();
}
