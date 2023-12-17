import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberInput extends StatelessWidget {
  const PhoneNumberInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: (value) {},
      //inputBorder: const OutlineInputBorder(),
      inputDecoration: const InputDecoration(
        //border: theme.inputDecorationTheme.border,
        //focusedBorder: theme.inputDecorationTheme.focusedBorder,
        //errorBorder: theme.inputDecorationTheme.errorBorder,
        hintText: "Phone number",
      ),
      spaceBetweenSelectorAndTextField: 5,
    );
    // return const CommonTextField(
    //   prefixIcon: Icon(Icons.phone_enabled_outlined),
    //   keyboardType: TextInputType.phone,
    //   hintText: 'Phone number',
    // );
  }
}
