import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';

/// Service for managing Hive local database
class HiveService {
  static final HiveService _instance = HiveService._internal();
  factory HiveService() => _instance;
  HiveService._internal();

  final Logger _logger = Logger();
  bool _isInitialized = false;

  /// Initialize Hive database
  Future<void> init() async {
    if (_isInitialized) {
      _logger.w('Hive already initialized');
      return;
    }

    try {
      await Hive.initFlutter();
      _logger.i('Hive initialized successfully');
      _isInitialized = true;
    } catch (e, stackTrace) {
      _logger.e('Failed to initialize Hive', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Open a box with the given name
  Future<Box<T>> openBox<T>(String boxName) async {
    try {
      if (Hive.isBoxOpen(boxName)) {
        return Hive.box<T>(boxName);
      }
      return await Hive.openBox<T>(boxName);
    } catch (e, stackTrace) {
      _logger.e('Failed to open box: $boxName', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Close a box
  Future<void> closeBox(String boxName) async {
    try {
      if (Hive.isBoxOpen(boxName)) {
        await Hive.box(boxName).close();
        _logger.i('Box closed: $boxName');
      }
    } catch (e, stackTrace) {
      _logger.e('Failed to close box: $boxName', error: e, stackTrace: stackTrace);
    }
  }

  /// Clear all data from a box
  Future<void> clearBox(String boxName) async {
    try {
      final box = await openBox(boxName);
      await box.clear();
      _logger.i('Box cleared: $boxName');
    } catch (e, stackTrace) {
      _logger.e('Failed to clear box: $boxName', error: e, stackTrace: stackTrace);
    }
  }

  /// Delete a box completely
  Future<void> deleteBox(String boxName) async {
    try {
      await Hive.deleteBoxFromDisk(boxName);
      _logger.i('Box deleted: $boxName');
    } catch (e, stackTrace) {
      _logger.e('Failed to delete box: $boxName', error: e, stackTrace: stackTrace);
    }
  }

  /// Close all boxes and cleanup
  Future<void> dispose() async {
    try {
      await Hive.close();
      _isInitialized = false;
      _logger.i('Hive closed successfully');
    } catch (e, stackTrace) {
      _logger.e('Failed to close Hive', error: e, stackTrace: stackTrace);
    }
  }

  bool get isInitialized => _isInitialized;
}
