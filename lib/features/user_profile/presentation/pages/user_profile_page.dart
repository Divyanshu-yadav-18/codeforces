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
    return Card(
      margin: const EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Handle: ${user.handle}',
              style: const TextStyle(fontSize: 18),
            ),
            if (user.rank != null)
              Text('Rank: ${user.rank}', style: const TextStyle(fontSize: 16)),
            if (user.rating != null)
              Text(
                'Rating: ${user.rating}',
                style: const TextStyle(fontSize: 16),
              ),
            if (user.maxRank != null)
              Text(
                'Max Rank: ${user.maxRank}',
                style: const TextStyle(fontSize: 16),
              ),
            if (user.maxRating != null)
              Text(
                'Max Rating: ${user.maxRating}',
                style: const TextStyle(fontSize: 16),
              ),
            if (user.organization != null)
              Text(
                'Organization: ${user.organization}',
                style: const TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
