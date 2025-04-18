import 'package:codeforces_info/core/utils/rank_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/user_bloc.dart';
import '../../bloc/user_event.dart';
import '../../bloc/user_state.dart';
import '../../data/model/user_model.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Codeforces User Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter Codeforces handle',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final handle = _controller.text.trim();
                if (handle.isNotEmpty) {
                  context.read<UserBloc>().add(FetchUserProfile(handle));
                }
              },
              child: const Text('Fetch User'),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserInitial) {
                    return const Text('Enter a handle to search');
                  } else if (state is UserLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UserLoaded) {
                    return _buildUserInfo(state.user);
                  } else if (state is UserError) {
                    return Text('Error: ${state.message}');
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo(UserModel user) {
    return Center(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (user.titlePhoto != null)
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user.titlePhoto!),
                ),
              const SizedBox(height: 16),
              Text(
                user.handle ?? 'Unknown',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (user.rank != null)
                Text(
                  user.rank!,
                  style: TextStyle(
                    fontSize: 16,
                    color: getRankColor(user.rank),
                  ),
                ),
              const SizedBox(height: 16),
              _buildInfoRow(Icons.star, 'Rating', user.rating?.toString()),
              _buildInfoRow(
                Icons.trending_up,
                'Max Rating',
                user.maxRating?.toString(),
              ),
              _buildInfoRow(Icons.emoji_events, 'Max Rank', user.maxRank),
              _buildInfoRow(Icons.business, 'Organization', user.organization),
              _buildInfoRow(Icons.location_on, 'Country', user.country),
              _buildInfoRow(
                Icons.group,
                'Friends of',
                user.friendOfCount?.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String? value) {
    if (value == null || value.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blueAccent),
          const SizedBox(width: 8),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.w600)),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
