import 'dart:async';
import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:aqaqeer/core/di/di.dart';
import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';
import 'package:aqaqeer/core/provider/app_config_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../../config/theme/src/colors.dart';
import '../../config/theme/src/styles.dart';
import '../icons/required_icon.dart';

class CustomDropDown<T> extends StatelessWidget {
  final void Function(T?)? onChange;
  final Function(T?)? validator;
  final T? selectedItem;
  final String Function(T) itemAsString;
  final DropdownSearchOnFind<T>? list;
  final Key? dropDownKey;
  final String? hint;
  final String? label;
  final DropdownSearchBuilder? builder;
  final PopupProps<T>? popupProps;
  final bool searchEnabled;
  final bool enabled;
  final bool filled;
  final bool Function(T, T)? compareFn;
  final Future<bool?> Function(T?, T?)? onBeforeChange;
  final Color? fillColor;
  final Color? backgroundColor;
  final bool Function(T item)? disabledItem;
  final DropdownSearchPopupItemBuilder<T>? itemBuilderPopupDropDownSearch;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? errorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? focusedBorder;
  final int? hintMaxLines;
  final TextStyle? hintStyle;
  final RequiredFieldIcon? prefixIcon;
  final TextStyle? labelStyle;

  const CustomDropDown({
    super.key,
    this.validator,
    this.prefixIcon,
    this.dropDownKey,
    this.hintStyle,
    this.onChange,
    this.selectedItem,
    this.hintMaxLines,
    this.itemAsString = _defaultItemAsString,
    this.list,
    this.hint,
    this.builder,
    this.popupProps,
    this.searchEnabled = false,
    this.enabled = true,
    this.filled = true,
    this.disabledItem,
    this.itemBuilderPopupDropDownSearch,
    this.label,
    this.onBeforeChange,
    this.compareFn,
    this.fillColor,
    this.backgroundColor,
    this.border,
    this.enabledBorder,
    this.focusedErrorBorder,
    this.errorBorder,
    this.disabledBorder,
    this.focusedBorder,
    this.labelStyle
  });

  static String _defaultItemAsString(dynamic item) {
    return item?.toString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(horizontal: 3),
      child: DropdownSearch<T>(


        key: dropDownKey,
        items: list,
        compareFn: compareFn,
        onChanged: onChange,
        selectedItem: selectedItem,
        enabled: enabled,
        itemAsString: (dynamic item) {
          return itemAsString(item as T);
        },
        // Type
        dropdownBuilder: builder,
        // cast here
        decoratorProps: DropDownDecoratorProps(
          decoration: InputDecoration(

            enabledBorder:
                enabledBorder ??
                OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
            border:
                border ??
                OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
            focusedErrorBorder:
                focusedBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: AppColors.mainRed),
                ),
            errorBorder:
                errorBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: AppColors.mainRed),
                ),
            disabledBorder:
                disabledBorder ??
                OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
            focusedBorder:
                focusedBorder ??
                OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
            filled: filled,
            hintText: hint,
            label: Text(label ?? '', style: CustomTextStyle.bodyMedium(context)),
            labelStyle: labelStyle ?? CustomTextStyle.titleSmall(context),
            hintMaxLines: 1,
            hintStyle: CustomTextStyle.titleSmall(context),
            contentPadding: getIt<AppConfigProvider>().isEn() ?
            const EdgeInsets.only(left: 8,):const EdgeInsets.only(right: 10,),
            fillColor: fillColor ?? AppColors.primaryGray,
          ),
        ),
        popupProps:
            popupProps ??
            PopupProps.menu(
              showSearchBox: searchEnabled,
              disabledItemFn: disabledItem,
              searchDelay: const Duration(microseconds: 1),
              fit: FlexFit.loose,
              itemBuilder: itemBuilderPopupDropDownSearch,
              constraints: const BoxConstraints(maxHeight: 300),
              emptyBuilder: (context, item) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'no_data_found'.tr(context),
                        style: CustomTextStyle.titleMedium(context),
                      ),
                    ],
                  ),
                );
              },
              menuProps: MenuProps(
                backgroundColor: backgroundColor ?? AppColors.primaryGray2,
              ),
            ),
        validator: (value) {
          if (value == null) {
            return AppLocalizations.of(context)!.field_required;
          }
          return null;
        },
        onBeforeChange: onBeforeChange,
      ),
    );
  }
}
