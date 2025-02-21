//CategoryEntity 是一个 数据传输对象（DTO），通常用于数据持久化
// ，特别是与 数据库交互 或 API 通信 时使用。
// 它通常是一个 简单的数据结构，没有复杂的业务逻辑，主要是为了方便存储和检索数据。

//- 数据存储与传输：CategoryEntity 用于从数据库、API 或其他数据源获取数据并将其转化为应用层的对象。它与数据库的表结构（或其他持久化存储）紧密对应。
//- 无业务逻辑：CategoryEntity 通常只包含字段和简单的构造方法，没有复杂的业务逻辑。它的目的是简单地存储数据，不参与具体的业务计算或逻辑。
//- 与存储层交互：它是与数据库或其他外部存储进行交互的模型。
class CategoryEntity {
  String categoryId;
  String name;
  int totalExpenses;
  String icon;
  String color;

  CategoryEntity({required this.categoryId,
    required this.name,
    required this.totalExpenses,
    required this.icon,
    required this.color});

  //将 CategoryEntity 对象转换为 字典格式（Map） 的方法
  // ，通常用于将该实体数据 转换为可以存储到数据库或其他存储系统的数据格式。
  Map<String, Object?> toDocument() {
    return {
      "categoryId": categoryId,
      "name": name,
      "totalExpenses": totalExpenses,
      "icon": icon,
      "color": color,
    };
  }

  static CategoryEntity fromDocument(Map<String, dynamic>doc) {
    return CategoryEntity(
      categoryId: doc["categoryId"],
      name: doc["name"],
      totalExpenses: doc["totalExpenses"],
      icon: doc["icon"],
      color: doc["color"],

    );
  }
}
