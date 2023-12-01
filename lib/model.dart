class Blog {
  final String name;
  final String Kota;
  final String id;

  const Blog({
    required this.name,
    required this.Kota,
    required this.id,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(name: json['name'],Kota: json['Kota'], id: json['id'] );
  }
}