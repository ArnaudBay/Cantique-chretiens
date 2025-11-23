class Song {
  final String id;
  final String title;
  final String lyrics;
  final String category;
  final String author;
  final int number;
  bool isFavorite; // Changé de final à normal

  Song({
    required this.id,
    required this.title,
    required this.lyrics,
    required this.category,
    required this.author,
    required this.number,
    this.isFavorite = false,
  });

  Song copyWith({
    String? id,
    String? title,
    String? lyrics,
    String? category,
    String? author,
    int? number,
    bool? isFavorite,
  }) {
    return Song(
      id: id ?? this.id,
      title: title ?? this.title,
      lyrics: lyrics ?? this.lyrics,
      category: category ?? this.category,
      author: author ?? this.author,
      number: number ?? this.number,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}