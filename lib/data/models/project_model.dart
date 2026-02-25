import 'package:flutter/material.dart';

class Project {
  final String name;
  final String description;
  final List<String> features;
  final List<String> technologies;
  final String? githubLink;
  final String? playStoreLink;
  final String? appStoreLink;
  final IconData? projectIcon;
  final String role;
  final String challenges;
  final String solutions;

  Project({
    required this.name,
    required this.description,
    required this.features,
    required this.technologies,
    this.githubLink,
    this.playStoreLink,
    this.appStoreLink,
    this.projectIcon = Icons.work_outline,
    required this.role,
    required this.challenges,
    required this.solutions,
  });
}
