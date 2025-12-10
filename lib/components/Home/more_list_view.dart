import 'package:flutter/material.dart';
import 'package:hello_flutter/viewmodels/home.dart';

class MoreListView extends StatefulWidget {
  final List<HomeRecommendRes> data;
  const MoreListView({required this.data, super.key});

  @override
  State<MoreListView> createState() => _MoreListViewState();
}

class _MoreListViewState extends State<MoreListView> {
  Widget _goodsItem(HomeRecommendRes item) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Column(
        spacing: 4,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(item.picture, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsetsGeometry.symmetric(horizontal: 6),
            child: Text(
              item.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsetsGeometry.symmetric(horizontal: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "¥${item.price}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const TextSpan(text: "  ", style: TextStyle(fontSize: 4)),
                      TextSpan(
                        text: "¥${(item.price * 1.2).toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "${item.payCount}人付款",
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemCount: widget.data.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 5),
          child: _goodsItem(widget.data[index]),
        );
      },
    );
  }
}

class PriceText extends StatelessWidget {
  final double price;
  final double? originalPrice;

  const PriceText({required this.price, super.key, this.originalPrice});

  @override
  Widget build(BuildContext context) {
    final priceStr = price.toStringAsFixed(2); // 始终 2 位小数
    final parts = priceStr.split("."); // ["79", "90"]

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // ¥符号（小）
        const Text(
          "¥",
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFFE54D4D),
            fontWeight: FontWeight.w600,
          ),
        ),

        // 整数部分（大）
        Text(
          parts[0],
          style: const TextStyle(
            fontSize: 20,
            color: Color(0xFFE54D4D),
            fontWeight: FontWeight.bold,
          ),
        ),

        // 小数部分（小一点）
        Text(
          ".${parts[1]}",
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFFE54D4D),
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(width: 6),

        // 原价（可选）
        if (originalPrice != null)
          Text(
            "¥${originalPrice!.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
      ],
    );
  }
}
