import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:get/get.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';

// class Login extends StatelessWidget {
//   const Login({super.key});

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red, // Optional: Set error color
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var countryCode;
    var phoneLengthWithCountryCode;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login With Phone Number"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 360,
                child: IntlPhoneField(
                  flagsButtonPadding: const EdgeInsets.all(6),
                  dropdownIconPosition: IconPosition.trailing,
                  controller: _phoneNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                      // borderSide: BorderSide(),
                    ),
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    phoneLengthWithCountryCode = phone.number.length;
                    countryCode = (phone.completeNumber);
                  },
                )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String inputData = _phoneNumberController.text;
                if (phoneLengthWithCountryCode == inputData.length &&
                    inputData.isNum) {
                  print(phoneLengthWithCountryCode);
                  print('phone number is $countryCode');
                } else {
                  showError("invalid Number");
                }
              },
              child: const Text(
                'login',
                textScaler: TextScaler.linear(1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
