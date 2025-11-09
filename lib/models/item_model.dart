class Wonder {
  final String title;
  final String subtitle;
  final String description;
  final String imageUrl;
  final bool show;

  const Wonder({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imageUrl,
    this.show = false,
  });
}
