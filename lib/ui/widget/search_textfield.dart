import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final bool showBackButton;
  final VoidCallback onBackPressed;

  const SearchTextField({
    super.key,
    required this.showBackButton,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: showBackButton
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: onBackPressed,
              )
            : const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
