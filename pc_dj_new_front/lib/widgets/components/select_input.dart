import 'package:flutter/material.dart';

class SelectInput extends StatefulWidget {
  Map<String, String> options;
  String currentValue;
  String? label;
  final TextEditingController fieldController;

  SelectInput(
    this.options, {
    required this.currentValue,
    required this.fieldController,
    this.label,
    super.key,
  });
  @override
  State<SelectInput> createState() => _SelectInputState();
}

class _SelectInputState extends State<SelectInput> {
  final List<DropdownMenuEntry<String>> _options =
      <DropdownMenuEntry<String>>[];
  String? _currentValue;

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    widget.options.forEach((k, v) => _options.add(DropdownMenuEntry<String>(
          label: v,
          value: k,
          enabled: widget.currentValue != v,
        )));
    _currentValue = _options.first.value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: DropdownMenu(
        initialSelection: _currentValue,
        label: Text(widget.label!),
        textStyle: TextStyle(color: Colors.black),
        dropdownMenuEntries: _options,
        onSelected: (String? value) {
          setState(() {
            _currentValue = value!;
          });
        },
      ),
    );
  }
}
