
import 'package:eyo_bingo/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinInputDialog extends StatefulWidget {
  const PinInputDialog({super.key});

  @override
  State<PinInputDialog> createState() => _PinInputDialogState();
}

class _PinInputDialogState extends State<PinInputDialog> {
  String currentPin = "";
  bool isLoading = false;

  void _submitPin() {
    if (currentPin.length == 4) {
      setState(() {
        isLoading = true;
      });
      
      // Close the bottom sheet
      Navigator.pop(context);
      
      // Navigate to cartela selection with the PIN
      context.push('/cartela-selection/$currentPin');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a 4-digit PIN'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

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
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF2D3748),
              const Color(0xFF1A202C),
            ],
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Handle bar
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Title
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Enter Game PIN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.lightGrey,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Subtitle
              Text(
                'Please enter the 4-digit game PIN to join',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.lightGrey.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 30),
              // PIN Input
              PinCodeTextField(
                appContext: context,
                length: 4,
                onChanged: (value) {
                  setState(() {
                    currentPin = value;
                  });
                },
                onCompleted: (value) {
                  setState(() {
                    currentPin = value;
                  });
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12),
                  fieldHeight: 60,
                  fieldWidth: 55,
                  activeColor: Colors.amber,
                  inactiveColor: Colors.grey.shade700,
                  selectedColor: Colors.amber,
                  activeFillColor: Colors.transparent,
                  inactiveFillColor: Colors.transparent,
                  selectedFillColor: Colors.transparent,
                  borderWidth: 2,
                ),
                keyboardType: TextInputType.number,
                cursorColor: Colors.amber,
                textStyle: TextStyle(
                  color: AppColors.lightGrey,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                enableActiveFill: true,
                autoFocus: true,
              ),
              const SizedBox(height: 30),
              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(color: Colors.grey.shade600),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _submitPin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: isLoading
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                              ),
                            )
                          : const Text(
                              'Continue',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
