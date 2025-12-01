import 'package:flutter/material.dart';
import 'package:lab_assignment/utils/get_dropdown_countries.dart';
import 'package:lab_assignment/widgets/index.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Form(
            child: Column(
              children: [
                CustomTextField(
                  labelText: 'Name',
                  hintText: 'write your name...',
                ),
                SizedBox(height: 16),
                CustomTextField(
                  labelText: 'Email',
                  hintText: 'write your email...',
                ),
                SizedBox(height: 16),
                CustomTextField(
                  labelText: 'Phone',
                  hintText: 'write your phone...',
                ),
                SizedBox(height: 16),
                CustomTextField(
                  labelText: 'Password',
                  hintText: 'write your password...',
                  type: TextFieldType.password,
                ),
                SizedBox(height: 16),
                DropdownMenu(
                  dropdownMenuEntries: getDropdownCountries(),
                  label: Text('Country'),
                  hintText: 'Select a country',
                  width: double.infinity,
                  menuHeight: 200,
                ),
                SizedBox(height: 24),
                RadioInput(
                  label: 'Gender',
                  options: [
                    RadioOption(label: 'Male', value: 'male'),
                    RadioOption(label: 'Female', value: 'female'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
