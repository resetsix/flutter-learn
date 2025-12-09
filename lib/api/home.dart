import 'package:hello_flutter/constants/conf.dart';
import 'package:hello_flutter/utils/fetch.dart';
import 'package:hello_flutter/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListService() async {
  return (await fetch.get(HttpConf.BANNER_LIST, {}) as List).map((item) {
    return BannerItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}
