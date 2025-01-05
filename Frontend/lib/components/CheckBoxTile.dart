import 'package:flutter/material.dart';

class StatefulCheckboxTile extends StatefulWidget {
  final String title;
  final bool initialValue;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color checkColor;
  final TextStyle? textStyle;

  const StatefulCheckboxTile({
    Key? key,
    required this.title,
    this.initialValue = false,
    required this.onChanged,
    this.activeColor = const Color.fromARGB(255, 5, 5, 5),
    this.checkColor = Colors.white,
    this.textStyle = const TextStyle(color: Colors.black),
  }) : super(key: key);

  @override
  State<StatefulCheckboxTile> createState() => _StatefulCheckboxTileState();
}

class _StatefulCheckboxTileState extends State<StatefulCheckboxTile> {
  late bool _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  void _handleChange(bool? value) {
    setState(() {
      _currentValue = value ?? false;
    });
    widget.onChanged(_currentValue);
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.title,
        style: widget.textStyle,
      ),
      value: _currentValue,
      onChanged: _handleChange,
      activeColor: widget.activeColor,
      checkColor: widget.checkColor,
    );
  }
}
