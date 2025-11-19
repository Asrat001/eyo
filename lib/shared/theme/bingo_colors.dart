import 'package:flutter/material.dart';

/// Bingo game specific colors for immersive experience
class BingoColors {
  BingoColors._();

  // Primary game colors
  static const Color primaryGold = Color(0xFFFFD700);
  static const Color primaryGoldDark = Color(0xFFB8860B);
  static const Color accentAmber = Color(0xFFFFA500);
  
  // Card colors
  static const Color cardBackground = Color(0xFF1A1A2E);
  static const Color cardBorder = Color(0xFFFFD700);
  static const Color cellBackground = Color(0xFF16213E);
  static const Color cellMarked = Color(0xFF0F3460);
  static const Color cellMarkedBorder = Color(0xFF00D9FF);
  
  // Number ball colors (classic bingo)
  static const Color ballB = Color(0xFF4169E1); // Royal Blue (1-15)
  static const Color ballI = Color(0xFFDC143C); // Crimson (16-30)
  static const Color ballN = Color(0xFFFFFFFF); // White (31-45)
  static const Color ballG = Color(0xFF32CD32); // Lime Green (46-60)
  static const Color ballO = Color(0xFFFFA500); // Orange (61-75)
  
  // Status colors
  static const Color success = Color(0xFF00FF88);
  static const Color warning = Color(0xFFFFAA00);
  static const Color error = Color(0xFFFF3366);
  static const Color info = Color(0xFF00D9FF);
  
  // Background gradients
  static const LinearGradient gameBackground = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0F0F1E),
      Color(0xFF1A1A2E),
      Color(0xFF16213E),
    ],
  );
  
  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF1E1E3F),
      Color(0xFF16213E),
    ],
  );
  
  static const LinearGradient winGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFD700),
      Color(0xFFFFA500),
      Color(0xFFFF6B35),
    ],
  );

  // Get color for ball number
  static Color getBallColor(int number) {
    if (number >= 1 && number <= 15) return ballB;
    if (number >= 16 && number <= 30) return ballI;
    if (number >= 31 && number <= 45) return ballN;
    if (number >= 46 && number <= 60) return ballG;
    if (number >= 61 && number <= 75) return ballO;
    return Colors.grey;
  }

  // Get letter for ball number
  static String getBallLetter(int number) {
    if (number >= 1 && number <= 15) return 'B';
    if (number >= 16 && number <= 30) return 'I';
    if (number >= 31 && number <= 45) return 'N';
    if (number >= 46 && number <= 60) return 'G';
    if (number >= 61 && number <= 75) return 'O';
    return '';
  }
}
