class BookCard {
  int? id;
  String? bookTitle;
  String? pdfPath;
  String? author;
  String? coverImage;
  BookCard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookTitle = json['book_title'];
    pdfPath = json['pdf_path'];
    author = json['author'];
    coverImage = json['cover_image'];
  }
}

class Category {
  int? id;
  String? categoryName;
  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
  }
}

class BooksCardsModel {
  int? status;
  Category? category;
  List<BookCard>? books;

  BooksCardsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    category = Category.fromJson(json['category']);
    books = List<BookCard>.from(json['books'].map((e) => BookCard.fromJson(e)));
  }
}
