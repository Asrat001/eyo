import 'package:equatable/equatable.dart';

/// Represents a single cell in a bingo card
class BingoCell extends Equatable {
  final int? number; // null for FREE space
  final bool isMarked;
  final bool isFreeSpace;

  const BingoCell({
    this.number,
    this.isMarked = false,
    this.isFreeSpace = false,
  });

  BingoCell copyWith({
    int? number,
    bool? isMarked,
    bool? isFreeSpace,
  }) {
    return BingoCell(
      number: number ?? this.number,
      isMarked: isMarked ?? this.isMarked,
      isFreeSpace: isFreeSpace ?? this.isFreeSpace,
    );
  }

  @override
  List<Object?> get props => [number, isMarked, isFreeSpace];
}

/// Represents a 5x5 bingo card
class BingoCard extends Equatable {
  final String id;
  final List<List<BingoCell>> grid; // 5x5 grid
  final String playerId;
  final DateTime createdAt;

  const BingoCard({
    required this.id,
    required this.grid,
    required this.playerId,
    required this.createdAt,
  });

  /// Check if this card has won with the given pattern
  bool checkWin(WinPattern pattern) {
    switch (pattern) {
      case WinPattern.anyLine:
        return _checkAnyLine();
      case WinPattern.fullHouse:
        return _checkFullHouse();
      case WinPattern.twoLines:
        return _checkTwoLines();
      case WinPattern.fourCorners:
        return _checkFourCorners();
      case WinPattern.topBottomMiddle:
        return _checkTopBottomMiddle();
    }
  }

  bool _checkAnyLine() {
    // Check horizontal lines
    for (var row in grid) {
      if (row.every((cell) => cell.isMarked || cell.isFreeSpace)) {
        return true;
      }
    }

    // Check vertical lines
    for (int col = 0; col < 5; col++) {
      if (grid.every((row) => row[col].isMarked || row[col].isFreeSpace)) {
        return true;
      }
    }

    // Check diagonals
    if (grid.asMap().entries.every((entry) {
      final i = entry.key;
      final cell = entry.value[i];
      return cell.isMarked || cell.isFreeSpace;
    })) {
      return true;
    }

    if (grid.asMap().entries.every((entry) {
      final i = entry.key;
      final cell = entry.value[4 - i];
      return cell.isMarked || cell.isFreeSpace;
    })) {
      return true;
    }

    return false;
  }

  bool _checkFullHouse() {
    return grid.every((row) => row.every((cell) => cell.isMarked || cell.isFreeSpace));
  }

  bool _checkTwoLines() {
    int linesCount = 0;

    // Check horizontal lines
    for (var row in grid) {
      if (row.every((cell) => cell.isMarked || cell.isFreeSpace)) {
        linesCount++;
      }
    }

    // Check vertical lines
    for (int col = 0; col < 5; col++) {
      if (grid.every((row) => row[col].isMarked || row[col].isFreeSpace)) {
        linesCount++;
      }
    }

    return linesCount >= 2;
  }

  bool _checkFourCorners() {
    return grid[0][0].isMarked &&
        grid[0][4].isMarked &&
        grid[4][0].isMarked &&
        grid[4][4].isMarked;
  }

  bool _checkTopBottomMiddle() {
    // Top row
    final topLine = grid[0].every((cell) => cell.isMarked || cell.isFreeSpace);
    // Bottom row
    final bottomLine = grid[4].every((cell) => cell.isMarked || cell.isFreeSpace);
    // Middle row
    final middleLine = grid[2].every((cell) => cell.isMarked || cell.isFreeSpace);

    return topLine && bottomLine && middleLine;
  }

  /// Mark a number on the card
  BingoCard markNumber(int number) {
    final newGrid = grid.map((row) {
      return row.map((cell) {
        if (cell.number == number && !cell.isMarked) {
          return cell.copyWith(isMarked: true);
        }
        return cell;
      }).toList();
    }).toList();

    return BingoCard(
      id: id,
      grid: newGrid,
      playerId: playerId,
      createdAt: createdAt,
    );
  }

  @override
  List<Object?> get props => [id, grid, playerId, createdAt];
}

/// Win patterns for bingo
enum WinPattern {
  anyLine, // Any horizontal, vertical, or diagonal line
  fullHouse, // All numbers marked
  twoLines, // Any two lines
  fourCorners, // All four corners
  topBottomMiddle, // Top, bottom, and middle rows
}
