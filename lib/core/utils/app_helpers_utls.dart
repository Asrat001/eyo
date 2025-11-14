
import 'package:flutter/material.dart';


class AppHelpers {
  AppHelpers._();

  // Network connection toast
  static showNoConnectionSnackBar(BuildContext context) {
    _showCustomToast(
      context: context,
      message: 'No internet connection',
      backgroundColor: Colors.amber.shade800,
      textColor: Colors.white,
      icon: Icons.wifi_off_rounded,
    );
  }

  // Success toast
  static showSuccessToast(BuildContext context, String message) {
    _showCustomToast(
      context: context,
      message: message,
      backgroundColor: Colors.green.shade800,
      textColor: Colors.white,
      icon: Icons.check_circle_outline_rounded,
    );
  }

  // Error toast
  static showErrorToast(BuildContext context, String message) {
    _showCustomToast(
      context: context,
      message: message,
      backgroundColor: Colors.red.shade800,
      textColor: Colors.white,
      icon: Icons.error_outline_rounded,
    );
  }

  // Info toast
  static showInfoToast(BuildContext context, String message) {
    _showCustomToast(
      context: context,
      message: message,
      backgroundColor: Colors.blue.shade800,
      textColor: Colors.white,
      icon: Icons.info_outline_rounded,
    );
  }

  // Warning toast
  static showWarningToast(BuildContext context, String message) {
    _showCustomToast(
      context: context,
      message: message,
      backgroundColor: Colors.orange.shade800,
      textColor: Colors.white,
      icon: Icons.warning_amber_rounded,
    );
  }

  // Loading toast
  static showLoadingToast(BuildContext context, String message) {
    _showCustomToast(
      context: context,
      message: message,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      icon: Icons.hourglass_top_rounded,
    );
  }

  // For backward compatibility
  static showCheckFlash(BuildContext context, String text) {
    showSuccessToast(context, text);
  }

  static showErrorFlash(BuildContext context, String text) {
    showErrorToast(context, text);
  }

  // Helper method to show custom toast
  static void _showCustomToast({
    required BuildContext context,
    required String message,
    required Color backgroundColor,
    required Color textColor,
    required IconData icon,
  }) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.clearSnackBars();

    scaffold.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: textColor),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: textColor),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'DISMISS',
          textColor: textColor.withOpacity(0.8),
          onPressed: () => scaffold.hideCurrentSnackBar(),
        ),
      ),
    );
  }

  // Add this method to your AppHelpers class
  static void dismissKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  // Dismiss keyboard when user taps outside of text fields
  static void dismissKeyboardOnTap(BuildContext context) {
    GestureDetector(
      onTap: () {
        dismissKeyboard(context);
      },
      child: Container(
        color: Colors.transparent,
        child: ModalRoute.of(context)?.settings.arguments as Widget,
      ),
    );
  }

  // Dismiss keyboard when user finishes editing
  static void dismissKeyboardWhenFinished(BuildContext context) {
    // This can be called in onEditingComplete or onSubmitted callbacks
    dismissKeyboard(context);
  }

  static void showVerificationSnackBar(BuildContext context, String message, {bool isError = false}) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.clearSnackBars();

    scaffold.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: isError ? Colors.white : Colors.black87),
        ),
        backgroundColor: isError ? Colors.red[400] : Colors.green[400],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}


class Address {
  final String? street;
  final String? city;
  final String? state;
  final String? zipCode;
  final String? fullAddress;

  Address({
    this.street,
    this.city,
    this.state,
    this.zipCode,
    this.fullAddress,
  });

  static Address parseAddress(String? fullAddress) {
    if (fullAddress == null || fullAddress.isEmpty) {
      return Address();
    }

    try {
      // Remove any extra whitespace and split by comma
      final parts = fullAddress.trim().split(',');

      // Handle the street address (first part)
      final street = parts[0].trim();

      if (parts.length < 2) {
        return Address(
          street: street,
          fullAddress: fullAddress,
        );
      }

      // Handle the city, state, and zip (second part)
      final locationParts = parts[1].trim().split(' ');

      if (locationParts.length < 2) {
        return Address(
          street: street,
          fullAddress: fullAddress,
        );
      }

      // The zip code will be the last element
      final zipCode = locationParts.last.trim();

      // The state will be the second-to-last element
      final state = locationParts[locationParts.length - 2].trim();

      // The city will be everything else after removing state and zip
      final city = locationParts.sublist(0, locationParts.length - 2).join(' ').trim();

      return Address(
        street: street,
        city: city,
        state: state,
        zipCode: zipCode,
        fullAddress: fullAddress,
      );
    } catch (e) {
      // Return an Address object with only the full address if parsing fails
      return Address(fullAddress: fullAddress);
    }
  }

  @override
  String toString() {
    return 'Address(street: $street, city: $city, state: $state, zipCode: $zipCode)';
  }
}
