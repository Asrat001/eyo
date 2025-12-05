import 'package:eyo_bingo/features/admin/presentation/providers/admin_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminDetailScreen extends ConsumerStatefulWidget {
  const AdminDetailScreen({super.key, required this.adminId});
  final String adminId;

  @override
  ConsumerState<AdminDetailScreen> createState() => _AdminDetailScreenState();
}

class _AdminDetailScreenState extends ConsumerState<AdminDetailScreen> {

 @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(adminDetailNotifierProvider.notifier).getAdminDetail(widget.adminId);
    });
  }



  @override
  Widget build(BuildContext context) {
    final adminDetailState = ref.watch(adminDetailNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Details'),
      ),
      body:LayoutBuilder(builder: (context,constraints){
        return SingleChildScrollView(
          child: Column(
            children: [
              if (adminDetailState.isLoading)
                const Center(child: CircularProgressIndicator()),
              if (!adminDetailState.isLoading)
                Column(
                  children: [
                    
                  ],
                )
            ],
          ),
        );
      })
    );
  }
}