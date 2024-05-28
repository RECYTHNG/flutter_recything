import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/widgets/global_text_field_custom_widget.dart';

class DatePickerWidget extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;

  const DatePickerWidget({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
  });

  @override
  DatePickerWidgetState createState() => DatePickerWidgetState();
}

class DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? selectedDate;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorConstant.primaryColor500,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            dialogTheme: const DialogTheme(shape: BeveledRectangleBorder()),
            dialogBackgroundColor: ColorConstant.primaryColor500,
          ),
          child: DatePickerDialog(
            initialDate: selectedDate ?? DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          ),
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _controller.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: CustomTextFieldWidget(
          label: widget.label,
          hint: widget.hint,
          controller: _controller,
          suffixIconButton: IconButton(
            onPressed: () {},
            icon: Icon(Icons.calendar_month_outlined),
          ),
          isInputForPassword: true,
        ),
      ),
    );
  }
}
