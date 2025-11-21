import 'package:eyo_bingo/features/auth/presentation/providers/auth_providers.dart';
import 'package:eyo_bingo/shared/routes/route_names.dart';
import 'package:eyo_bingo/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      backgroundColor: Color(0xFF0A0E27),
      body: user == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_off, size: 80, color: Colors.white),
                  SizedBox(height: 16),
                  Text(
                    'No user data',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => context.go(Routes.loginRouteName),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.foundation,
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                    child: Text('Login', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            )
          : CustomScrollView(
              slivers: [
                // App Bar with gradient
                SliverAppBar(
                  expandedHeight: 200,
                  pinned: true,
                  backgroundColor: AppColors.primary,
                 systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
              ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.foundation,
                            AppColors.foundation.withOpacity(0.6),
                            Color(0xFF0A0E27),
                          ],
                        ),
                      ),
                      child: SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 40),
                            // Avatar with glow effect
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.foundation.withOpacity(
                                      0.5,
                                    ),
                                    blurRadius: 30,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: user.isSuperAdmin
                                    ? Color(0xFF9333EA)
                                    : user.isAdmin
                                    ? Color(0xFF3B82F6)
                                    : AppColors.foundation,
                                child: Icon(
                                  user.isSuperAdmin
                                      ? Icons.admin_panel_settings
                                      : user.isAdmin
                                      ? Icons.shield
                                      : Icons.person,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              user.username,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 6),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: user.isSuperAdmin
                                    ? Color(0xFF9333EA).withOpacity(0.2)
                                    : user.isAdmin
                                    ? Color(0xFF3B82F6).withOpacity(0.2)
                                    : AppColors.foundation.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: user.isSuperAdmin
                                      ? Color(0xFF9333EA)
                                      : user.isAdmin
                                      ? Color(0xFF3B82F6)
                                      : AppColors.foundation,
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                user.isSuperAdmin
                                    ? 'SUPER ADMIN'
                                    : user.isAdmin
                                    ? 'ADMIN'
                                    : 'PLAYER',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                          
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Content
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Balance Card
                        Container(
                          padding: EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.1),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: user.isAdmin || user.isSuperAdmin
                                        ? [Color(0xFFFBBF24), Color(0xFFF59E0B)]
                                        : [
                                            Color(0xFF10B981),
                                            Color(0xFF059669),
                                          ],
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Icon(
                                  user.isAdmin || user.isSuperAdmin
                                      ? Icons.stars_rounded
                                      : Icons.account_balance_wallet_rounded,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user.isAdmin || user.isSuperAdmin
                                          ? 'Credits'
                                          : 'Wallet Balance',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      user.isAdmin || user.isSuperAdmin
                                          ? '${user.credits}'
                                          : '\$${user.wallet.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 24),

                        // Account Details
                        Text(
                          'ACCOUNT DETAILS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        SizedBox(height: 12),

                        _buildInfoTile(
                          icon: Icons.person_outline,
                          label: 'Username',
                          value: user.username,
                          color: Color(0xFF3B82F6),
                        ),
                        SizedBox(height: 12),
                        _buildInfoTile(
                          icon: Icons.fingerprint,
                          label: 'User ID',
                          value: user.id.substring(0, 8) + '...',
                          color: Color(0xFF8B5CF6),
                        ),

                        SizedBox(height: 24),

                        // Quick Actions
                        Text(
                          'QUICK ACTIONS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        SizedBox(height: 12),

                        if (!user.isAdmin && !user.isSuperAdmin) ...[
                          _buildActionTile(
                            icon: Icons.history_rounded,
                            title: 'Game History',
                            subtitle: 'View your past games',
                            color: Color(0xFF06B6D4),
                            onTap: () {},
                          ),
                          SizedBox(height: 12),
                          _buildActionTile(
                            icon: Icons.account_balance_wallet_rounded,
                            title: 'Wallet History',
                            subtitle: 'View transactions',
                            color: Color(0xFF10B981),
                            onTap: () => context.push('/wallet'),
                          ),
                          SizedBox(height: 12),
                        ],

                        _buildActionTile(
                          icon: Icons.settings_rounded,
                          title: 'Settings',
                          subtitle: 'Manage preferences',
                          color: Color(0xFF6366F1),
                          onTap: () {},
                        ),
                        SizedBox(height: 12),
                        _buildActionTile(
                          icon: Icons.help_outline_rounded,
                          title: 'Help & Support',
                          subtitle: 'Get assistance',
                          color: Color(0xFFF59E0B),
                          onTap: () {},
                        ),

                        SizedBox(height: 32),

                        // Logout Button
                        Container(
                          width: double.infinity,
                          height: 56,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFEF4444), Color(0xFFDC2626)],
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFEF4444).withOpacity(0.3),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              final confirm = await showDialog<bool>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: Color(0xFF1E293B),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  title: Text(
                                    'Logout',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  content: Text(
                                    'Are you sure you want to logout?',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, false),
                                      child: Text('Cancel'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () =>
                                          Navigator.pop(context, true),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFFEF4444),
                                      ),
                                      child: Text('Logout'),
                                    ),
                                  ],
                                ),
                              );

                              if (confirm == true) {
                                final logout = ref.read(logoutActionProvider);
                                await logout();
                                if (context.mounted) {
                                  context.go(Routes.loginRouteName);
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.logout_rounded, color: Colors.white),
                                SizedBox(width: 12),
                                Text(
                                  'Logout',
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
              ],
            ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.05), width: 1),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color, color.withOpacity(0.7)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
