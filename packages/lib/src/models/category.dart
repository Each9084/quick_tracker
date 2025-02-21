import 'dart:ui';

import '../entities/entities.dart';

//将数据转换为实体的原因主要是为了实现 业务逻辑和数据存储的解耦，
// 让数据模型（CategoryEntity）更适合存储和传输
// ，而业务模型（Category）则关注具体的业务逻辑和显示。
// 这样可以让代码更灵活、可维护，并方便未来更换存储方式或进行功能扩展。


//Category 是应用程序中用于处理 业务逻辑 和 UI 显示 的类。
// 它代表了你应用中的一个概念（例如：一个商品类别、用户输入的分类等）。

//- 业务层模型：它通常与应用程序的业务逻辑紧密相关，可能包含一些操作、计算或者验证业务规则。
//- 用户交互：Category 类通常会包含用于与用户交互的属性，比如类别名称、图标、颜色等。
//- 数据处理：它可能包含方法，用于处理与类别相关的逻辑，如计算某个类别的总支出、更新类别的状态等。
class Category {
  String categoryId;
  String name;
  int totalExpenses;
  String icon;
  String color;

  Category({required this.categoryId,
    required this.name,
    required this.totalExpenses,
    required this.icon,
    required this.color});

  //empty 是 Category 类的一个 静态常量，表示一个默认的、空的 Category 实例。
  // 它可以避免 null 值的使用，为没有数据的场景提供一个有效的默认值。
  static final empty = Category(categoryId: "",
      name: "",
      totalExpenses: 0,
      icon: "",
      color: "");

  //解耦
  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      name: name,
      totalExpenses: totalExpenses,
      icon: icon,
      color: color,
    );
  }

  static Category fromEntity(CategoryEntity entity) {
    return Category(
        categoryId: entity.categoryId,
        name: entity.name,
        totalExpenses: entity.totalExpenses,
        icon: entity.icon,
        color: entity.color);
  }
}
