import 'package:logger/logger.dart';
import '../domain/entities/bingo_card.dart';

/// Detects winning patterns on bingo cards
class WinDetector {
  final Logger _logger = Logger();

  /// Check if a card has won with the given pattern
  bool checkWin(BingoCard card, WinPattern pattern) {
    final hasWon = card.checkWin(pattern);
    
    if (hasWon) {
      _logger.i('WIN DETECTED! Pattern: ${pattern.name}, Card: ${card.id}');
    }
    
    return hasWon;
  }

  /// Check all possible win patterns and return which ones are satisfied
  List<WinPattern> getWinningPatterns(BingoCard card) {
    final winningPatterns = <WinPattern>[];

    for (var pattern in WinPattern.values) {
      if (card.checkWin(pattern)) {
        winningPatterns.add(pattern);
      }
    }

    if (winningPatterns.isNotEmpty) {
      _logger.i('Card ${card.id} has ${winningPatterns.length} winning patterns: '
          '${winningPatterns.map((p) => p.name).join(", ")}');
    }

    return winningPatterns;
  }

  /// Get the winning cells for a specific pattern
  List<List<int>> getWinningCells(BingoCard card, WinPattern pattern) {
    final winningCells = <List<int>>[];

    switch (pattern) {
      case WinPattern.anyLine:
        winningCells.addAll(_getAnyLineWinningCells(card));
        break;
      case WinPattern.fullHouse:
        winningCells.addAll(_getFullHouseWinningCells());
        break;
      case WinPattern.twoLines:
        winningCells.addAll(_getTwoLinesWinningCells(card));
        break;
      case WinPattern.fourCorners:
        winningCells.addAll(_getFourCornersWinningCells());
        break;
      case WinPattern.topBottomMiddle:
        winningCells.addAll(_getTopBottomMiddleWinningCells());
        break;
    }

    return winningCells;
  }

  List<List<int>> _getAnyLineWinningCells(BingoCard card) {
    final cells = <List<int>>[];

    // Check horizontal lines
    for (int row = 0; row < 5; row++) {
      if (card.grid[row].every((cell) => cell.isMarked || cell.isFreeSpace)) {
        for (int col = 0; col < 5; col++) {
          cells.add([row, col]);
        }
        break; // Return first winning line
      }
    }

    if (cells.isNotEmpty) return cells;

    // Check vertical lines
    for (int col = 0; col < 5; col++) {
      if (card.grid.every((row) => row[col].isMarked || row[col].isFreeSpace)) {
        for (int row = 0; row < 5; row++) {
          cells.add([row, col]);
        }
        break;
      }
    }

    if (cells.isNotEmpty) return cells;

    // Check diagonal (top-left to bottom-right)
    if (card.grid.asMap().entries.every((entry) {
      final i = entry.key;
      final cell = entry.value[i];
      return cell.isMarked || cell.isFreeSpace;
    })) {
      for (int i = 0; i < 5; i++) {
        cells.add([i, i]);
      }
      return cells;
    }

    // Check diagonal (top-right to bottom-left)
    if (card.grid.asMap().entries.every((entry) {
      final i = entry.key;
      final cell = entry.value[4 - i];
      return cell.isMarked || cell.isFreeSpace;
    })) {
      for (int i = 0; i < 5; i++) {
        cells.add([i, 4 - i]);
      }
    }

    return cells;
  }

  List<List<int>> _getFullHouseWinningCells() {
    final cells = <List<int>>[];
    for (int row = 0; row < 5; row++) {
      for (int col = 0; col < 5; col++) {
        cells.add([row, col]);
      }
    }
    return cells;
  }

  List<List<int>> _getTwoLinesWinningCells(BingoCard card) {
    // Return all cells from the first two winning lines found
    // This is a simplified version
    return _getFullHouseWinningCells();
  }

  List<List<int>> _getFourCornersWinningCells() {
    return [
      [0, 0], // Top-left
      [0, 4], // Top-right
      [4, 0], // Bottom-left
      [4, 4], // Bottom-right
    ];
  }

  List<List<int>> _getTopBottomMiddleWinningCells() {
    final cells = <List<int>>[];
    // Top row
    for (int col = 0; col < 5; col++) {
      cells.add([0, col]);
    }
    // Middle row
    for (int col = 0; col < 5; col++) {
      cells.add([2, col]);
    }
    // Bottom row
    for (int col = 0; col < 5; col++) {
      cells.add([4, col]);
    }
    return cells;
  }

  /// Validate a bingo claim
  /// Returns true if the claim is valid
  bool validateBingoClaim(BingoCard card, WinPattern expectedPattern) {
    final isValid = checkWin(card, expectedPattern);
    
    if (!isValid) {
      _logger.w('Invalid bingo claim! Card: ${card.id}, Pattern: ${expectedPattern.name}');
    }
    
    return isValid;
  }

  /// Get progress towards a win pattern (percentage of cells marked)
  double getProgressTowardsWin(BingoCard card, WinPattern pattern) {
    final totalCells = pattern == WinPattern.fullHouse ? 25 : 5;
    final markedCells = card.grid
        .expand((row) => row)
        .where((cell) => cell.isMarked || cell.isFreeSpace)
        .length;
    
    return (markedCells / totalCells * 100).clamp(0, 100);
  }
}
