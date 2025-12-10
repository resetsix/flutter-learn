class BannerItem {
  String id;
  String imgUrl;
  String hrefUrl;
  String type;

  BannerItem({
    required this.id,
    required this.imgUrl,
    required this.hrefUrl,
    required this.type,
  });

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(
      id: json['id'] as String,
      imgUrl: json['imgUrl'] as String,
      hrefUrl: json['hrefUrl'] as String,
      type: json['type'] as String,
    );
  }
}

class HeadCategoryItem {
  String id;
  String name;
  String picture;
  List<dynamic> children;
  List<dynamic> goods;

  HeadCategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    required this.children,
    required this.goods,
  });

  factory HeadCategoryItem.fromJson(Map<String, dynamic> json) {
    return HeadCategoryItem(
      id: json['id'] as String,
      name: json['name'] as String,
      picture: json['picture'] as String,
      children: json['children'] == null
          ? []
          : json['children'].map((e) => HeadCategoryItem.fromJson(e)).toList(),
      goods: json['goods'] == null
          ? []
          : json['goods'].map((e) => GoodsItem.fromJson(e)).toList(),
    );
  }
}

class GoodsItem {
  String id;
  String name;
  String picture;
  List<dynamic> children;
  List<dynamic> goods;

  GoodsItem({
    required this.id,
    required this.name,
    required this.picture,
    required this.children,
    required this.goods,
  });

  factory GoodsItem.fromJson(Map<String, dynamic> json) {
    return GoodsItem(
      id: json['id'] as String,
      name: json['name'] as String,
      picture: json['picture'] as String,
      children: json['children'] == null
          ? []
          : json['children'].map((e) => GoodsItem.fromJson(e)).toList(),
      goods: json['goods'] == null
          ? []
          : json['goods'].map((e) => GoodsItem.fromJson(e)).toList(),
    );
  }
}

// 在home.dart中生成对应的类型文件 包含工厂转化函数

class SuggestionResultRes {
  String id;
  String title;
  List<SuggestionSubType> subTypes;

  SuggestionResultRes({
    required this.id,
    required this.title,
    required this.subTypes,
  });

