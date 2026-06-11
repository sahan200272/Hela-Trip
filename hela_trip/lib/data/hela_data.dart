import 'package:flutter/material.dart';
import '../theme/hela_theme.dart';

class Region {
  final String id;
  final String label;
  final Color tint;
  const Region(this.id, this.label, this.tint);
}

class Category {
  final String id;
  final String label;
  final IconData icon;
  const Category(this.id, this.label, this.icon);
}

class Destination {
  final String id;
  final String name;
  final String regionId;
  final String tagline;
  final double rating;
  final int reviews;
  final int baseCost;
  final List<String> tags;
  final String bestMonths;
  final String? duration;
  final String overview;
  const Destination({
    required this.id,
    required this.name,
    required this.regionId,
    required this.tagline,
    required this.rating,
    required this.reviews,
    required this.baseCost,
    required this.tags,
    required this.bestMonths,
    required this.overview,
    this.duration,
  });
}

const helaRegions = <Region>[
  Region('hill', 'Hill Country', HelaColors.regionHill),
  Region('south', 'South Coast', HelaColors.regionSouth),
  Region('cultural', 'Cultural Triangle', HelaColors.regionCultural),
  Region('east', 'East Coast', HelaColors.regionEast),
  Region('north', 'North', HelaColors.regionNorth),
];

const helaCategories = <Category>[
  Category('beach', 'Beaches', Icons.waves_outlined),
  Category('wildlife', 'Wildlife', Icons.pets_outlined),
  Category('temple', 'Temples', Icons.temple_buddhist_outlined),
  Category('food', 'Food', Icons.restaurant_outlined),
  Category('hike', 'Hiking', Icons.terrain_outlined),
  Category('surf', 'Surf', Icons.surfing_outlined),
];

const helaDestinations = <Destination>[
  Destination(
    id: 'ella',
    name: 'Ella',
    regionId: 'hill',
    tagline: 'Tea-country trains, Little Adam\'s Peak, misty mornings.',
    rating: 4.8,
    reviews: 2143,
    baseCost: 38,
    tags: ['hike', 'food'],
    bestMonths: 'Jan – Mar, Nov – Dec',
    duration: '2–3 days',
    overview:
        'A village in the misty central highlands, Ella sits at the end of one of the world\'s most scenic train rides.',
  ),
  Destination(
    id: 'sigiriya',
    name: 'Sigiriya',
    regionId: 'cultural',
    tagline: 'The Lion Rock — a 5th-century palace on a 200 m monolith.',
    rating: 4.9,
    reviews: 5210,
    baseCost: 65,
    tags: ['temple', 'hike'],
    bestMonths: 'Jan – Apr',
    duration: '1–2 days',
    overview:
        'A volcanic plug rising abruptly out of the dry-zone jungle, Sigiriya was a royal citadel for less than 20 years.',
  ),
  Destination(
    id: 'mirissa',
    name: 'Mirissa',
    regionId: 'south',
    tagline: 'Crescent beach, palm-fringed coves, blue-whale season.',
    rating: 4.6,
    reviews: 3411,
    baseCost: 42,
    tags: ['beach', 'surf'],
    bestMonths: 'Nov – Apr',
    duration: '3–4 days',
    overview: 'Mirissa shapes the south coast in a perfect half-moon of sand.',
  ),
  Destination(
    id: 'galle',
    name: 'Galle Fort',
    regionId: 'south',
    tagline: 'UNESCO-listed Dutch fort with boutique cafes and ramparts.',
    rating: 4.7,
    reviews: 4087,
    baseCost: 35,
    tags: ['food'],
    bestMonths: 'Nov – Apr',
    duration: '2 days',
    overview:
        'A walled town built by the Portuguese, fortified by the Dutch, rented out today by gallery owners and pastry chefs.',
  ),
  Destination(
    id: 'arugam',
    name: 'Arugam Bay',
    regionId: 'east',
    tagline: 'East-coast surf town, point breaks, lazy beach mornings.',
    rating: 4.6,
    reviews: 1567,
    baseCost: 32,
    tags: ['surf', 'beach'],
    bestMonths: 'May – Sep',
    duration: '3–5 days',
    overview:
        'A sandy strip with one of the most consistent right-hand point breaks in Asia.',
  ),
  Destination(
    id: 'yala',
    name: 'Yala National Park',
    regionId: 'south',
    tagline: 'Sri Lanka\'s leopard capital — open-jeep safaris at dawn.',
    rating: 4.5,
    reviews: 1820,
    baseCost: 75,
    tags: ['wildlife'],
    bestMonths: 'Feb – Jul',
    duration: '1–2 days',
    overview:
        'Yala is where the dry-zone forest meets the Indian Ocean. Block 1 has the highest leopard density on earth.',
  ),
  Destination(
    id: 'kandy',
    name: 'Kandy',
    regionId: 'hill',
    tagline: 'Lakeside royal capital and Temple of the Sacred Tooth.',
    rating: 4.4,
    reviews: 2987,
    baseCost: 30,
    tags: ['temple', 'food'],
    bestMonths: 'Jan – Apr',
    duration: '2 days',
    overview:
        'The last royal capital of Sri Lanka, wrapped around a man-made lake in the cool central highlands.',
  ),
];

Region regionById(String id) => helaRegions.firstWhere((r) => r.id == id);
