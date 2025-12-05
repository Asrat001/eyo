import 'package:eyo_bingo/features/admin/presentation/providers/admin_providers.dart';
import 'package:eyo_bingo/features/admin/presentation/widgets/admin_analytics_card.dart';
import 'package:eyo_bingo/features/admin/presentation/widgets/stat_card.dart';
import 'package:eyo_bingo/features/admin/presentation/widgets/super_admin_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Super Admin Dashboard Home Screen
class SuperAdminHomeScreen extends ConsumerStatefulWidget {
  const SuperAdminHomeScreen({super.key});

  @override
  ConsumerState<SuperAdminHomeScreen> createState() =>
      _SuperAdminHomeScreenState();
}

class _SuperAdminHomeScreenState extends ConsumerState<SuperAdminHomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(superAdminNotifierProvider.notifier).getAnalytics();
    });
  }

  @override
  Widget build(BuildContext context) {
    final analytics = ref.watch(superAdminNotifierProvider);
    final totalAdmins = analytics.analytics?.overall.totalAdmins ?? 0;
    final totalPlayers = analytics.analytics?.overall.totalPlayers ?? 0;
    final totalRevenue = analytics.analytics?.overall.totalRevenue ?? 0;
    final totalProfit = analytics.analytics?.overall.totalProfit ?? 0;
    final activeGames = analytics.analytics?.overall.totalActiveGames ?? 0;
    final totalCredits = analytics.analytics?.overall.totalCreditsInSystem ?? 0;
    final admins = analytics.analytics?.adminAnalytics;

    return Scaffold(
      backgroundColor: Color(0xFF0A0E27),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(superAdminNotifierProvider.notifier).getAnalytics();
        },
        color: Color(0xFF9333EA),
        backgroundColor: Color(0xFF1E293B),
        child: CustomScrollView(
          slivers: [
            // App Bar
            const SuperAdminAppBar(),
            // Content
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // System Overview
                    Text(
                      'SYSTEM OVERVIEW',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    if (analytics.isLoading)
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(40),
                          child: CircularProgressIndicator(
                            color: Color(0xFF9333EA),
                          ),
                        ),
                      )
                    else
                      GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1.22,
                        children: [
                          StatCard(
                            title: 'Total Revenue',
                            value: "$totalRevenue ETB",
                            icon: Icons.money,
                            gradient: [
                              Color.fromARGB(255, 89, 207, 34),
                              Color.fromARGB(255, 96, 173, 7),
                            ],
                          ),
                          StatCard(
                            title: 'Total Profit',
                            value: "$totalProfit ETB",
                            icon: Icons.money,
                            gradient: [
                              Color.fromARGB(255, 72, 191, 238),
                              Color.fromARGB(255, 9, 173, 214),
                            ],
                          ),
                          StatCard(
                            title: 'Total Admins',
                            value: totalAdmins.toString(),
                            icon: Icons.admin_panel_settings_rounded,
                            gradient: [Color(0xFF3B82F6), Color(0xFF2563EB)],
                          ),
                          StatCard(
                            title: 'Total Players',
                            value: totalPlayers.toString(),
                            icon: Icons.people_rounded,
                            gradient: [Color(0xFF10B981), Color(0xFF059669)],
                          ),
                          StatCard(
                            title: 'Active Games',
                            value: activeGames.toString(),
                            icon: Icons.play_circle_rounded,
                            gradient: [Color(0xFFF59E0B), Color(0xFFD97706)],
                          ),
                          StatCard(
                            title: 'Total Credits',
                            value: totalCredits.toString(),
                            icon: Icons.stars_rounded,
                            gradient: [Color(0xFFFBBF24), Color(0xFFF59E0B)],
                          ),
                        ],
                      ),

                    SizedBox(height: 16),

                    // Recent Admins
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ADMINS Performance'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'View All',
                            style: TextStyle(color: Color(0xFF9333EA)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    if (admins == null)
                      Container(
                        padding: EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: Color(0xFF1E293B),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.05),
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Icon(
                                Icons.admin_panel_settings_outlined,
                                size: 60,
                                color: Colors.white,
                              ),
                              SizedBox(height: 12),
                              Text(
                                'No admins yet',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: admins.length > 3 ? 3 : admins.length,
                        itemBuilder: (context, index) {
                          final admin = admins[index];
                          return AdminAnalyticsCard(
                            username: admin.username,
                            totalRevenue: admin.combined.totalRevenue,
                            totalProfit: admin.combined.totalProfit,
                            currentCredits: admin.currentCredits,
                            completedGames: admin.combined.completedGames,
                            totalPlayers: admin.combined.totalPlayers,
                            onTap: () {
                           
                            },
                          );
                        },
                      ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
