import 'package:screen_deck/model/categoriesmodel.dart';

String apiKey = "563492ad6f91700001000001700c09ff73b443a8824fe60a041d56a9";

List<CategoriesModel> getCategories() {
  List<CategoriesModel> categories = [];
  CategoriesModel categoriesModel = new CategoriesModel();

  categoriesModel.imageUrl = 'https://images.unsplash.com/photo-1601196595039-74c770ae3385?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3RyZWV0JTIwYXJ0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60';
  categoriesModel.categoriesname = 'Street Art';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imageUrl = 'https://images.unsplash.com/photo-1504173010664-32509aeebb62?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHdpbGRsaWZlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60';
  categoriesModel.categoriesname = 'Wildlife';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imageUrl = 'https://images.unsplash.com/photo-1540206395-68808572332f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8bmF0dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60';
  categoriesModel.categoriesname = 'Nature';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();


   categoriesModel.imageUrl = 'https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2l0eXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60';
  categoriesModel.categoriesname = 'City';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();
  
   categoriesModel.imageUrl = 'https://images.unsplash.com/photo-1552508744-1696d4464960?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fG1vdGl2YXRpb258ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60';
  categoriesModel.categoriesname = 'Motivation';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

   categoriesModel.imageUrl = 'https://images.unsplash.com/photo-1558981403-c5f9899a28bc?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YmlrZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60';
  categoriesModel.categoriesname = 'Bikes';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

   categoriesModel.imageUrl = 'https://images.unsplash.com/photo-1583121274602-3e2820c69888?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Y2Fyc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60';
  categoriesModel.categoriesname = 'Cars';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  return categories;
}