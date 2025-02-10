class CharacterModel {
  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory CharacterModel.fromMap(Map<String, dynamic> json) => CharacterModel(
        id: json['id'] as int? ?? 0,
        name: json['name'] as String? ?? '',
        status: json['status'] as String? ?? '',
        species: json['species'] as String? ?? '',
        type: json['type'] as String? ?? '',
        gender: json['gender'] as String? ?? '',
        origin:
            OriginModel.fromMap(json['origin'] as Map<String, dynamic>? ?? {}),
        location: LocationModel.fromMap(
          json['location'] as Map<String, dynamic>? ?? {},
        ),
        image: json['image'] as String? ?? '',
        episode: List<String>.from(
          (json['episode'] as List? ?? []).map((x) => x as String),
        ),
        url: json['url'] as String? ?? '',
        created: DateTime.parse(json['created'] as String? ?? ''),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'status': status,
        'species': species,
        'type': type,
        'gender': gender,
        'origin': origin.toMap(),
        'location': location.toMap(),
        'image': image,
        'episode': List<dynamic>.from(episode.map((x) => x)),
        'url': url,
        'created': created.toIso8601String(),
      };

  CharacterModel copyWith({
    int? id,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    OriginModel? origin,
    LocationModel? location,
    String? image,
    List<String>? episode,
    String? url,
    DateTime? created,
  }) =>
      CharacterModel(
        id: id ?? this.id,
        name: name ?? this.name,
        status: status ?? this.status,
        species: species ?? this.species,
        type: type ?? this.type,
        gender: gender ?? this.gender,
        origin: origin ?? this.origin,
        location: location ?? this.location,
        image: image ?? this.image,
        episode: episode ?? this.episode,
        url: url ?? this.url,
        created: created ?? this.created,
      );
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final OriginModel origin;
  final LocationModel location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;
}

class LocationModel {
  const LocationModel({
    required this.name,
    required this.url,
  });

  factory LocationModel.fromMap(Map<String, dynamic> json) => LocationModel(
        name: json['name'] as String? ?? '',
        url: json['url'] as String? ?? '',
      );

  LocationModel copyWith({
    String? name,
    String? url,
  }) =>
      LocationModel(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'url': url,
      };

  final String name;
  final String url;
}

class OriginModel {
  const OriginModel({
    required this.name,
    required this.url,
  });

  factory OriginModel.fromMap(Map<String, dynamic> json) => OriginModel(
        name: json['name'] as String? ?? '',
        url: json['url'] as String? ?? '',
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'url': url,
      };

  OriginModel copyWith({
    String? name,
    String? url,
  }) =>
      OriginModel(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  final String name;
  final String url;
}
