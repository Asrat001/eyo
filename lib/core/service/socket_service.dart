import 'dart:async';
import 'package:logger/logger.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

/// Socket.IO service for real-time game communication
/// Handles connection, events, and room management
class SocketService {
  static final SocketService _instance = SocketService._internal();
  factory SocketService() => _instance;
  SocketService._internal();

  final Logger _logger = Logger();
  IO.Socket? _socket;
  bool _isConnected = false;
  String? _currentGameId;

  // Event controllers
  final _connectionController = StreamController<bool>.broadcast();
  final _gameEventController =
      StreamController<Map<String, dynamic>>.broadcast();
  final _errorController = StreamController<String>.broadcast();

  // Streams
  Stream<bool> get connectionStream => _connectionController.stream;
  Stream<Map<String, dynamic>> get gameEventStream =>
      _gameEventController.stream;
  Stream<String> get errorStream => _errorController.stream;

  bool get isConnected => _isConnected;
  String? get currentGameId => _currentGameId;

  /// Initialize and connect to Socket.IO server
  Future<void> connect(String serverUrl, {String? token}) async {
    if (_isConnected) {
      _logger.w('Already connected to socket server');
      return;
    }

    try {
      _socket = IO.io(
        serverUrl,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            // .setAuth(token != null ? {'token': token} : null)
            .setReconnectionAttempts(5)
            .setReconnectionDelay(2000)
            .build(),
      );

      _setupEventListeners();
      _socket!.connect();

      _logger.i('Connecting to socket server: $serverUrl');
    } catch (e, stackTrace) {
      _logger.e(
        'Failed to connect to socket server',
        error: e,
        stackTrace: stackTrace,
      );
      _errorController.add('Connection failed: $e');
    }
  }

  /// Setup all event listeners
  void _setupEventListeners() {
    if (_socket == null) return;

    // Connection events
    _socket!.onConnect((_) {
      _isConnected = true;
      _connectionController.add(true);
      _logger.i('✅ Connected to socket server');
    });

    _socket!.onDisconnect((_) {
      _isConnected = false;
      _connectionController.add(false);
      _logger.w('❌ Disconnected from socket server');
    });

    _socket!.onConnectError((error) {
      _logger.e('Connection error: $error');
      _errorController.add('Connection error: $error');
    });

    _socket!.onError((error) {
      _logger.e('Socket error: $error');
      _errorController.add('Socket error: $error');
    });

    // Game events
    _socket!.on('game:started', (data) {
      _logger.i('Game started event received');
      _gameEventController.add({'event': 'game:started', 'data': data});
    });

    _socket!.on('game:updated', (data) {
      _logger.i('Game updated event received');
      _gameEventController.add({'event': 'game:updated', 'data': data});
    });

    _socket!.on('number:called', (data) {
      _logger.i('Number called: ${data['number']}');
      _gameEventController.add({'event': 'number:called', 'data': data});
    });

    _socket!.on('player:joined', (data) {
      _logger.i('Player joined: ${data['playerId']}');
      _gameEventController.add({'event': 'player:joined', 'data': data});
    });

    _socket!.on('player:left', (data) {
      _logger.i('Player left: ${data['playerId']}');
      _gameEventController.add({'event': 'player:left', 'data': data});
    });

    _socket!.on('bingo:claimed', (data) {
      _logger.i('Bingo claimed by: ${data['playerId']}');
      _gameEventController.add({'event': 'bingo:claimed', 'data': data});
    });

    _socket!.on('game:ended', (data) {
      _logger.i('Game ended');
      _gameEventController.add({'event': 'game:ended', 'data': data});
      _currentGameId = null;
    });

    // Number Bingo specific events
    _socket!.on('bingoGameReady', (data) {
      _logger.i('Bingo game ready');
      _gameEventController.add({'event': 'bingoGameReady', 'data': data});
    });

    _socket!.on('bingoGameStarted', (data) {
      _logger.i('Bingo game started');
      _gameEventController.add({'event': 'bingoGameStarted', 'data': data});
    });

    _socket!.on('bingoNumberCalled', (data) {
      _logger.i('Bingo number called: ${data['number']}');
      _gameEventController.add({'event': 'bingoNumberCalled', 'data': data});
    });

    _socket!.on('playerJoinedBingo', (data) {
      _logger.i('Player joined bingo: ${data['playerName']}');
      _gameEventController.add({'event': 'playerJoinedBingo', 'data': data});
    });

    _socket!.on('cardSelected', (data) {
      _logger.i('Card selected: ${data['cardNumber']}');
      _gameEventController.add({'event': 'cardSelected', 'data': data});
    });

    _socket!.on('bingoWinner', (data) {
      _logger.i('Bingo winner announced');
      _gameEventController.add({'event': 'bingoWinner', 'data': data});
    });

    _socket!.on('bingoGamePaused', (data) {
      _logger.i('Bingo game paused');
      _gameEventController.add({'event': 'bingoGamePaused', 'data': data});
    });

    _socket!.on('bingoGameResumed', (data) {
      _logger.i('Bingo game resumed');
      _gameEventController.add({'event': 'bingoGameResumed', 'data': data});
    });

    _socket!.on('bingoGameStopped', (data) {
      _logger.i('Bingo game stopped');
      _gameEventController.add({'event': 'bingoGameStopped', 'data': data});
    });

    _socket!.on('bingoGameCompleted', (data) {
      _logger.i('Bingo game completed');
      _gameEventController.add({'event': 'bingoGameCompleted', 'data': data});
    });

    _socket!.on('error', (data) {
      _logger.e('Server error: $data');
      _errorController.add('Server error: $data');
    });
  }

