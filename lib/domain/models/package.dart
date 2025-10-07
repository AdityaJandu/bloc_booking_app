import 'package:equatable/equatable.dart';

class Package extends Equatable {
  final String id;
  final String name;
  final String description;
  final double basePrice;
  final String imageUrl;

  const Package({
    required this.id,
    required this.name,
    required this.description,
    required this.basePrice,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, description, basePrice, imageUrl];
}
