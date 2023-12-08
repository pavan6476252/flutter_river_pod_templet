part of '../user_chat_profile.dart';

class ProfileQRPopup extends StatelessWidget {
  const ProfileQRPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GlassMophicEffect(
          child: Container(
            
            padding: const EdgeInsets.all(8),
            child: QrImageView(
              
              data: '1234567890',
              version: QrVersions.auto,
              size: 200.0,
            ),
          ),
        ),
      ],
    );
  }
}
