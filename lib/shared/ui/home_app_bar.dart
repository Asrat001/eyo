
import 'package:eyo_bingo/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget
    {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Home'),
      centerTitle: true,
      bottom:PreferredSize(preferredSize: Size.fromHeight(100),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildBonusCard(context),
      )
      )
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(200);

}


Widget _buildBonusCard(BuildContext context) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: const Color(0xFF3E2E1E),
      borderRadius: BorderRadius.circular(16),
    ),
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children:  [
            Text("Balance ",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: AppColors.lightGrey)),
            Spacer(),
            Icon(Icons.wallet, color: Colors.amber),
          ],
        ),
        const SizedBox(height: 8),
        const Text("ETB 0.00",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color: AppColors.lightGrey)),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: () {
            context.push("/wallet");
          },
          child: Row(
            children: const [
              Text("Contact Your Admin For Recharge",
                  style: TextStyle(color: Colors.amber, fontSize: 12)),
              SizedBox(width: 6),
              Icon(Icons.arrow_right_alt, color: Colors.amber),
            ],
          ),
        )
      ],
    ),
  );
}
