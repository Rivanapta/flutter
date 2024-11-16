import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_wiseword_x_postlist/auth/auth.dart';
import 'package:flutter_login_wiseword_x_postlist/wise_sword.dart';  // Import WiseWordPage
import 'package:flutter_login_wiseword_x_postlist/post_list/view/post_list_page.dart';  // Import PostListPage

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text(
          'Welcome to the App',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: ListView(
          children: [
            // Greeting message with user's name and balance
            Builder(
              builder: (context) {
                final user = context.select(
                  (AuthCubit auth) => auth.state.user,
                );
                return Text(
                  'Hello, ${user?.name ?? 'User'}!',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                );
              },
            ),
            const SizedBox(height: 20),

            // User information card with name and balance
            Builder(
              builder: (context) {
                final user = context.select(
                  (AuthCubit auth) => auth.state.user,
                );
                return Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.only(bottom: 24),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User ID: ${user?.id ?? 'N/A'}',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Name: ${user?.name ?? 'N/A'}',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Your Balance: Rp. ${user?.balance ?? '0'}',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.green[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // Buttons for "Wise Word" and "Post List"
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AnimatedButton(
                        label: 'Wise Word',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const WiseWordPage()),  // Navigate to Wise Word page
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: AnimatedButton(
                        label: 'Post List',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PostListPage()),  // Navigate to Post List page
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),

            // Logout Button with fresh styling
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  context.read<AuthCubit>().logout();
                },
                child: const Text("Logout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: Colors.black.withOpacity(0.15),
                  elevation: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const AnimatedButton({required this.label, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16.0), backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: Colors.black.withOpacity(0.2),
        elevation: 5,
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
