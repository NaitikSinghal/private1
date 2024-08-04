import 'package:flutter/cupertino.dart';

class CategoryData{
  String title;
  String image;
  CategoryData.items({
    required this.title,
    required this.image,
});
}

List<CategoryData> categoryItems =[

  CategoryData.items(
      title: 'All Fruits' ,
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSt0K1iLAfz0W2NeZk0OW_Orah2AlvzURw8Tw&usqp=CAU'
      ),
  CategoryData.items(
      title: 'Apple' ,
      image: 'https://media.istockphoto.com/id/184276818/photo/red-apple.jpg?s=612x612&w=0&k=20&c=NvO-bLsG0DJ_7Ii8SSVoKLurzjmV0Qi4eGfn6nW3l5w='
      ),
  CategoryData.items(
      title: 'Banana' ,
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWrKabSiVPc_tB3eu1IinqBWbDcNTPfwM9mQ&usqp=CAU'
      ),
  CategoryData.items(
      title: 'Mango' ,
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiwp6ujHF8vdbDy6E67gA8AfgAcx6aG9cecw&usqp=CAU'
      ),
  CategoryData.items(
      title: 'Citrous Fruits' ,
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYUy2mWQ86MC5m49F02Q-kmfpjg5fHVcXKvw&usqp=CAU'
      ),
  CategoryData.items(
      title: 'Exotic Fruits' ,
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSV-PHkVyX8SQkkNgeiRWEZRjLTM4fE7KnzMg&usqp=CAU'
      ),
  CategoryData.items(
      title: 'Orange' ,
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvnuLzVJ2EeJb2oi1WSadkPGJfF6xx9SpzJQ&usqp=CAU'
      ),
  CategoryData.items(
      title: 'Berries' ,
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0KauwX0BfV1HR8un6I0apiGbAbgM0zcqUoIenFtZ-sAIhbZ_RThGQCFRPGeu7K5nN__M&usqp=CAU'
      ),
  CategoryData.items(
      title: 'Tropical Fruits' ,
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDJtzXLnLOjzzIngBgQz07Yoajfs20Bu3hKQ&usqp=CAU'
      ),
  CategoryData.items(
      title: 'Stone Fruits' ,
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTh0bndZL1EGJyyM2FAQuwbh0G4-xHg5lH-jA&usqp=CAU'
      ),
  CategoryData.items(
      title: 'Organic Fruits' ,
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJ2HvGN3MmHvH5jKUjkXhG5h-Efr-UWY6BsQ&usqp=CAU'
      ),
  
];