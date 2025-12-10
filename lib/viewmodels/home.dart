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

class HomeRecommendRes {
  String id;
  String name;
  double price;
  String picture;
  int payCount;

  HomeRecommendRes({
    required this.id,
    required this.name,
    required this.price,
    required this.picture,
    required this.payCount,
  });

  factory HomeRecommendRes.fromJson(Map<String, dynamic> json) {
    return HomeRecommendRes(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      picture: json['picture'] as String,
      payCount: json['payCount'] as int,
    );
  }
}
