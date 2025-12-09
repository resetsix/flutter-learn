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
