import 'dart:math';
import 'package:logger/logger.dart';

/// Manages the calling of numbers in a bingo game
class NumberCaller {
  final Logger _logger = Logger();
  final Random _random = Random();
  
  // All possible numbers in 75-ball bingo
  final List<int> _availableNumbers = List.generate(75, (i) => i + 1);
  final List<int> _calledNumbers = [];

  /// Get all called numbers
  List<int> get calledNumbers => List.unmodifiable(_calledNumbers);

  /// Get remaining numbers
  List<int> get remainingNumbers {
    return _availableNumbers.where((n) => !_calledNumbers.contains(n)).toList();
  }

  /// Check if all numbers have been called
  bool get allNumbersCalled => _calledNumbers.length == 75;

  /// Call the next random number
  int? callNextNumber() {
    if (allNumbersCalled) {
      _logger.w('All numbers have been called');
      return null;
    }

    final remaining = remainingNumbers;
    final number = remaining[_random.nextInt(remaining.length)];
    
    _calledNumbers.add(number);
    _logger.i('Number called: $number (${_calledNumbers.length}/75)');
    
    return number;
  }

  /// Call a specific number (for testing or manual control)
  bool callSpecificNumber(int number) {
    if (number < 1 || number > 75) {
      _logger.e('Invalid number: $number');
      return false;
    }

    if (_calledNumbers.contains(number)) {
      _logger.w('Number already called: $number');
      return false;
    }

    _calledNumbers.add(number);
    _logger.i('Number called: $number');
    return true;
  }

  /// Reset the caller for a new game
  void reset() {
    _calledNumbers.clear();
    _logger.i('Number caller reset');
  }

  /// Load previously called numbers (for resuming a game)
  void loadCalledNumbers(List<int> numbers) {
    _calledNumbers.clear();
    _calledNumbers.addAll(numbers);
    _logger.i('Loaded ${numbers.length} called numbers');
  }

  /// Get the last called number
  int? get lastCalledNumber {
    return _calledNumbers.isEmpty ? null : _calledNumbers.last;
  }

  /// Get call history with sequence
  List<MapEntry<int, int>> get callHistory {
    return _calledNumbers.asMap().entries.map((e) {
      return MapEntry(e.key + 1, e.value); // sequence number, actual number
    }).toList();
  }

  /// Check if a number has been called
  bool hasBeenCalled(int number) {
    return _calledNumbers.contains(number);
  }

  /// Get statistics
  Map<String, dynamic> getStatistics() {
    return {
      'totalCalled': _calledNumbers.length,
      'remaining': remainingNumbers.length,
      'percentComplete': (_calledNumbers.length / 75 * 100).toStringAsFixed(1),
      'lastCalled': lastCalledNumber,
    };
  }
}
