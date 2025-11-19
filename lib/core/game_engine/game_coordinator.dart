import 'package:logger/logger.dart';
import '../domain/entities/game.dart';
import '../domain/entities/bingo_card.dart';
import 'bingo_card_generator.dart';
import 'number_caller.dart';
import 'win_detector.dart';

/// Coordinates the entire game flow
/// Manages game state, number calling, and win detection
class GameCoordinator {
  final Logger _logger = Logger();
  final BingoCardGenerator _cardGenerator = BingoCardGenerator();
  final WinDetector _winDetector = WinDetector();
  
  NumberCaller? _numberCaller;
  Game? _currentGame;
  final Map<String, BingoCard> _playerCards = {};

  /// Initialize a new game
  void initializeGame(Game game) {
    _currentGame = game;
    _numberCaller = NumberCaller();
    _playerCards.clear();
    
    // Load previously called numbers if resuming
    if (game.calledNumbers.isNotEmpty) {
      _numberCaller!.loadCalledNumbers(game.calledNumbers);
    }
    
    _logger.i('Game initialized: ${game.id}, PIN: ${game.pin}');
  }

  /// Generate a card for a player
  BingoCard generatePlayerCard(String playerId) {
    if (_currentGame == null) {
      throw StateError('No active game');
    }

    final card = _cardGenerator.generateCard(playerId);
    _playerCards[playerId] = card;
    
    _logger.i('Card generated for player: $playerId');
    return card;
  }

  /// Get a player's card
  BingoCard? getPlayerCard(String playerId) {
    return _playerCards[playerId];
  }

  /// Call the next number
  int? callNextNumber() {
    if (_currentGame == null || _numberCaller == null) {
      throw StateError('No active game');
    }

    if (_currentGame!.status != GameStatus.inProgress) {
      _logger.w('Cannot call number - game not in progress');
      return null;
    }

    final number = _numberCaller!.callNextNumber();
    
    if (number != null) {
      // Update all player cards
      _updateAllCards(number);
      
      // Update game state
      _currentGame = _currentGame!.callNumber(number);
    }

    return number;
  }

  /// Update all player cards with the called number
  void _updateAllCards(int number) {
    final updatedCards = <String, BingoCard>{};
    
    _playerCards.forEach((playerId, card) {
      updatedCards[playerId] = card.markNumber(number);
    });
    
    _playerCards.clear();
    _playerCards.addAll(updatedCards);
  }

  /// Check if a player has won
  bool checkPlayerWin(String playerId) {
    if (_currentGame == null) {
      throw StateError('No active game');
    }

    final card = _playerCards[playerId];
    if (card == null) {
      _logger.w('No card found for player: $playerId');
      return false;
    }

    final hasWon = _winDetector.checkWin(card, _currentGame!.winPattern);
    
    if (hasWon) {
      _logger.i('Player $playerId has WON!');
      _currentGame = _currentGame!.finish(playerId);
    }
    
    return hasWon;
  }

  /// Validate a bingo claim
  bool validateBingoClaim(String playerId) {
    if (_currentGame == null) {
      throw StateError('No active game');
    }

    final card = _playerCards[playerId];
    if (card == null) {
      _logger.w('No card found for player: $playerId');
      return false;
    }

    return _winDetector.validateBingoClaim(card, _currentGame!.winPattern);
  }

  /// Get game statistics
  Map<String, dynamic> getGameStatistics() {
    if (_currentGame == null || _numberCaller == null) {
      return {};
    }

    return {
      'gameId': _currentGame!.id,
      'status': _currentGame!.status.name,
      'playerCount': _currentGame!.playerIds.length,
      'calledNumbers': _numberCaller!.calledNumbers,
      'numberStats': _numberCaller!.getStatistics(),
      'winPattern': _currentGame!.winPattern.name,
      'prizePool': _currentGame!.prizePool,
    };
  }

  /// Start the game
  bool startGame() {
    if (_currentGame == null) {
      throw StateError('No active game');
    }

    if (!_currentGame!.canStart) {
      _logger.w('Cannot start game - insufficient players or wrong status');
      return false;
    }

    _currentGame = _currentGame!.start();
    _logger.i('Game started: ${_currentGame!.id}');
    return true;
  }

  /// End the game
  void endGame(String? winnerId) {
    if (_currentGame == null) {
      throw StateError('No active game');
    }

    if (winnerId != null) {
      _currentGame = _currentGame!.finish(winnerId);
    } else {
      _currentGame = _currentGame!.cancel();
    }

    _logger.i('Game ended: ${_currentGame!.id}');
  }

  /// Reset the coordinator
  void reset() {
    _currentGame = null;
    _numberCaller = null;
    _playerCards.clear();
    _logger.i('Game coordinator reset');
  }

  /// Get current game
  Game? get currentGame => _currentGame;

  /// Get all player cards
  Map<String, BingoCard> get playerCards => Map.unmodifiable(_playerCards);

  /// Get called numbers
  List<int> get calledNumbers => _numberCaller?.calledNumbers ?? [];
}
