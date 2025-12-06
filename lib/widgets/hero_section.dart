import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onProjectTap;
  final VoidCallback onResumeTap;

  const HeroSection({
    Key? key,
    required this.onProjectTap,
    required this.onResumeTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 40 : 80,
      ),
      child: isMobile
          ? Column(
        children: [
          _buildProfileImage(),
          const SizedBox(height: 40),
          _buildHeroText(isMobile),
        ],
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: _buildHeroText(isMobile)),
          const SizedBox(width: 80),
          _buildProfileImage(),
        ],
      ),
    );
  }

  Widget _buildHeroText(bool isMobile) {
    return Column(
      crossAxisAlignment:
      isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Hello.',
          style: TextStyle(
            fontSize: isMobile ? 48 : 72,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "I'm Aayush",
          style: TextStyle(
            fontSize: isMobile ? 40 : 56,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Flutter Developer',
          style: TextStyle(
            fontSize: isMobile ? 36 : 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'I design and build fast, scalable mobile apps using Flutter.',
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: const Color(0xFF94A3B8),
            height: 1.6,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment:
          isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _ActionButton(
              'Got a project?',
              const Color(0xFFFF6B5A),
              Colors.white,
              onTap: onProjectTap,
            ),
            _ActionButton(
              'My resume',
              Colors.transparent,
              Colors.white,
              borderColor: Colors.white,
              onTap: onResumeTap,
            ),

          ],
        ),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Container(
        width: 350,
        height: 350,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFFFF6B5A),
            width: 4,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFF6B5A).withOpacity(0.3),
              blurRadius: 40,
              spreadRadius: 10,
            ),
          ],
        ),
        child: ClipOval(
          child: Image.asset(
            'assets/images/profile.jpg',
            fit: BoxFit.contain,
            width: 350,
            height: 350,
          ),
        )
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final Color? borderColor;
  final VoidCallback? onTap;

  const _ActionButton(
      this.text,
      this.bgColor,
      this.textColor, {
        this.borderColor,
        this.onTap,
      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: borderColor != null
              ? BorderSide(color: borderColor!, width: 2)
              : BorderSide.none,
        ),
        elevation: 0,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}