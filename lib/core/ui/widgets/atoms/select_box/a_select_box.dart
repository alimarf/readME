import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../colors/colors.dart';
import '../../../constants/sizes.dart';
import '../bottom_sheet/a_bottom_sheet.dart';
import '../gap/a_gap.dart';
import '../text/a_text.dart';
import '../textfield/a_text_field.dart';

enum SelectBoxType { BottomSheet, Dialog, Page }

class SelectBoxOption {
  String? value;
  String? text;

  SelectBoxOption({this.value, this.text});

  factory SelectBoxOption.fromJson(Map<String, dynamic> json) {
    return SelectBoxOption(value: json['value'], text: json['text']);
  }

  Map<String, dynamic> toJson() => {'value': value, 'text': text};
}

// ignore: must_be_immutable
class ASelectBox extends StatefulWidget {
  SelectBoxType? type;
  String name;
  String hintText;
  String? labelText;
  String? helperText;
  String? errorText;
  FocusNode? focusNode;
  GlobalKey<FormBuilderState>? formKey;
  Widget? prefixIcon;
  Widget? suffixIcon;
  SelectBoxOption? selectedOption;
  List<SelectBoxOption> itemList;
  bool isEnabled;
  bool isRequired;
  bool showSearch;
  String? Function(String?)? onValidate;
  Function(String?)? onSaved;
  Function(SelectBoxOption)? onChange;

  ASelectBox({
    Key? key,
    required this.name,
    required this.hintText,
    this.isEnabled = true,
    this.isRequired = false,
    this.type = SelectBoxType.BottomSheet,
    this.labelText,
    this.helperText,
    this.errorText,
    this.focusNode,
    this.formKey,
    this.prefixIcon,
    this.suffixIcon,
    this.showSearch = false,
    this.onValidate,
    this.onSaved,
    this.onChange,
    this.selectedOption,
    required this.itemList,
  }) : super(key: key) {
    suffixIcon = suffixIcon ??
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.gray.shade100,
                borderRadius: BorderRadius.circular(20)),
            child: const Icon(
              CupertinoIcons.chevron_down,
              size: 18,
            ),
          ),
        );
  }

  @override
  State<ASelectBox> createState() => _ASelectBoxState();
}