  factory SuggestionResultRes.fromJson(Map<String, dynamic> json) {
    return SuggestionResultRes(
      id: json['id'] as String,
      title: json['title'] as String,
      subTypes: (json['subTypes'] as List<dynamic>)
          .map((e) => SuggestionSubType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class SuggestionSubType {
  String id;
  String title;
  SuggestionGoodItems goodsItems;

  SuggestionSubType({
    required this.id,
    required this.title,
    required this.goodsItems,
  });

  factory SuggestionSubType.fromJson(Map<String, dynamic> json) {
    return SuggestionSubType(
      id: json['id'] as String,
      title: json['title'] as String,
      goodsItems: SuggestionGoodItems.fromJson(
        json['goodsItems'] as Map<String, dynamic>,
      ),
    );
  }
}

class SuggestionGoodItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<SuggestionGoodItem> items;

  SuggestionGoodItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory SuggestionGoodItems.fromJson(Map<String, dynamic> json) {
    return SuggestionGoodItems(
      counts: json['counts'] as int,
      pageSize: json['pageSize'] as int,
      pages: json['pages'] as int,
      page: json['page'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => SuggestionGoodItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class SuggestionGoodItem {
  String id;
  String name;
  String? desc;
  String price;
  String picture;
  int orderNum;

  SuggestionGoodItem({
    required this.id,
    required this.name,
    required this.price,
    required this.picture,
    required this.orderNum,
    this.desc,
  });

  factory SuggestionGoodItem.fromJson(Map<String, dynamic> json) {
    return SuggestionGoodItem(
      id: json['id'] as String,
      name: json['name'] as String,
      desc: json['desc'] as String?,
      price: json['price'] as String,
      picture: json['picture'] as String,
      orderNum: json['orderNum'] as int,
    );
  }
}

// {
//   "code": "1",
//   "msg": "操作成功",
//   "result": {
//     "id": "897682543",
//     "title": "特惠推荐",
//     "subTypes": [
//       {
//         "id": "912000341",
//         "title": "抢先尝鲜",
//         "goodsItems": {
//           "counts": 459,
//           "pageSize": 10,
//           "pages": 46,
//           "page": 1,
//           "items": [
//             {
//               "id": "1750713978985644033",
//               "name": "Fleep 带胸垫纯棉蕾丝背心打底内衣 烟粉色",
//               "desc": "贴身无痕，轻薄吸汗",
//               "price": "411.00",
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/216885/p1.png",
//               "orderNum": 14
//             },
//             {
//               "id": "1750713979203747843",
//               "name": "ROOTOTE FEATHER ROO 大容量轻便多用羽绒双肩包 酒红棕色",
//               "desc": "大容量实用羽绒双肩包",
//               "price": "449.00",
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/250039/p1.png",
//               "orderNum": 15
//             },
//             {
//               "id": "1379052170040578049",
//               "name": "极光限定 珠光蓝珐琅锅",
//               "desc": null,
//               "price": "199.00",
//               "picture": "http://yjy-xiaotuxian-dev.oss-cn-beijing.aliyuncs.com/picture/2021-04-05/7f483771-6831-4a7a-abdb-2625acb755f3.png",
//               "orderNum": 929
//             },
//             {
//               "id": "1750713979610595335",
//               "name": "Vasic Wells Mini Mini 牛皮抽绳单肩手提包 奶油白色",
//               "desc": "抽绳束口 小众手袋",
//               "price": "3108.00",
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/254839/p1.png",
//               "orderNum": 26
//             },
//             {
//               "id": "1750713979002421248",
//               "name": "THE NORTH FACE PURPLE LABEL 灯芯绒双面棉外套 BR(Brown)",
//               "desc": "复古风格双面穿搭",
//               "price": "3455.00",
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/260272/p1.png",
//               "orderNum": 18
//             },
//             {
//               "id": "1750713979405074436",
//               "name": "SAIMEI 彩明 i.ro 儿童防紫外线太阳镜 蓝色",
//               "desc": "防紫外线舒适护目太阳镜",
//               "price": "839.00",
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/235214/p5.png",
//               "orderNum": 8
//             },
//             {
//               "id": "1750713979535097864",
//               "name": "十方未来 舒适贴身内搭保暖打底衣 棕色",
//               "desc": "对抗寒冬，倍暖打底",
//               "price": "354.00",
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/239623/p6.png",
//               "orderNum": 16
//             },
//             {
//               "id": "1750713979895808016",
//               "name": "COGIT UV时尚宽檐牛仔布渔夫帽 深蓝色",
//               "desc": "不压发型 清凉舒适",
//               "price": "132.00",
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/250541/p1.png",
//               "orderNum": 28
//             },
//             {
//               "id": "1750713979329576964",
//               "name": "CA4LA FREEDOM JOURNEY WS 2 BEIGE ONESIZE 货号:DOU01880",
//               "desc": "自由塑形，风格百搭",
//               "price": "977.00",
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/254380/p1.png",
//               "orderNum": 14
//             },
//             {
//               "id": "1750713979312799746",
//               "name": "NEW ERA 双耳针织帽黑色 OSFM(98)",
//               "desc": "保暖耳瓣，时尚百搭",
//               "price": "388.00",
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/256173/p1.png",
//               "orderNum": 9
//             }
//           ]
//         }
//       },
//       {
//         "id": "912000342",
//         "title": "新品预告",
//         "goodsItems": {
//           "counts": 459,
//           "pageSize": 10,
//           "pages": 46,
//           "page": 1,
//           "items": [
//             {
//               "id": "1750713979002421248",
//               "name": "THE NORTH FACE PURPLE LABEL 灯芯绒双面棉外套 BR(Brown)",
//               "desc": "复古风格双面穿搭",
//               "price": "3455.00",
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/260272/p1.png",
//               "orderNum": 18
//             },
//             {
//               "id": "1750713978985644033",
//               "name": "Fleep 带胸垫纯棉蕾丝背心打底内衣 烟粉色",
//               "desc": "贴身无痕，轻薄吸汗",
//               "price": "411.00",
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/216885/p1.png",
//               "orderNum": 14
//             },
//             {
//               "id": "1750713979895808016",
//               "name": "COGIT UV时尚宽檐牛仔布渔夫帽 深蓝色",
//               "desc": "不压发型 清凉舒适",
//               "price": "132.00",
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/250541/p1.png",
//               "orderNum": 28
//             },
//             {
//               "id": "1750713979312799746",
//               "name": "NEW ERA 双耳针织帽黑色 OSFM(98)",
//               "desc": "保暖耳瓣，时尚百搭",
//               "price": "388.00",
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/256173/p1.png",
//               "orderNum": 9
//             },
//             {
//               "id": "1750713979329576964",
//               "name": "CA4LA FREEDOM JOURNEY WS 2 BEIGE ONESIZE 货号:DOU01880",
//               "desc": "自由塑形，风格百搭",
//               "price": "977.00",
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/254380/p1.png",
//               "orderNum": 14
//             },
//             {
//               "id": "1750713979610595335",
//               "name": "Vasic Wells Mini Mini 牛皮抽绳单肩手提包 奶油白色",
//               "desc": "抽绳束口 小众手袋",
//               "price": "3108.00",
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/254839/p1.png",
//               "orderNum": 26
//             },
//             {
//               "id": "1750713979405074436",
//               "name": "SAIMEI 彩明 i.ro 儿童防紫外线太阳镜 蓝色",
//               "desc": "防紫外线舒适护目太阳镜",
//               "price": "839.00",
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/235214/p5.png",
//               "orderNum": 8
//             },
//             {
//               "id": "1750713979203747843",
//               "name": "ROOTOTE FEATHER ROO 大容量轻便多用羽绒双肩包 酒红棕色",
//               "desc": "大容量实用羽绒双肩包",
//               "price": "449.00",
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/250039/p1.png",
//               "orderNum": 15
//             },
//             {
//               "id": "1750713979535097864",
//               "name": "十方未来 舒适贴身内搭保暖打底衣 棕色",
//               "desc": "对抗寒冬，倍暖打底",
//               "price": "354.00",
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/239623/p6.png",
//               "orderNum": 16
//             },
//             {
//               "id": "1379052170040578049",
//               "name": "极光限定 珠光蓝珐琅锅",
//               "desc": null,
//               "price": "199.00",
//               "picture": "http://yjy-xiaotuxian-dev.oss-cn-beijing.aliyuncs.com/picture/2021-04-05/7f483771-6831-4a7a-abdb-2625acb755f3.png",
//               "orderNum": 929
//             }
//           ]
//         }
//       }
//     ]
//   }
// }
