import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  static const projects = [
    {
      'title': 'Expense Tracker',
      'tags': ['Flutter', 'State Management', 'Local Storage'],
      'description':
      'A cross-platform personal finance app built with Flutter. Allows users to add daily income and expenses, categorize transactions, and view spending analysis. Uses local storage with Provider for state updates, clean UI, and smooth interactions.',
      'github': 'https://github.com/IamAayushgupta/Expense_tracker.git',
      'demo': 'https://expense-tracker-bs2k.vercel.app/',
      'image': 'assets/images/expense_tracker.png',
    },
    {
      'title': 'Flutter Flights',
      'tags': ['Flutter', 'REST API', 'Animations'],
      'description':
      'A responsive flight search & booking UI with advanced animations and real-time REST API integration. Supports destination lookup, cards, filtering UI, and smooth transitions for an elevated user experience.',
      'github': 'https://github.com/IamAayushgupta/flutter_flights.git',
      'demo': 'https://flutter-flights.vercel.app/',
      'image': 'assets/images/flights.png',
    },
    {
      'title': 'Listapp Application',
      'tags': ['Flutter', 'Firebase', 'Pharmacy App'],
      'description':
      'A production-style medical B2B app for supplier discovery, medicine search, and order placement. Includes Firebase authentication, dynamic product listing, supplier pages, client structured UI, and real-time search features. Developed as a live client requirement.',
      'github': 'https://drive.google.com/file/d/1R28axvd_2152Vsh2E41jwY4u0OyE90r8/view?usp=sharing',
      'demo': 'https://drive.google.com/file/d/1R28axvd_2152Vsh2E41jwY4u0OyE90r8/view?usp=sharing',
      'image': 'assets/images/listapp.png',
    },
    {
      'title': 'Mausam App',
      'tags': ['Flutter', 'OpenWeatherMap API'],
      'description':
      'A modern weather application with real-time forecasting, temperature, humidity, wind, and rainfall metrics. Fetches live data from OpenWeatherMap API and displays dynamic UI updates based on conditions. Includes animated weather visuals.',
      'github': 'https://github.com/IamAayushgupta/flutter_project_mausam.git',
      'demo': 'https://github.com/IamAayushgupta/flutter_project_mausam.git',
      //'image': 'assets/images/mausam.png', // add your asset image here
    },
    {
      'title': 'AI Chatbot',
      'tags': ['Flutter', 'Gemini API'],
      'description':
      'A conversational AI chatbot powered by Gemini integration, capable of contextual responses, intelligent text generation, and personalized query handling. Built with chat UI, message streaming, and real-time state management.',
      'github': 'https://github.com/IamAayushgupta/flutter_project_Aichatbot.git',
      'demo': 'https://github.com/IamAayushgupta/flutter_project_Aichatbot.git',
      'image': 'assets/images/chatbot.jpeg',
    },
  ];


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 1000;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 40 : 80,
      ),
      child: Column(
        children: [
          const Text(
            'Projects',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFFF6B5A),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 60),
          isMobile
              ? Column(
            children: projects
                .map((project) => Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: ProjectCard(project: project),
            ))
                .toList(),
          )
              : Wrap(
            spacing: 32,
            runSpacing: 32,
            children: projects
                .map((project) => SizedBox(
              width: (screenWidth - 160 - 32) / 2,
              child: ProjectCard(project: project),
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovered ? -8 : 0, 0),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? const Color(0xFFFF6B5A)
                : const Color(0xFF334155),
            width: 1,
          ),
          boxShadow: _isHovered
              ? [
            BoxShadow(
              color: const Color(0xFFFF6B5A).withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ]
              : [],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Image Placeholder
              Container(
                height: 180,
                decoration: BoxDecoration(
                  color: const Color(0xFF0F172A),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF334155),
                    width: 1,
                  ),
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      widget.project['image'] ?? 'assets/images/default_project.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.project['title'],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: (widget.project['tags'] as List<String>)
                    .map((tag) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    tag,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                ))
                    .toList(),
              ),
              const SizedBox(height: 16),
              Text(
                widget.project['description'],
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF94A3B8),
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Open GitHub link
                        // Add URL launcher functionality
                        _launchURL(widget.project['github']);
                      },
                      icon: const Icon(Icons.code, size: 18),
                      label: const Text('View GitHub'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF6B5A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Open project demo link
                        _launchURL(widget.project['demo']);
                      },
                      icon: const Icon(Icons.open_in_new, size: 18),
                      label: const Text('View project'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        side: const BorderSide(color: Colors.white, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
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