class Song {
  final String id;
  final String title;
  final String lyrics;
  final String category;
  final String author;
  final int number;
  final bool isFavorite;
  final String? audioPath; // Ajout du chemin pour l'audio

  Song({
    required this.id,
    required this.title,
    required this.lyrics,
    required this.category,
    required this.author,
    required this.number,
    this.isFavorite = false,
    this.audioPath,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      lyrics: json['lyrics'] ?? '',
      category: json['category'] ?? '',
      author: json['author'] ?? 'Auteur inconnu',
      number: json['number'] as int,
      audioPath: json['audioPath'], // Lire le chemin audio depuis JSON
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
      'audioPath': audioPath,
    };
  }

  Song copyWith({bool? isFavorite, String? audioPath}) {
    return Song(
      id: id,
      title: title,
      lyrics: lyrics,
      category: category,
      author: author,
      number: number,
      isFavorite: isFavorite ?? this.isFavorite,
      audioPath: audioPath ?? this.audioPath,
    );
  }
}
