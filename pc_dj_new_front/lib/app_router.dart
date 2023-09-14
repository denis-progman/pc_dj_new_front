import 'package:flutter/material.dart';

class PageRout {
  final String path;
  final String label;
  final Icon icon;

  PageRout({
    required this.path,
    required this.label,
    required this.icon,
  });
}

class AppRouter {
  static List<PageRout> pageRouts = [
    PageRout(
      path: "/",
      label: "Home page",
      icon: const Icon(Icons.home)
    ),
    PageRout(
      path: "/bookmarks",
      label: "Bookmarks",
      icon: const Icon(Icons.bookmarks)
    ),
    PageRout(
      path: "/local_files",
      label: "Local files",
      icon: const Icon(Icons.audio_file)
    ),
    PageRout(
      path: "/user_cabinet",
      label: "User cabinet",
      icon: const Icon(Icons.account_circle)
    ),
  ];
}
