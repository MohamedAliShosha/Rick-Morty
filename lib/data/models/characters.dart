class CharactersModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String originName;
  final String originUrl;
  final String locationName;
  final String locationUrl;
  final String image;
  final List<String> episodes;
  final String characterUrl;
  final DateTime createdAt;

  CharactersModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.originName,
    required this.originUrl,
    required this.locationName,
    required this.locationUrl,
    required this.image,
    required this.episodes,
    required this.characterUrl,
    required this.createdAt,
  });

  factory CharactersModel.fromJson(Map<String, dynamic> jsonData) {
    return CharactersModel(
      id: jsonData['id'], // Accessing directly
      name: jsonData['name'],
      status: jsonData['status'],
      species: jsonData['species'],
      gender: jsonData['gender'],
      originName: jsonData['origin']['name'],
      originUrl: jsonData['origin']['url'],
      locationName: jsonData['location']['name'],
      locationUrl: jsonData['location']['url'],
      image: jsonData['image'],
      episodes: List<String>.from(jsonData['episode'].map((x) => x.toString())),
      characterUrl: jsonData['url'],
      createdAt: DateTime.parse(jsonData['created']),
    );
  }
}
