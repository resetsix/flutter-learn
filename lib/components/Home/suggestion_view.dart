import 'package:flutter/material.dart';
import 'package:hello_flutter/viewmodels/home.dart';

class SuggestionView extends StatefulWidget {
  final SuggestionResultRes data;
  const SuggestionView({required this.data, super.key});

  @override
  State<SuggestionView> createState() => _SuggestionViewState();
}

class _SuggestionViewState extends State<SuggestionView> {
  List<SuggestionGoodItem> _getItems() {
    if (widget.data.subTypes.isEmpty) return [];
    return widget.data.subTypes.first.goodsItems.items.take(2).toList();
  }

  Widget _buildLeft() {
    return Container(
      width: 100,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          image: AssetImage("assets/images/home_cmd_inner.png"),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _bannerTitle() {
    return Row(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          spacing: 10,
          children: [
            const Text(
              "特惠推荐",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              "精选省攻略",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        ),
      ],
    );
  }

  Widget _getChildrenList() {
    final list = _getItems();
    return Row(
      spacing: 10,
      children: List.generate(list.length, (index) {
        return Column(
          spacing: 6,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 100,
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
                color: Colors.redAccent,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 180,
        padding: const EdgeInsets.only(left: 4),
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/home_cmd_sm.png'),
            fit: BoxFit.contain,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Column(
            spacing: 6,
            children: [
              _bannerTitle(),
              Row(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_buildLeft(), _getChildrenList()],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
