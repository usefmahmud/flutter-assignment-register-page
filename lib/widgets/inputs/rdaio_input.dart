import 'package:flutter/material.dart';

class RadioOption {
  final String label;
  final String value;

  const RadioOption({required this.label, required this.value});
}

class RadioInput extends StatefulWidget {
  const RadioInput({
    super.key,
    this.label,
    required this.options,
    this.onChanged,
  });

  final List<RadioOption> options;
  final ValueChanged<String?>? onChanged;
  final String? label;

  @override
  State<RadioInput> createState() => _RadioInputState();
}

class _RadioInputState extends State<RadioInput> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              widget.label!,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        Row(
          children: widget.options.map((option) {
            return Expanded(
              child: Row(
                children: [
                  Radio<String>(
                    value: option.value,
                    groupValue: _selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedValue = value;
                      });
                      widget.onChanged?.call(value);
                    },
                  ),
                  Text(option.label),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
