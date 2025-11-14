
import 'package:eyo_bingo/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinInputDialog extends StatefulWidget {
  const PinInputDialog({super.key});

  @override
  State<PinInputDialog> createState() => _PinInputDialogState();
}

class _PinInputDialogState extends State<PinInputDialog> {
  String currentPin = "";

  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: const Color(0xFF1E293B),
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Container(height: 6,width: 25,decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),),
              ),
              SizedBox(height: 6),
              SizedBox(
                width: double.infinity,
                  child: Text('Enter Pin',textAlign: TextAlign.center, style: TextStyle(color: AppColors.lightGrey,fontSize: 18,fontWeight: FontWeight.bold))),
              const SizedBox(height: 20),
              Text('Please enter your 4 digit pin to continue', style: TextStyle(color: AppColors.lightGrey)),
              const SizedBox(height: 20),
              PinCodeTextField(
                appContext: context,
                length: 4,
                onChanged: (value) {
                  // Not needed if using onCompleted
                },
                onCompleted: (value) {
                  setState(() {
                    currentPin = value;
                  });
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey,
                  selectedColor: Colors.amber,
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel',style: TextStyle(color: Colors.redAccent),),
                  ),
                  TextButton(
                    onPressed: () {
                      if (currentPin.length == 4) {
                        Navigator.pop(context, currentPin);
                      }
                    },
                    child: const Text('Submit',style: TextStyle(color: Colors.green),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
