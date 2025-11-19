import 'package:equatable/equatable.dart';

/// Represents a number that has been called in the game
class CalledNumber extends Equatable {
  final int number;
  final DateTime calledAt;
  final int sequenceNumber; // Order in which it was called (1st, 2nd, 3rd, etc.)

  const CalledNumber({
    required this.number,
    required this.calledAt,
    required this.sequenceNumber,
  });

  @override
  List<Object?> get props => [number, calledAt, sequenceNumber];
}
