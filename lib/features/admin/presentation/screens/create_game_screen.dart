import 'package:eyo_bingo/features/admin/presentation/providers/admin_providers.dart';
import 'package:eyo_bingo/features/admin/presentation/providers/states/create_game_state.dart';
import 'package:eyo_bingo/features/admin/presentation/widgets/drop_down.dart';
import 'package:eyo_bingo/features/admin/presentation/widgets/input_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Create Game Screen
class CreateGameScreen extends ConsumerStatefulWidget {
  const CreateGameScreen({super.key});

  @override
  ConsumerState<CreateGameScreen> createState() => _CreateGameScreenState();
}

class _CreateGameScreenState extends ConsumerState<CreateGameScreen> {
  final _formKey = GlobalKey<FormState>();
  final _maxPlayersController = TextEditingController(text: '10');
  final _entryFeeController = TextEditingController(text: '10');
  final _profitController = TextEditingController(text: '10');
  final _autoCallIntervalController = TextEditingController(text: '3000');

  @override
  void dispose() {
    _maxPlayersController.dispose();
    _entryFeeController.dispose();
    _profitController.dispose();
    _autoCallIntervalController.dispose();
    super.dispose();
  }

  Future<void> _handleCreateGame({
    required String selectedPattern,
    required String selectedMode,
  }) async {
    ref
        .read(createGameNotifierProvider.notifier)
        .createGame(
          maxPlayers: int.parse(_maxPlayersController.text),
          playerEntryFee: double.parse(_entryFeeController.text),
          profitPercentage: int.parse(_profitController.text),
          autoCallInterval: int.parse(_autoCallIntervalController.text),
          selectedPattern: selectedPattern,
          selectedMode: selectedMode,
        );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createGameNotifierProvider);

    // Listen to state changes for success/error handling
    ref.listen<CreateGameState>(createGameNotifierProvider, (previous, next) {
      if (next.isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Game created successfully!'),
            backgroundColor: Color(0xFF10B981),
            behavior: SnackBarBehavior.floating,
          ),
        );
        ref.read(createGameNotifierProvider.notifier).resetState();
        context.pop();
      } else if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${next.error}'),
            backgroundColor: Color(0xFFEF4444),
            behavior: SnackBarBehavior.floating,
          ),
        );
        ref.read(createGameNotifierProvider.notifier).resetState();
      }
    });

    return Scaffold(
      backgroundColor: Color(0xFF0A0E27),
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            expandedHeight: 140,
            pinned: true,
            backgroundColor: Color(0xFF0A0E27),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => context.pop(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF3B82F6),
                      Color(0xFF2563EB),
                      Color(0xFF0A0E27),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(60, 40, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.add_circle_rounded,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Create New Game',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Configure game settings',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Game Settings Section
                    Text(
                      'GAME SETTINGS',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 16),

                    // Max Players
                    CustomInputField(
                      controller: _maxPlayersController,
                      label: 'Maximum Players',
                      hint: 'Enter max players',
                      icon: Icons.people_rounded,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter max players';
                        }
                        final num = int.tryParse(value);
                        if (num == null || num < 2) {
                          return 'Must be at least 2 players';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    // Entry Fee
                    CustomInputField(
                      controller: _entryFeeController,
                      label: 'Player Entry Fee',
                      hint: 'Enter entry fee',
                      icon: Icons.attach_money_rounded,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter entry fee';
                        }
                        final num = double.tryParse(value);
                        if (num == null || num < 0) {
                          return 'Must be a valid amount';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    // Profit Percentage
                    CustomInputField(
                      controller: _profitController,
                      label: 'Profit Percentage',
                      hint: 'Enter profit %',
                      icon: Icons.percent_rounded,
                      helperText: 'Percentage of winnings kept as profit',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter profit percentage';
                        }
                        final num = int.tryParse(value);
                        if (num == null || num < 0 || num > 100) {
                          return 'Must be between 0 and 100';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    // Auto Call Interval
                    CustomInputField(
                      controller: _autoCallIntervalController,
                      label: 'Auto Call Interval (ms)',
                      hint: 'Enter interval',
                      icon: Icons.timer_rounded,
                      enabled: false,
                      helperText:
                          'Time between number calls (e.g., 3000 = 3 seconds)',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter interval';
                        }
                        final num = int.tryParse(value);
                        if (num == null || num < 1000) {
                          return 'Must be at least 1000ms (1 second)';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 32),

                    // Game Rules Section
                    Text(
                      'GAME RULES',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 16),

                    // Winning Pattern
                    CustomDropDown(
                      label: 'Winning Pattern',
                      value: state.selectedPattern,
                      icon: Icons.pattern_rounded,
                      items: [
                        DropdownItem(
                          'any-line',
                          'Any Line',
                          Icons.horizontal_rule_rounded,
                        ),
                        DropdownItem(
                          'horizontal',
                          'Horizontal Only',
                          Icons.horizontal_rule_rounded,
                        ),
                        DropdownItem(
                          'vertical',
                          'Vertical Only',
                          Icons.more_vert_rounded,
                        ),
                        DropdownItem(
                          'diagonal',
                          'Diagonal Only',
                          Icons.trending_up_rounded,
                        ),
                        DropdownItem(
                          'four-corners',
                          'Four Corners',
                          Icons.crop_square_rounded,
                        ),
                        DropdownItem(
                          'full-house',
                          'Full House',
                          Icons.grid_on_rounded,
                        ),
                      ],
                      onChanged: (value) {
                        ref
                            .read(createGameNotifierProvider.notifier)
                            .setSelectedPattern(value!);
                      },
                    ),
                    SizedBox(height: 16),

                    // Marking Mode
                    CustomDropDown(
                      label: 'Marking Mode',
                      value: state.selectedMode,
                      icon: Icons.touch_app_rounded,
                      items: [
                        DropdownItem(
                          'auto',
                          'Auto Mark',
                          Icons.auto_awesome_rounded,
                        ),
                        DropdownItem(
                          'manual',
                          'Manual Mark',
                          Icons.touch_app_rounded,
                        ),
                      ],
                      onChanged: (value) {
                        ref
                            .read(createGameNotifierProvider.notifier)
                            .setSelectedMode(value!);
                      },
                    ),

                    SizedBox(height: 40),

                    // Create Button
                    Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: state.isLoading
                              ? [
                                  Colors.white.withOpacity(0.3),
                                  Colors.white.withOpacity(0.2),
                                ]
                              : [Color(0xFF3B82F6), Color(0xFF2563EB)],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: state.isLoading
                            ? []
                            : [
                                BoxShadow(
                                  color: Color(0xFF3B82F6).withOpacity(0.3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                ),
                              ],
                      ),
                      child: ElevatedButton(
                        onPressed: state.isLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  _handleCreateGame(
                                    selectedPattern: state.selectedPattern,
                                    selectedMode: state.selectedMode,
                                  );
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: state.isLoading
                            ? SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_circle_rounded,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    'Create Game',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),

                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
