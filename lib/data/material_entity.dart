class MaterialEntity {
  String thumb;
  String name;
  String description;
  double rating;
  ViewType type;

  MaterialEntity(this.thumb, this.name, this.description, this.rating, {this.type = ViewType.INFO});

}

enum ViewType {
  INFO,
  RATING
}
