abstract class BaseModel {
  bool loading = false;

  BaseModel({
    required this.loading
  });

  BaseModel copyWith({
    bool? loading,
  });
}