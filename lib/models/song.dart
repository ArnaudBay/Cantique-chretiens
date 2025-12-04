class Song {
  final String id;
  final String title;
  final String lyrics;
  final String category;
  final String author;
  final int number;
  final bool isFavorite;

  Song({
    required this.id,
    required this.title,
    required this.lyrics,
    required this.category,
    required this.author,
    required this.number,
    this.isFavorite = false,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      lyrics: json['lyrics'] ?? '',
      category: json['category'] ?? '',
      author: json['author'] ?? 'Auteur inconnu',
      number: json['number'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'lyrics': lyrics,
      'category': category,
      'author': author,
      'number': number,
    };
  }

  Song copyWith({bool? isFavorite}) {
    return Song(
      id: id,
      title: title,
      lyrics: lyrics,
      category: category,
      author: author,
      number: number,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
