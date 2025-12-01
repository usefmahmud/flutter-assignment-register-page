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
                  controller: nameController,
                ),
                SizedBox(height: 16),
                CustomTextField(
                  labelText: 'Email',
                  hintText: 'write your email...',
                  controller: emailController,
                ),
                SizedBox(height: 16),
                CustomTextField(
                  labelText: 'Phone',
                  hintText: 'write your phone...',
                  controller: phoneController,
                ),
                SizedBox(height: 16),
                CustomTextField(
                  labelText: 'Password',
                  hintText: 'write your password...',
                  type: TextFieldType.password,
                  controller: passwordController,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
