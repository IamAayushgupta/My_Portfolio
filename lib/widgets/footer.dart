import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFF1E293B), width: 1),
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Aayush Gupta',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Designed with love, all rights reserved for Aayush Gupta.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF94A3B8),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialIcon(
                icon: Icons.code,
                onTap: () {
                  // REPLACE WITH YOUR GITHUB LINK
                  // Launch URL: https://github.com/yourusername
                  _launchURL('https://github.com/IamAayushgupta');
                },
              ),
              const SizedBox(width: 20),
              _SocialIcon(
                icon: Icons.work,
                onTap: () {
                  // REPLACE WITH YOUR LINKEDIN LINK
                  // Launch URL: https://linkedin.com/in/yourusername
                  _launchURL('https://www.linkedin.com/in/aayush-gupta-113277276/');
                },
              ),
              const SizedBox(width: 20),
              _SocialIcon(
                icon: Icons.email,
                onTap: () {
                  // REPLACE WITH YOUR EMAIL
                  // Launch URL: mailto:your.email@example.com
                  _launchURL('mailto:aayush00768@gmail.com');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialIcon({required this.icon, required this.onTap});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: _isHovered
                ? const Color(0xFFFF6B5A)
                : const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isHovered
                  ? const Color(0xFFFF6B5A)
                  : const Color(0xFF334155),
              width: 1,
            ),
          ),
          child: Icon(
            widget.icon,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}


Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}