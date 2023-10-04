import 'package:flutter/material.dart';

class SelectInput extends StatelessWidget {
  final Map<String, String> options;
  final String? currentValue;
  final String? label;
  final Function(String) onSelectedCallback;

  SelectInput(
    this.options, {
    required this.currentValue,
    required this.onSelectedCallback,
    this.label,
    super.key,
  });

  final List<DropdownMenuEntry<String>> _options =
      <DropdownMenuEntry<String>>[];


@override
  Widget build(BuildContext context) {
    options.forEach((k, v) => _options.add(DropdownMenuEntry<String>(
      label: v,
      value: k,
      enabled: currentValue != v,
    )));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: DropdownMenu(
        initialSelection: _options.first.value,
        label: Text(label!),
        textStyle: TextStyle(color: Colors.black),
        dropdownMenuEntries: _options,
        onSelected: (String? value) {
          onSelectedCallback(value!);
        },
      ),
    );
  }
}

