import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';

import '../../config/theme/src/colors.dart';
import '../../function/validator.dart';

class EasyAutocompleteWidget extends StatelessWidget {
  const EasyAutocompleteWidget({
    super.key,
    this.suggestions,
    this.controller,
    required this.onChanged,
    required this.onSubmitted,
    required this.hintText,
    this.color,
    this.asyncSuggestions
  });

  final List<String>? suggestions;
  final TextEditingController? controller;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final String hintText;
  final Color? color;
  final Future<List<String>> Function(String)? asyncSuggestions;

  @override
  Widget build(BuildContext context) {

    return EasyAutocomplete(
      asyncSuggestions: asyncSuggestions,

      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.search),
        hintText: hintText,
        fillColor:color?? AppColors.primaryGray,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none
        ),
      ),
      validator: (value) => validator(value: value, context: context),
      suggestions: suggestions,
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,

    );
  }
}