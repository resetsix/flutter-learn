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
