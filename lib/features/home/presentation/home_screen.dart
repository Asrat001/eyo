import 'package:eyo_bingo/shared/theme/app_colors.dart';
import 'package:eyo_bingo/shared/ui/home_app_bar.dart';
import 'package:eyo_bingo/shared/ui/pin_input_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      child: _buildFeatureCard(
                          "Contest",
                          SvgPicture.network(
                            "https://www.svgrepo.com/show/422155/banknote-cash-cheque.svg",
                            width: 50,
                            height: 50,
                          ))),
                  const SizedBox(width: 16),
                  Expanded(
                      child: _buildFeatureCard(
                          "Spin",
                          SvgPicture.network(
                            "https://www.svgrepo.com/show/422158/casino-game-leisure.svg",
                            width: 50,
                            height: 50,
                          ))),
                  const SizedBox(width: 16),
                  Expanded(
                      child: _buildFeatureCard(
                          "Gifts",
                          SvgPicture.network(
                            "https://www.svgrepo.com/show/422162/bet-casino-gamble-2.svg",
                            width: 50,
                            height: 50,
                          ))),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                "Bingo's",
                style: TextStyle(
                    color: AppColors.lightGrey,
                    fontWeight: FontWeight.w700,
                    fontSize: 28),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return _buildNewGameCard(context);
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 6),
                ),
              )
            ],
          ),
        ));
  }
}

Widget _buildFeatureCard(String title, Widget icon, [String? badge]) {
  return Stack(
    children: [
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.amber.shade600,
                Color(0xFF1E293B),
              ]),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 6),
            Text(title,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGrey)),
          ],
        ),
      ),
      if (badge != null)
        Positioned(
          top: 6,
          right: 6,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              badge,
              style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
    ],
  );
}

// The New Game Card (same as earlier)
Widget _buildNewGameCard(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFF1E293B),
      borderRadius: BorderRadius.circular(16),
    ),
    padding: const EdgeInsets.all(12),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SvgPicture.network(
            'https://www.svgrepo.com/show/422179/ball-billiard-championship.svg',
            height: 50,
            width: 50,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 50,
              width: 50,
              color: Colors.grey,
              child: Icon(
                Icons.error,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.people_alt_outlined,
                    color: Colors.grey.shade400,
                    size: 18,
                  ),
                  Text(
                    "12",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.lightGrey),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.pattern_outlined,
                    color: Colors.grey.shade400,
                    size: 18,
                  ),
                  Text(
                    "Any Line",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.lightGrey),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.shutter_speed_outlined,
                    color: Colors.grey.shade400,
                    size: 18,
                  ),
                  Text(
                    "3.0 s",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.lightGrey),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Text("NEW",
              style: TextStyle(
                  fontSize: 8,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
        ),
        const SizedBox(width: 8),
        SizedBox(
          height: 25,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            ),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  useRootNavigator: true,
                  builder: (context) {
                    return const PinInputDialog();
                  });
            },
            child: const Row(
              children: [
                Icon(Icons.circle, size: 6, color: Colors.red),
                SizedBox(width: 6),
                Text(
                  "Join",
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