class _ASelectBoxState extends State<ASelectBox> {
  Future<void> showItemList() async {
    FocusManager.instance.primaryFocus?.unfocus();

    SelectBoxOption? selectedBoxOption;

    switch (widget.type) {
      case SelectBoxType.BottomSheet:
        selectedBoxOption = await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            isDismissible: true,
            backgroundColor: Colors.transparent,
            builder: (_) {
              String keyword = "";
              List<SelectBoxOption> filteredItemList = widget.itemList
                  .where((item) =>
                      item.text!.toLowerCase().contains(keyword.toLowerCase()))
                  .toList();

              return ABottomSheet(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.hintText,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  AGap(
                    height: 20,
                  ),
                  StatefulBuilder(builder: (BuildContext context, setState) {
                    return Column(
                      children: [
                        if (widget.showSearch)
                          ATextField(
                            name: 'keyword',
                            hintText: 'Cari',
                            isRequired: widget.isRequired,
                            onChange: (value) => setState(() {
                              if (value == null) {
                                return;
                              }

                              keyword = value;
                              filteredItemList = widget.itemList
                                  .where((item) => item.text!
                                      .toLowerCase()
                                      .contains(keyword.toLowerCase()))
                                  .toList();
                            }),
                          ),
                        SizedBox(
                          height: Get.height,
                          child: filteredItemList.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                        onTap: () => Navigator.of(context)
                                            .pop(filteredItemList[index]),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: Text(
                                              filteredItemList[index].text ??
                                                  '-'),
                                        ));
                                  },
                                  itemCount: filteredItemList.length,
                                )
                              : Padding(
                                  padding:
                                      EdgeInsets.only(top: AppSizes.margin),
                                  child: AText(
                                    'Data not found',
                                    style: Get.context!.textTheme.bodyLarge,
                                  ),
                                ),
                        ),
                      ],
                    );
                  }),
                ],
              ));
            });
        break;
      case SelectBoxType.Dialog:
        selectedBoxOption =
            await Get.dialog(StatefulBuilder(builder: (context, setState) {
          String keyword = "";
          List<SelectBoxOption> filteredItemList = widget.itemList
              .where((item) =>
                  item.text!.toLowerCase().contains(keyword.toLowerCase()))
              .toList();

          return Material(
            child: Container(
                margin: const EdgeInsets.all(AppSizes.margin),
                decoration: const BoxDecoration(color: AppColors.white),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.hintText,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      AGap(
                        height: 20,
                      ),
                      StatefulBuilder(
                          builder: (BuildContext context, setState) {
                        return Column(
                          children: [
                            if (widget.showSearch)
                              ATextField(
                                name: 'keyword',
                                hintText: 'Cari',
                                isRequired: widget.isRequired,
                                onChange: (value) => setState(() {
                                  if (value == null) {
                                    return;
                                  }

                                  keyword = value;
                                  filteredItemList = widget.itemList
                                      .where((item) => item.text!
                                          .toLowerCase()
                                          .contains(keyword.toLowerCase()))
                                      .toList();
                                }),
                              ),
                            SizedBox(
                              height: Get.height,
                              child: filteredItemList.isNotEmpty
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                            onTap: () => Navigator.of(context)
                                                .pop(filteredItemList[index]),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0),
                                              child: Text(
                                                  filteredItemList[index]
                                                          .text ??
                                                      '-'),
                                            ));
                                      },
                                      itemCount: filteredItemList.length,
                                    )
                                  : Padding(
                                      padding:
                                          EdgeInsets.only(top: AppSizes.margin),
                                      child: AText(
                                        'Data not found',
                                        style: Get.context!.textTheme.bodyLarge,
                                      ),
                                    ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                )),
          );
        }));
        break;
      case SelectBoxType.Page:
        selectedBoxOption =
            await Get.dialog(StatefulBuilder(builder: (context, setState) {
          String keyword = "";
          List<SelectBoxOption> filteredItemList = widget.itemList
              .where((item) =>
                  item.text!.toLowerCase().contains(keyword.toLowerCase()))
              .toList();

          return Material(
            child: Container(
                margin: const EdgeInsets.all(AppSizes.margin),
                decoration: const BoxDecoration(color: AppColors.white),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.back();
                            },
                            child: Icon(
                              LucideIcons.chevronLeft,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            widget.hintText,
                            style: Get.context!.textTheme.titleMedium
                                ?.copyWith(color: AppColors.black),
                          ),
                          AGap(
                            width: AppSizes.largeMargin,
                          )
                        ],
                      ),
                      AGap(
                        height: 20,
                      ),
                      StatefulBuilder(
                          builder: (BuildContext context, setState) {
                        return Column(
                          children: [
                            if (widget.showSearch)
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: AppSizes.margin),
                                child: ATextField(
                                  name: 'keyword',
                                  hintText: 'Search',
                                  isRequired: widget.isRequired,
                                  onChange: (value) => setState(() {
                                    if (value == null) {
                                      return;
                                    }

                                    keyword = value;
                                    filteredItemList = widget.itemList
                                        .where((item) => item.text!
                                            .toLowerCase()
                                            .contains(keyword.toLowerCase()))
                                        .toList();
                                  }),
                                ),
                              ),
                            SizedBox(
                              height: Get.height,
                              child: filteredItemList.isNotEmpty
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                            onTap: () => Navigator.of(context)
                                                .pop(filteredItemList[index]),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0),
                                              child: Text(
                                                  filteredItemList[index]
                                                          .text ??
                                                      '-'),
                                            ));
                                      },
                                      itemCount: filteredItemList.length,
                                    )
                                  : Padding(
                                      padding:
                                          EdgeInsets.only(top: AppSizes.margin),
                                      child: AText(
                                        'Data not found',
                                        style: Get.context!.textTheme.bodyLarge,
                                      ),
                                    ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                )),
          );
        }));
        break;
      default:
    }

    if (selectedBoxOption != null) {
      setState(() {
        widget.selectedOption = selectedBoxOption;
        widget.formKey?.currentState
            ?.patchValue({widget.name: selectedBoxOption?.text});
      });

      if (widget.onChange != null) {
        widget.onChange!(selectedBoxOption);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: showItemList,
        child: AbsorbPointer(
          child: ATextField(
            name: widget.name,
            hintText: widget.hintText,
            labelText: widget.labelText,
            errorText: widget.errorText,
            focusNode: widget.focusNode,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            isEnabled: widget.isEnabled,
            isRequired: widget.isRequired,
            onValidate: widget.onValidate,
            onSaved: widget.onSaved,
            onChange: widget.onSaved,
          ),
        ));
  }
}
