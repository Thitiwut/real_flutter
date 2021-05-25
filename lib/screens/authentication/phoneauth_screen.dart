import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:legacy_progress_dialog/legacy_progress_dialog.dart';
import 'package:real_flutter/services/phoneauth_service.dart';

class PhoneAuthScreen extends StatefulWidget {
  static const String id = 'phone-auth-screen';

  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  bool validate = false;
  var countryCodeController = TextEditingController(text: '+66');
  var phoneNumberController = TextEditingController();

  PhoneAuthService _service = PhoneAuthService();

  @override
  Widget build(BuildContext context) {
    //Create an instance of ProgressDialog
    ProgressDialog progressDialog = ProgressDialog(
      context: context,
      backgroundColor: Colors.white,
      textColor: Colors.black,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.red.shade200,
              child: Icon(
                CupertinoIcons.person_alt_circle,
                color: Colors.red,
                size: 60,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Enter your phone',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text('We will send confirmation code to your phone',
                style: TextStyle(color: Colors.grey)),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: TextFormField(
                        controller: countryCodeController,
                        enabled: false,
                        decoration: InputDecoration(
                            counterText: '10', labelText: 'Country'))),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 9) {
                        setState(() {
                          validate = true;
                        });
                      }
                      if (value.length < 9) {
                        setState(() {
                          validate = false;
                        });
                      }
                    },
                    autofocus: true,
                    maxLength: 9,
                    keyboardType: TextInputType.phone,
                    controller: phoneNumberController,
                    // onChanged: (value) {
                    //   setState(() {
                    //     counterText = value.length.toString();
                    //   });
                    // },
                    decoration: InputDecoration(
                      labelText: 'Number',
                      hintText: 'Enter your phone number',
                      hintStyle: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: AbsorbPointer(
            absorbing: validate ? false : true,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: validate
                      ? MaterialStateProperty.all(
                          Theme.of(context).primaryColor)
                      : MaterialStateProperty.all(Colors.grey)),
              onPressed: () {
                progressDialog.show();
                String number =
                    '${countryCodeController.text}${phoneNumberController.text}';

                _service.verfifyPhoneNumber(context, number);
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('Next',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
