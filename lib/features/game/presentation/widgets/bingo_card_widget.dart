import 'package:flutter/material.dart';
import '../../../../core/domain/entities/bingo_card.dart';
import '../../../../shared/theme/bingo_colors.dart';
import 'bingo_cell_widget.dart';

/// Complete bingo card widget with 5x5 grid
class BingoCardWidget extends StatelessWidget {
  final BingoCard card;
  final List<List<int>>? winningCells;
  final bool interactive;
  final Function(int row, int col)? onCellTap;

  const BingoCardWidget({
    super.key,
    required this.card,
    this.winningCells,
    this.interactive = false,
    this.onCellTap,
  });

  bool _isWinningCell(int row, int col) {
    if (winningCells == null) return false;
    return winningCells!.any((cell) => cell[0] == row && cell[1] == col);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: BingoColors.cardGradient,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: BingoColors.cardBorder,
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: BingoColors.primaryGold.withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // BINGO Header
          _buildHeader(),
          // Card Grid
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: AspectRatio(
              aspectRatio: 1.37,
              child: _buildGrid(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            BingoColors.primaryGold,
            BingoColors.accentAmber,
          ],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildHeaderLetter('B', BingoColors.ballB),
          _buildHeaderLetter('I', BingoColors.ballI),
          _buildHeaderLetter('N', BingoColors.ballN),
          _buildHeaderLetter('G', BingoColors.ballG),
          _buildHeaderLetter('O', BingoColors.ballO),
        ],
      ),
    );
  }

  Widget _buildHeaderLetter(String letter, Color color) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          letter,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black45,
                offset: Offset(1, 1),
                blurRadius: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 1.39
      ),
      itemCount: 25,
      itemBuilder: (context, index) {
        final row = index ~/ 5;
        final col = index % 5;
        final cell = card.grid[row][col];

        return BingoCellWidget(
          cell: cell,
          isWinningCell: _isWinningCell(row, col),
          onTap: interactive && onCellTap != null
              ? () => onCellTap!(row, col)
              : null,
        );
      },
    );
  }
}
