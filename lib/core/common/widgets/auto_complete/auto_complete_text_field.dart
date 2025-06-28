import 'package:flutter/material.dart';

import '../../config/theme/src/colors.dart';


class AutocompleteTextField<T> extends StatefulWidget {
  final List<T> suggestions;
  final String Function(T) displayStringForOption;
  final void Function(T) onSelected;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  const AutocompleteTextField({super.key,
    required this.suggestions,
    required this.displayStringForOption,
    required this.onSelected,
    this.onChanged,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon
  });

  @override
  _AutocompleteTextFieldState<T> createState() => _AutocompleteTextFieldState<T>();
}

class _AutocompleteTextFieldState<T> extends State<AutocompleteTextField<T>> {

  OverlayEntry? _overlayEntry;
  List<T> _filteredSuggestions = [];
  final LayerLink _layerLink = LayerLink();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
   widget.controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _updateOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
    }
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height),
          child: Material(
            elevation: 4.0,
            child: Container(
              constraints: const BoxConstraints(maxHeight: 200.0),
              color: AppColors.white,// Fixed height for scalability
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: _filteredSuggestions.map((suggestion) {
                  return ListTile(
                    title: Text(widget.displayStringForOption(suggestion)),
                    onTap: () {
                      setState(() {
                        widget.controller.text = widget.displayStringForOption(suggestion);
                      });
                      widget.onSelected(suggestion);
                      _overlayEntry?.remove();
                      _overlayEntry = null;
                      _focusNode.unfocus();
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _filterSuggestions(String query) {
    setState(() {
      _filteredSuggestions = widget.suggestions
          .where((suggestion) =>
          widget.displayStringForOption(suggestion).toLowerCase().contains(query.toLowerCase()))
          .toList();
    });

    if (_filteredSuggestions.isNotEmpty) {
      _updateOverlay();
    } else {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Focus(
        focusNode: _focusNode,
        onFocusChange: (hasFocus) {
          if (hasFocus) {
            _filterSuggestions(widget.controller.text);
          } else {
            _overlayEntry?.remove();
            _overlayEntry = null;
          }
        },
        child: TextField(
          controller: widget.controller,
          onChanged: (value) {
            _filterSuggestions(value);
            if (widget.onChanged != null) {
              widget.onChanged!(value); // Call the onChanged callback
            }
          },
          decoration: InputDecoration(
            suffixIcon:widget.suffixIcon?? const Icon(Icons.search),
            prefixIcon: widget.prefixIcon,
            hintText: '',
            fillColor: AppColors.primaryGray,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide.none
            ),
          ),
        ),
      ),
    );
  }
}
