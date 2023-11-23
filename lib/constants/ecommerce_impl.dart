class EcommerceData {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  EcommerceData({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  EcommerceData.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        title = json['title'] as String,
        price = (json['price'] as num).toDouble(), // Adjust the casting here
        description = json['description'] as String,
        category = json['category'] as String,
        image = json['image'] as String,
        rating = Rating.fromJson(json['rating'] as Map<String, dynamic>);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
        'rating': rating.toJson()
      };
}

class Rating {
  final double? rate;
  final int? count;

  Rating({
    this.rate,
    this.count,
  });

  Rating.fromJson(Map<String, dynamic> json)
      : rate = json['rate'] != null ? (json['rate'] as num).toDouble() : null,
        count = json['count'] as int?;

  Map<String, dynamic> toJson() => {'rate': rate, 'count': count};
}
