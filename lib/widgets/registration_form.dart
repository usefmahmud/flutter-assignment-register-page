import 'package:flutter/material.dart';
import 'package:lab_assignment/utils/form_validators.dart';
import 'package:lab_assignment/utils/get_dropdown_countries.dart';
import 'package:lab_assignment/widgets/form_action_buttonts.dart';
import 'package:lab_assignment/widgets/index.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? selectedCountry;
  String? selectedGender;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    selectedCountry = null;
    selectedGender = null;
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (selectedCountry == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Please select a country')));
        return;
      }
      if (selectedGender == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Please select a gender')));
        return;
      }

      // Show popup with all details
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Registration Details'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Name: ${nameController.text}'),
                SizedBox(height: 8),
                Text('Email: ${emailController.text}'),
                SizedBox(height: 8),
                Text('Phone: ${phoneController.text}'),
                SizedBox(height: 8),
                Text('Password: ${passwordController.text}'),
                SizedBox(height: 8),
                Text(
                  'Country: ${getDropdownCountries().firstWhere((entry) => entry.value == selectedCountry).label}',
                ),
                SizedBox(height: 8),
                Text('Gender: $selectedGender'),
              ],
            ),

            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          CustomTextField(
            labelText: 'Name',
            hintText: 'write your name...',
            controller: nameController,
            validator: FormValidators().validateNotEmpty('Name').build(),
          ),
          SizedBox(height: 16),
          CustomTextField(
            labelText: 'Email',
            hintText: 'write your email...',
            controller: emailController,
            validator: FormValidators()
                .validateNotEmpty('Email')
                .validateIsEmail()
                .build(),
          ),
          SizedBox(height: 16),
          CustomTextField(
            labelText: 'Phone',
            hintText: 'write your phone...',
            controller: phoneController,
            validator: FormValidators()
                .validateNotEmpty('Phone')
                .validateIsPhone()
                .build(),
          ),
          SizedBox(height: 16),
          CustomTextField(
            labelText: 'Password',
            hintText: 'write your password...',
            type: TextFieldType.password,
            controller: passwordController,
            validator: FormValidators()
                .validateNotEmpty('Password')
                .validateMinLength(8)
                .build(),
          ),
          SizedBox(height: 16),
          DropdownMenu(
            dropdownMenuEntries: getDropdownCountries(),
            label: Text('Country'),
            hintText: 'Select a country',
            width: double.infinity,
            menuHeight: 200,
            onSelected: (value) {
              setState(() {
                selectedCountry = value;
              });
            },
          ),
          SizedBox(height: 24),
          RadioInput(
            label: 'Gender',
            options: [
              RadioOption(label: 'Male', value: 'male'),
              RadioOption(label: 'Female', value: 'female'),
            ],
            onChanged: (value) => {
              setState(() {
                selectedGender = value;
              }),
            },
          ),
          SizedBox(height: 32),
          FormActionButtons(
            onSubmit: _submitForm,
            onGuestLogin: () {
              print('Login as Guest');
            },
            onLogin: () {
              print('Navigate to Login');
            },
          ),
        ],
      ),
    );
  }
}
