import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_api/model/user.dart';
import 'package:user_api/model/view_state.dart';
import 'package:user_api/widget/empty_state.dart';
import 'package:user_api/widget/user_card.dart';

import 'user_controller.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: UserController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: _render(controller),
          ),
        );
      },
    );
  }

  Widget _render(UserController controller) {
    return switch (controller.state.value) {
      ViewState.loading => const Center(child: CircularProgressIndicator()),
      ViewState.success => controller.users.isNotEmpty
          ? _list(controller.users, controller.refreshUser)
          : const EmptyState(),
      ViewState.failed => const Center(child: Text("Error")),
      _ => const SizedBox()
    };
  }

  Widget _list(List<User> users, Function refresh) {
    return RefreshIndicator(
      onRefresh: () async {
        refresh();
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, idx) {
                  return UserCard(user: users[idx]);
                },
                separatorBuilder: (ctx, idx) {
                  return const SizedBox(height: 16);
                },
                itemCount: users.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
