import 'package:flutter/material.dart';

class SuggestionView extends StatefulWidget {
  const SuggestionView({super.key});

  @override
  State<SuggestionView> createState() => _SuggestionViewState();
}

class _SuggestionViewState extends State<SuggestionView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        color: Colors.blue,
        height: 100,
        alignment: Alignment.center,
        child: const Text("推荐", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
