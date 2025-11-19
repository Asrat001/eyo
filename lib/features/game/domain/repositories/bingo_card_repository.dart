import '../../../../core/domain/entities/bingo_card.dart';

/// Repository interface for bingo card operations
abstract class BingoCardRepository {
  /// Generate a new bingo card for a player
  Future<BingoCard> generateCard(String playerId, String gameId);

  /// Get player's card for a specific game
  Future<BingoCard?> getPlayerCard(String playerId, String gameId);

  /// Mark a number on the card
  Future<BingoCard> markNumber(String cardId, int number);

  /// Check if card has won with given pattern
  Future<bool> checkWin(String cardId, WinPattern pattern);

  /// Save card locally
  Future<void> saveCardLocally(BingoCard card);

  /// Get locally saved card
  Future<BingoCard?> getLocalCard(String cardId);
}
