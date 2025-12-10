import 'package:flutter/material.dart';
import 'package:hello_flutter/viewmodels/home.dart';

class HotView extends StatefulWidget {
  final SuggestionResultRes data;

  const HotView({required this.data, super.key});

  @override
  State<HotView> createState() => _HotViewState();
}

class _HotViewState extends State<HotView> {
  List<SuggestionGoodItem> get _getItems {
    if (widget.data.subTypes.isEmpty) return [];
    return widget.data.subTypes.first.goodsItems.items.take(2).toList();
  }

  Widget _getChildrenList() {
    final list = _getItems;
    return Row(
      spacing: 10,
      children: List.generate(list.length, (index) {
        return Column(
          spacing: 6,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 80,
                height: 100,
                child: Image.network(
                  list[index].picture,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/images/home_cmd_sm.png",
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFFE54D4D),
                borderRadius: BorderRadius.circular(26),
              ),
              child: Text(
                ("¥${list[index].price}"),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFF2D4C8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsetsGeometry.all(4),
        child: Column(
          spacing: 6,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.data.title,
              style: const TextStyle(color: Colors.white),
            ),
            _getChildrenList(),
          ],
        ),
      ),
    );
  }
}
