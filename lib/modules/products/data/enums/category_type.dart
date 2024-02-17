enum CategoryType {
  allCategories,
  category1,
  category2,
  category3,
}

extension CategoryHelper on CategoryType {
  int get value {
    switch (this) {
      case CategoryType.category1:
        return 1;
      case CategoryType.category2:
        return 2;
      case CategoryType.category3:
        return 3;
      default:
        return 0;
    }
  }
}
