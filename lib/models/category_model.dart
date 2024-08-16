
class CategoriesModel
{
  int? status ; 
  List<Category>? categories ;
  CategoriesModel.fromJson(Map<String,dynamic> json)
  {
    status = json['status'] ;
    categories = List<Category>.from(json['categories'].map((e) => Category.fromJson(e)));
    
  }
}
class Category {

  int? id;
  String? categoryName;
  String? categoryImage;
  Category.fromJson(Map<String,dynamic> json){
    id = json['id'];  
    categoryName= json['category_name'];
    categoryImage=json['category_image'];
  }
  
}