  /// Join a game room
  void joinGame(String gameId, String playerId) {
    if (!_isConnected || _socket == null) {
      _logger.e('Cannot join game - not connected');
      _errorController.add('Not connected to server');
      return;
    }

    _currentGameId = gameId;
    _socket!.emit('game:join', {'gameId': gameId, 'playerId': playerId});

    _logger.i('Joining game: $gameId');
  }

  /// Join a Number Bingo game room
  void joinGameRoom(String gameId) {
    if (!_isConnected || _socket == null) {
      _logger.e('Cannot join game room - not connected');
      _errorController.add('Not connected to server');
      return;
    }

    _currentGameId = gameId;
    _socket!.emit('joinGameRoom', gameId);
    _logger.i('Joined game room: $gameId');
  }

  /// Leave a Number Bingo game room
  void leaveGameRoom(String gameId) {
    if (_socket == null) return;

    _socket!.emit('leaveGameRoom', gameId);
    _currentGameId = null;
    _logger.i('Left game room: $gameId');
  }

  /// Leave current game
  void leaveGame(String gameId, String playerId) {
    if (_socket == null) return;

    _socket!.emit('game:leave', {'gameId': gameId, 'playerId': playerId});

    _currentGameId = null;
    _logger.i('Left game: $gameId');
  }

  /// Claim bingo
  void claimBingo(String gameId, String playerId) {
    if (!_isConnected || _socket == null) {
      _logger.e('Cannot claim bingo - not connected');
      return;
    }

    _socket!.emit('bingo:claim', {'gameId': gameId, 'playerId': playerId});

    _logger.i('Bingo claimed by: $playerId');
  }

  /// Send a custom event
  void emit(String event, Map<String, dynamic> data) {
    if (!_isConnected || _socket == null) {
      _logger.e('Cannot emit event - not connected');
      return;
    }

    _socket!.emit(event, data);
    _logger.i('Event emitted: $event');
  }

  /// Listen to a custom event
  void on(String event, Function(dynamic) handler) {
    if (_socket == null) return;
    _socket!.on(event, handler);
  }

  /// Remove event listener
  void off(String event) {
    if (_socket == null) return;
    _socket!.off(event);
  }

  /// Disconnect from server
  void disconnect() {
    if (_socket == null) return;

    _socket!.disconnect();
    _socket!.dispose();
    _socket = null;
    _isConnected = false;
    _currentGameId = null;

    _logger.i('Disconnected from socket server');
  }

  /// Dispose resources
  void dispose() {
    disconnect();
    _connectionController.close();
    _gameEventController.close();
    _errorController.close();
  }
}
