// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import '../../../../../../../../../../core/common/config/lang/app_localizations.dart';
// import '../../../../../../../../../../core/common/config/theme/src/colors.dart';
// import '../../../../features/services/warehouse/inventory/presentation/ui/widget/add_material_section/presentation/ui/widgets/add_button.dart';
// import '../../function/validator.dart';
//
// class DropDownMultiSelection<T> extends StatelessWidget {
//   const DropDownMultiSelection({
//     super.key,
//     required this.validationKey,
//     required this.compareFn,
//     required this.onPressed,
//     this.onChanged,
//     required this.selectedItems,
//     required this.dropdownBuilder,
//     required this.items,
//   });
//
//   final Key validationKey;
//   final bool Function(T, T) compareFn;
//   final void Function() onPressed;
//   final void Function(List<T>)? onChanged;
//   final List<T> selectedItems;
//   final Widget Function(BuildContext, List<T>)? dropdownBuilder;
//   final DropdownSearchOnFind<T>? items;
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownSearch<T>.multiSelection(
//       key: validationKey,
//
//       suffixProps: const DropdownSuffixProps(
//         clearButtonProps: ClearButtonProps(isVisible: true),
//       ),
//       autoValidateMode: AutovalidateMode.disabled,
//       validator: (value) => validator(value: value, context: context),
//       compareFn: compareFn,
//       decoratorProps: DropDownDecoratorProps(
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: AppColors.primaryGray,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(24),
//             borderSide: BorderSide.none,
//           ),
//         ),
//       ),
//       dropdownBuilder: dropdownBuilder,
//       // asyncItems: asyncItems,
//       items: items,
//       popupProps: PopupPropsMultiSelection.dialog(
//         dialogProps: const DialogProps(
//           barrierDismissible: false
//         ),
//         selectionWidget: (BuildContext context, T t, bool isSelected){
//         return  Checkbox(
//            value: isSelected,
//            onChanged: (bool? value) {
//              if (value != null) {
//                onChanged?.call([...selectedItems, t]);
//              }
//            },
//            activeColor: AppColors.primaryColor,
//          );
//        },
//         showSelectedItems: true,
//         fit: FlexFit.loose,
//         constraints: const BoxConstraints(maxHeight: 300),
//         validationWidgetBuilder: (ctx, selectedItems) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: AddButton(
//               onPressed: onPressed,
//               text: ('select').tr(context),
//             ),
//           );
//         },
//       ),
//       onChanged: onChanged,
//       selectedItems: selectedItems,
//     );
//   }
// }
