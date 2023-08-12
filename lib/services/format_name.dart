String formatName(String name) {
  if (name.contains('_')) {
    return name.replaceAll('_', ' ');
  }
  return name;
}