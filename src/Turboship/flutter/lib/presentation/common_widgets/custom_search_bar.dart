import 'package:flutter/material.dart';

import '../../core/extensions/all.dart';
import 'all.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    this.searchController,
    this.searchFocusNode,
    this.height = 48,
    this.radius = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.hintText,
    this.onChanged,
    this.autofocus = false,
    this.onClear,
    super.key,
  });

  final TextEditingController? searchController;
  final FocusNode? searchFocusNode;
  final double height;
  final double radius;
  final EdgeInsets padding;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final bool autofocus;
  final VoidCallback? onClear;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final ValueNotifier<String> _textNotifier = ValueNotifier<String>('');
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = widget.searchController ?? TextEditingController();
    _searchController.addListener(() {
      _textNotifier.value = _searchController.text;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onClear() {
    _searchController.clear();
    widget.onClear?.call();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: AppTextField(
        controller: _searchController,
        focusNode: widget.searchFocusNode,
        hintText: widget.hintText,
        onChanged: widget.onChanged,
        autofocus: widget.autofocus,
        prefixIcon: _buildPrefix(context),
        suffixIcon: _buildSuffixIcon(context),
      ),
    );
  }

  AppIcon _buildPrefix(BuildContext context) {
    return AppIcon(
      icon: AppIcons.search,
      color: context.colorTheme.icNormalBrand,
      onTap: _onClear,
    );
  }

  Widget? _buildSuffixIcon(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _textNotifier,
      builder: (_, text, __) {
        return widget.onClear != null && text.isNotEmpty ? _buildClearButton(context) : const SizedBox.shrink();
      },
    );
  }

  Widget _buildClearButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIcon(
            icon: AppIcons.close,
            color: context.colorTheme.icNormalTertiary,
            onTap: _onClear,
          ),
        ],
      ),
    );
  }
}
