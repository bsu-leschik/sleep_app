class MuzModeTwo {
  final String? image;
  final String title;
  final String music;
  bool isSelected;
  MuzModeTwo({
    required this.image,
    required this.title,
    required this.music,
    required this.isSelected,
  });
}

List<String> allList = [
  "All",
  "Favorite",
  "Music",
  "Nature",
  "Urban",
  "Animals",
  "White noise",
  "Home",
  "Baby",
  "Single",
];

int current = 0;
