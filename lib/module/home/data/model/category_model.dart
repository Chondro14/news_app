class CategoryModel {
  final String title;
  final String value;
  const CategoryModel({required this.title, required this.value});
}

List<CategoryModel> categories = const [
  CategoryModel(title: "Umum", value: "general"),
  CategoryModel(title: "Bisnis", value: "business"),
  CategoryModel(title: "Hiburan", value: "entertainment"),
  CategoryModel(title: "Kesehatan", value: "health"),
  CategoryModel(title: "Sains", value: "science"),
  CategoryModel(title: "Olahraga", value: "sports"),
  CategoryModel(title: "Teknologi", value: "technology"),
];
