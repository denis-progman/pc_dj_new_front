import 'package:flutter/material.dart';

class SelectInput extends StatefulWidget {
  Map<String, String> options;
  String currentValue;
  String? label;
  String _currentValue;
  final TextEditingController fieldController;


  SelectInput(this.options, {
    required this.currentValue,
    required this.fieldController,
    this.label, 
    super.key,
    }): _currentValue = currentValue;
  @override
  State<SelectInput> createState() => _SelectInputState();
}

class _SelectInputState extends State<SelectInput> {
  final List<DropdownMenuEntry> _options = <DropdownMenuEntry>[];

  @override
  Widget build(BuildContext context) {
    widget.options.forEach((k, v) => _options.add(DropdownMenuEntry(
          label: k,
          value: v,
          enabled: widget.currentValue != v,
        )));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: DropdownMenu(
        initialSelection: widget.currentValue,
        controller: widget.fieldController,
        label: Text(widget.label!),
        dropdownMenuEntries: _options,
        onSelected: (value) {
          setState(() {
            widget.currentValue = value;
          });
        },
      ),
    );
  }
}
