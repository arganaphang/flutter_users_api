import 'package:flutter/material.dart';
import 'package:user_api/model/user.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  maxLines: 1,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  "${user.email} (${user.phone})",
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Container(
              height: 1,
              decoration: BoxDecoration(color: Colors.grey.shade200),
            ),
            const SizedBox(height: 8),
            Text(
              "Address: ${user.address.street}, ${user.address.city}, ${user.address.zipcode}",
              maxLines: 3,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
