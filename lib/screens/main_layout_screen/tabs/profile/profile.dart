import 'package:evently/providers/theme_provider.dart';
import 'package:evently/routes/app_routes.dart';
import 'package:evently/screens/main_layout_screen/tabs/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: CustomFab(),
      body: Padding(
        padding: const EdgeInsets.only(top: 80, right: 16, left: 16),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                currentUser!.photoURL ??
                    "https://www.pngfind.com/pngs/m/610-6104451_image-placeholder-png-user-profile-placeholder-image-png.png",
              ),

              radius: 80,
            ),
            SizedBox(height: 16),
            Text(
              currentUser!.displayName ?? " ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: .w600,
                color: theme.textTheme.bodyLarge!.color,
              ),
              textAlign: .center,
            ),
            SizedBox(height: 4),
            Text(
              currentUser.email ?? " ",
              style: TextStyle(
                fontSize: 14,
                fontWeight: .w400,
                color: theme.textTheme.bodyMedium!.color,
              ),
              textAlign: .center,
            ),
            SizedBox(height: 32),
            ProfileContainer(label: "Dark Mode", widget: ThemeToggleSwitch()),
            SizedBox(height: 16),
            ProfileContainer(
              label: "Language",
              widget: LanguageContainerButton(),
            ),
            SizedBox(height: 16),
            ProfileContainer(
              label: "Logout",
              widget: LogoutButton(currentuser: currentUser),
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, required this.currentuser});
  final User currentuser;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton(
      onPressed: () {
        currentuser.delete();
        Navigator.pushReplacementNamed(context, AppRoutes.authScreen);
      },
      icon: Icon(Icons.logout_rounded, color: theme.colorScheme.error),
    );
  }
}

class LanguageContainerButton extends StatelessWidget {
  const LanguageContainerButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton(
      onPressed: () {
        //TOD0  show bottomsheet to select lang
      },
      icon: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 24,
        color: theme.primaryColor,
      ),
    );
  }
}

class ThemeToggleSwitch extends StatefulWidget {
  const ThemeToggleSwitch({super.key});

  @override
  State<ThemeToggleSwitch> createState() => _ThemeToggleSwitchState();
}

class _ThemeToggleSwitchState extends State<ThemeToggleSwitch> {
  @override
  Widget build(BuildContext context) {
    bool isDark = context.read<ThemeProvider>().isDarkMode;
    return CupertinoSwitch(
      value: isDark,
      activeTrackColor: Theme.of(context).primaryColor,
      onChanged: (bool isDark) {
        setState(() {
          context.read<ThemeProvider>().toggleTheme();
        });
      },
    );
  }
}

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,

    required this.label,
    required this.widget,
  });

  final Widget widget;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.dividerColor),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: .w500,
              color: theme.textTheme.bodyLarge!.color,
            ),
          ),
          Spacer(),
          widget,
        ],
      ),
    );
  }
}
