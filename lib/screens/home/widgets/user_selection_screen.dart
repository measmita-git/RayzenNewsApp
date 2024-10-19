import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../model/user.dart';
import 'home_screen.dart';

class UserSelectionScreen extends StatelessWidget {
  const UserSelectionScreen({Key? key}) : super(key: key);

  // Handle user selection and store user ID in SharedPreferences
  void _selectUser(BuildContext context, int userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('userId', userId); // Save selected user ID
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => HomeScreen(userId: userId)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select User'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return GestureDetector(
              onTap: () => _selectUser(context, user.id), // On user selection
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 5,
                shadowColor: Colors.grey.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      // User Avatar
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                      const SizedBox(width: 20),
                      // User Name
                      Text(
                        user.name,
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

