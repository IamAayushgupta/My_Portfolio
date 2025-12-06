import 'package:flutter/material.dart';

class ServicesAboutSection extends StatelessWidget {
  const ServicesAboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 1000;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 40 : 80,
      ),
      child: isMobile
          ? Column(
        children: [
          _buildServices(),
          const SizedBox(height: 60),
          _buildAbout(),
        ],
      )
          : Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _buildServices()),
          const SizedBox(width: 80),
          Expanded(child: _buildAbout()),
        ],
      ),
    );
  }

  Widget _buildServices() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ServiceItem(
          icon: Icons.phone_android,
          title: 'Flutter App Development',
        ),
        const SizedBox(height: 24),
        ServiceItem(
          icon: Icons.devices,
          title: 'Cross-platform Mobile Apps',
        ),
        const SizedBox(height: 24),
        ServiceItem(
          icon: Icons.cloud_outlined,
          title: 'Firebase & API Integration',
        ),
      ],
    );
  }

  Widget _buildAbout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'About me',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'I started my Flutter development journey through passion and dedication. '
              'Through hands-on learning, I mastered the art of creating beautiful, '
              'performant cross-platform applications. Flutter is my tool for turning '
              'ideas into reality and building things that matter.',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF94A3B8),
            height: 1.8,
          ),
        ),
        // REPLACE THIS TEXT WITH YOUR OWN ABOUT ME DESCRIPTION
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            StatItem(value: '15+', label: 'Completed\nProjects'),
            StatItem(value: '95%', label: 'Client\nSatisfaction'),
            StatItem(value: '1+', label: 'Years of\nExperience'),
          ],
        ),
      ],
    );
  }
}

class ServiceItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const ServiceItem({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFF334155),
              width: 1,
            ),
          ),
          child: Icon(
            icon,
            color: const Color(0xFFFF6B5A),
            size: 32,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class StatItem extends StatelessWidget {
  final String value;
  final String label;

  const StatItem({
    Key? key,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF94A3B8),
            height: 1.4,
          ),
        ),
      ],
    );
  }
}