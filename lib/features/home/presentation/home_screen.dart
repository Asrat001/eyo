import 'package:eyo_bingo/shared/theme/app_colors.dart';
import 'package:eyo_bingo/shared/ui/home_app_bar.dart';
import 'package:eyo_bingo/shared/ui/pin_input_dialog.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar(),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primary,
                AppColors.secondary,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Feature Cards Row
                Row(
                  children: [
                    Expanded(
                        child: _buildFeatureCard(
                            "Contest",
                            Icons.emoji_events_outlined,
                            Colors.amber.shade600,
                            Colors.amber.shade800)),
                    const SizedBox(width: 12),
                    Expanded(
                        child: _buildFeatureCard(
                            "Spin",
                            Icons.casino_outlined,
                            Colors.purple.shade600,
                            Colors.purple.shade800)),
                    const SizedBox(width: 12),
                    Expanded(
                        child: _buildFeatureCard(
                            "Gifts",
                            Icons.card_giftcard_outlined,
                            Colors.pink.shade600,
                            Colors.pink.shade800)),
                  ],
                ),
                const SizedBox(height: 24),
                // Section Title
                Row(
                  children: [
                    Text(
                      "Live Bingo Games",
                      style: TextStyle(
                          color: AppColors.lightGrey,
                          fontWeight: FontWeight.w800,
                          fontSize: 24,
                          letterSpacing: 0.5),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.circle, size: 8, color: Colors.white),
                          SizedBox(width: 4),
                          Text(
                            "LIVE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Games List
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return _buildNewGameCard(context, index);
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}


Widget _buildFeatureCard(String title, IconData icon, Color startColor, Color endColor) {
  return Container(
    height: 110,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [startColor, endColor],
      ),
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: startColor.withOpacity(0.3),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 40, color: Colors.white),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

// Enhanced Game Card
Widget _buildNewGameCard(BuildContext context, int index) {
  // Demo data - in production this would come from the game model
  final playerCounts = [12, 8, 15, 20, 5];
  final patterns = ["Any Line", "Full House", "Two Lines", "Four Corners", "Any Line"];
  final intervals = ["3.0 s", "2.5 s", "3.5 s", "4.0 s", "3.0 s"];
  final prizes = [500, 1000, 750, 1200, 600];

  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFF2D3748),
          const Color(0xFF1A202C),
        ],
      ),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: Colors.amber.withOpacity(0.3),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    padding: const EdgeInsets.all(16),
    child: Row(
      children: [
        // Game Icon
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.amber.shade600,
                Colors.amber.shade800,
              ],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.grid_on_rounded,
            color: Colors.white,
            size: 32,
          ),
        ),
        const SizedBox(width: 16),
        // Game Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.people_alt_outlined,
                    color: Colors.grey.shade400,
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "${playerCounts[index]} Players",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "NEW",
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(
                    Icons.pattern_outlined,
                    color: Colors.grey.shade400,
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Text(
                    patterns[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightGrey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(
                    Icons.emoji_events,
                    color: Colors.amber,
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      "ETB ${prizes[index]}",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.timer_outlined,
                    color: Colors.grey.shade400,
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Text(
                    intervals[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        // Join Button
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.amber.shade400,
                Colors.amber.shade700,
              ],
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.amber.withOpacity(0.4),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                useRootNavigator: true,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return const PinInputDialog();
                },
              );
            },
            child: Row(
              children: [
                Icon(Icons.login, size: 16, color: Colors.black87),
                SizedBox(width: 6),
                Text(
                  "Join",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
