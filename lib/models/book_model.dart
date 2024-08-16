class BookInformationModel {
  int id;
  String coverImage;
  String bookTitle;
  String authorName;
  String categoryName;
  int price;
  String pdfSize;
  String description;
  String pdfPath;
  int buyBook;
  int favorite;
  int averageRating;
  int totalRatings;
  
  BookInformationModel.fromJSON(Map<String, dynamic> json)
      : id = json["id"],
        coverImage = json["cover_image"],
        bookTitle = json["book_title"],
        authorName = json["author_name"],
        categoryName = json["category_name"],
        price = json["price"],
        pdfSize = json["pdf_size"],
        description = json["description"],
        pdfPath = json["pdf_path"],
        buyBook = json["buy_book"],
        favorite = json["favorite"],
        averageRating = json["average_rating"],
        totalRatings = json["total_ratings"];
}
