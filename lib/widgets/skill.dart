import 'package:flutter/material.dart';

class SkillsStrip extends StatelessWidget {
  const SkillsStrip({Key? key}) : super(key: key);

  static const skills = [
    'Dart',
    'Flutter',
    'Firebase',
    'REST APIs',
    'Provider',
    'Git & GitHub',
    'CI/CD',
    'App Store Deployment',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 24,
      ),
      child: isMobile
          ? SizedBox(
        height: 44, // enough height for chip + padding
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: skills.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            return SkillChip(skills[index]);
          },
        ),
      )
          : Wrap(
        alignment: WrapAlignment.center,
        spacing: 16,
        runSpacing: 16,
        children: skills.map((skill) => SkillChip(skill)).toList(),
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String skill;

  const SkillChip(this.skill, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF334155),
          width: 1,
        ),
      ),
      child: Text(
        skill,
        style: const TextStyle(
          color: Color(0xFF94A3B8),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}