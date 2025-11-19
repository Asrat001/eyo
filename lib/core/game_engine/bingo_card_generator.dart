import 'dart:math';
import 'package:uuid/uuid.dart';
import '../domain/entities/bingo_card.dart';

/// Generates valid 75-ball bingo cards (5x5 grid)
/// 
/// Standard 75-ball bingo card rules:
/// - Column B: 1-15
/// - Column I: 16-30
/// - Column N: 31-45 (center is FREE)
/// - Column G: 46-60
/// - Column O: 61-75
class BingoCardGenerator {
  final Random _random = Random();
  final Uuid _uuid = const Uuid();

  /// Generate a new bingo card for a player
  BingoCard generateCard(String playerId) {
    final grid = _generateGrid();
    
    return BingoCard(
      id: _uuid.v4(),
      grid: grid,
      playerId: playerId,
      createdAt: DateTime.now(),
    );
  }

  /// Generate multiple unique cards
  List<BingoCard> generateMultipleCards(String playerId, int count) {
    final cards = <BingoCard>[];
    
    for (int i = 0; i < count; i++) {
      cards.add(generateCard(playerId));
    }
    
    return cards;
  }

  /// Generate the 5x5 grid with proper number distribution
  List<List<BingoCell>> _generateGrid() {
    final grid = <List<BingoCell>>[];

    // Generate numbers for each column
    final columnB = _generateColumnNumbers(1, 15, 5);
    final columnI = _generateColumnNumbers(16, 30, 5);
    final columnN = _generateColumnNumbers(31, 45, 5);
    final columnG = _generateColumnNumbers(46, 60, 5);
    final columnO = _generateColumnNumbers(61, 75, 5);

    // Build rows from columns
    for (int row = 0; row < 5; row++) {
      final rowCells = <BingoCell>[
        BingoCell(number: columnB[row]),
        BingoCell(number: columnI[row]),
        // Center cell (row 2, col 2) is FREE
        row == 2
            ? const BingoCell(number: null, isMarked: true, isFreeSpace: true)
            : BingoCell(number: columnN[row]),
        BingoCell(number: columnG[row]),
        BingoCell(number: columnO[row]),
      ];
      grid.add(rowCells);
    }

    return grid;
  }

  /// Generate unique random numbers for a column
  List<int> _generateColumnNumbers(int min, int max, int count) {
    final numbers = <int>[];
    final available = List.generate(max - min + 1, (i) => min + i);

    // Shuffle and take first 'count' numbers
    available.shuffle(_random);
    numbers.addAll(available.take(count));

    return numbers;
  }

  /// Validate if a card is valid according to bingo rules
  bool validateCard(BingoCard card) {
    if (card.grid.length != 5) return false;

    for (var row in card.grid) {
      if (row.length != 5) return false;
    }

    // Check center is free
    if (!card.grid[2][2].isFreeSpace) return false;

    // Check number ranges for each column
    for (int row = 0; row < 5; row++) {
      // Column B (0): 1-15
      final b = card.grid[row][0].number;
      if (b != null && (b < 1 || b > 15)) return false;

      // Column I (1): 16-30
      final i = card.grid[row][1].number;
      if (i != null && (i < 16 || i > 30)) return false;

      // Column N (2): 31-45 (skip center)
      if (row != 2) {
        final n = card.grid[row][2].number;
        if (n != null && (n < 31 || n > 45)) return false;
      }

      // Column G (3): 46-60
      final g = card.grid[row][3].number;
      if (g != null && (g < 46 || g > 60)) return false;

      // Column O (4): 61-75
      final o = card.grid[row][4].number;
      if (o != null && (o < 61 || o > 75)) return false;
    }

    return true;
  }

  /// Generate a card with specific numbers (for testing)
  BingoCard generateCardWithNumbers(String playerId, List<List<int?>> numbers) {
    if (numbers.length != 5 || numbers.any((row) => row.length != 5)) {
      throw ArgumentError('Numbers must be a 5x5 grid');
    }

    final grid = <List<BingoCell>>[];
    for (int row = 0; row < 5; row++) {
      final rowCells = <BingoCell>[];
      for (int col = 0; col < 5; col++) {
        final number = numbers[row][col];
        final isFree = row == 2 && col == 2;
        rowCells.add(BingoCell(
          number: number,
          isMarked: isFree,
          isFreeSpace: isFree,
        ));
      }
      grid.add(rowCells);
    }

    return BingoCard(
      id: _uuid.v4(),
      grid: grid,
      playerId: playerId,
      createdAt: DateTime.now(),
    );
  }
}
