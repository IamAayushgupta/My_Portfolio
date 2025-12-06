import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_flutter/widgets/contact.dart';
import 'package:portfolio_flutter/widgets/footer.dart';
import 'package:portfolio_flutter/widgets/hero_section.dart';
import 'package:portfolio_flutter/widgets/project.dart';
import 'package:portfolio_flutter/widgets/service.dart';
import 'package:portfolio_flutter/widgets/skill.dart';
import 'package:universal_html/html.dart' as html;

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({Key? key}) : super(key: key);

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  // Theme colors
  static const Color primaryBg = Color(0xFF0F172A);
  static const Color secondaryBg = Color(0xFF1E293B);
  static const Color accentColor = Color(0xFFFF6B5A);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFF94A3B8);

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBg,
      body: Stack(
        children: [
          // Main scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 80), // Space for fixed navbar
                HeroSection(
                  key: _homeKey,
                  onProjectTap: () => _scrollToSection(_contactKey),
                  onResumeTap: _downloadResume,
                ),

                const SkillsStrip(),
                ServicesAboutSection(key: _aboutKey),
                ProjectsSection(key: _projectsKey),
                ContactSection(key: _contactKey),
                const FooterSection(),
              ],
            ),
          ),
          // Fixed Navigation Bar
          NavigationBar(
            onNavigate: (section) {
              switch (section) {
                case 'home':
                  _scrollToSection(_homeKey);
                  break;
                case 'about':
                  _scrollToSection(_aboutKey);
                  break;
                case 'projects':
                  _scrollToSection(_projectsKey);
                  break;
                case 'contact':
                  _scrollToSection(_contactKey);
                  break;
              }
            },
          ),
        ],
      ),
    );
  }
}


class NavigationBar extends StatefulWidget {
  final Function(String) onNavigate;

  const NavigationBar({Key? key, required this.onNavigate}) : super(key: key);

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A).withOpacity(0.95),
        border: const Border(
          bottom: BorderSide(color: Color(0xFF1E293B), width: 1),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              const Text(
                'Aayush Gupta',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              // Desktop Menu
              if (!isMobile)
                Row(
                  children: [
                    _NavItem('Home', () => widget.onNavigate('home')),
                    const SizedBox(width: 32),
                    _NavItem('About', () => widget.onNavigate('about')),
                    const SizedBox(width: 32),
                    _NavItem('Projects', () => widget.onNavigate('projects')),
                    const SizedBox(width: 32),
                    _NavItem('Contact', () => widget.onNavigate('contact')),
                  ],
                )
              else
              // Mobile Menu Button
                IconButton(
                  icon: Icon(_isMenuOpen ? Icons.close : Icons.menu),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      _isMenuOpen = !_isMenuOpen;
                    });
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _NavItem(String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}


Future<void> _downloadResume() async {
  // Make sure this path matches your asset location
  final byteData =
  await rootBundle.load('assets/resume/resume.pdf');

  final blob = html.Blob([byteData.buffer.asUint8List()]);
  final url = html.Url.createObjectUrlFromBlob(blob);

  final anchor = html.AnchorElement(href: url)
    ..setAttribute('download', 'Aayush_Gupta_Resume.pdf')
    ..click();

  html.Url.revokeObjectUrl(url);
}