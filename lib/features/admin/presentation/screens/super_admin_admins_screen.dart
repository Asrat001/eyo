import 'package:eyo_bingo/features/admin/presentation/providers/admin_providers.dart';
import 'package:eyo_bingo/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Super Admin Admins Management Screen
class SuperAdminAdminsScreen extends ConsumerStatefulWidget {
  const SuperAdminAdminsScreen({super.key});

  @override
  ConsumerState<SuperAdminAdminsScreen> createState() =>
      _SuperAdminAdminsScreenState();
}

class _SuperAdminAdminsScreenState
    extends ConsumerState<SuperAdminAdminsScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch admins on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(fetchAdminsActionProvider)();
    });
  }

  void _showManageCreditsBottomSheet(
    String adminId,
    String adminName,
    int currentCredits,
  ) {
    final creditsController = TextEditingController(
      text: currentCredits.toString(),
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle bar
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Title
              Text(
                'Manage Credits',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                adminName,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 24),

              // Current credits display
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.foundation.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.foundation.withOpacity(0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.stars, color: Colors.amber, size: 32),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current Credits',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '$currentCredits',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // New credits input
              TextField(
                controller: creditsController,
                decoration: InputDecoration(
                  labelText: 'New Credits Amount',
                  hintText: 'Enter new credits',
                  prefixIcon: Icon(Icons.edit),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.number,
                autofocus: true,
              ),
              SizedBox(height: 24),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text('Cancel'),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        final newCredits = int.tryParse(creditsController.text);
                        if (newCredits == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Invalid credits amount'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        final setCredits = ref.read(
                          setAdminCreditsActionProvider,
                        );
                        final result = await setCredits(adminId, newCredits);

                        if (!mounted) return;
                        Navigator.pop(context);

                        result.when(
                          success: (_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Credits updated successfully!'),
                              ),
                            );
                            ref.read(fetchAdminsActionProvider)();
                          },
                          failure: (error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Error: $error'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.foundation,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text('Update Credits'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddCreditsBottomSheet(String adminId, String adminName) {
    final creditsController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle bar
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Title
              Row(
                children: [
                  Icon(Icons.add_circle, color: AppColors.foundation, size: 32),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add Credits',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          adminName,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),

              // Credits input
              TextField(
                controller: creditsController,
                decoration: InputDecoration(
                  labelText: 'Credits to Add',
                  hintText: 'Enter amount',
                  prefixIcon: Icon(Icons.stars, color: Colors.amber),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  helperText: 'Credits will be added to current balance',
                ),
                keyboardType: TextInputType.number,
                autofocus: true,
              ),
              SizedBox(height: 24),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text('Cancel'),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        final credits = int.tryParse(creditsController.text);
                        if (credits == null || credits <= 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Invalid credits amount'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        final addCredits = ref.read(
                          addCreditsToAdminActionProvider,
                        );
                        final result = await addCredits(adminId, credits);

                        if (!mounted) return;
                        Navigator.pop(context);

                        result.when(
                          success: (_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Credits added successfully!'),
                              ),
                            );
                            ref.read(fetchAdminsActionProvider)();
                          },
                          failure: (error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Error: $error'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.foundation,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text('Add Credits'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final admins = ref.watch(adminsListProvider);
    final isLoading = ref.watch(adminLoadingProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Admins'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => ref.read(fetchAdminsActionProvider)(),
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : admins.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.admin_panel_settings_outlined,
                    size: 80,
                    color: Colors.white,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No admins found',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: () => ref.read(fetchAdminsActionProvider)(),
              child: ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: admins.length,
                itemBuilder: (context, index) {
                  final admin = admins[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: admin.isSuperAdmin
                            ? Colors.purple
                            : Colors.blue,
                        child: Icon(
                          admin.isSuperAdmin
                              ? Icons.admin_panel_settings
                              : Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        admin.username,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.stars, size: 16, color: Colors.amber),
                              SizedBox(width: 4),
                              Text('Credits: ${admin.credits}'),
                            ],
                          ),
                          if (admin.isSuperAdmin)
                            Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: Chip(
                                label: Text(
                                  'Super Admin',
                                  style: TextStyle(fontSize: 10),
                                ),
                                backgroundColor: Colors.purple.withOpacity(0.2),
                                padding: EdgeInsets.zero,
                              ),
                            ),
                        ],
                      ),
                      trailing: PopupMenuButton(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: ListTile(
                              leading: Icon(Icons.edit),
                              title: Text('Set Credits'),
                              contentPadding: EdgeInsets.zero,
                            ),
                            onTap: () {
                              Future.delayed(Duration.zero, () {
                                _showManageCreditsBottomSheet(
                                  admin.id,
                                  admin.username,
                                  admin.credits,
                                );
                              });
                            },
                          ),
                          PopupMenuItem(
                            child: ListTile(
                              leading: Icon(Icons.add_circle),
                              title: Text('Add Credits'),
                              contentPadding: EdgeInsets.zero,
                            ),
                            onTap: () {
                              Future.delayed(Duration.zero, () {
                                _showAddCreditsBottomSheet(
                                  admin.id,
                                  admin.username,
                                );
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
