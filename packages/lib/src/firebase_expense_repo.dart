import '../expense_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseExpenseRepo implements ExpenseRepo {
  //访问 Firebase 数据库中的 category 集合。
  final categoryCollection = FirebaseFirestore.instance.collection("category");
  final expenseCollection = FirebaseFirestore.instance.collection("expense");

  @override
  Future<void> createCategory(Category category) async {
    try {
      await categoryCollection
          .doc(category.categoryId)
      //是 Firestore 中用于创建或更新文档的方法。它会将传入的数据写入 Firestore 指定的文档中。
          .set(category.toEntity().toDocument());
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Category>> getCategory() async {
    try {
      //then处理异步之后的操作
      return await categoryCollection.get().then(
        //value.docs 返回的是一个包含所有文档的列表。
        // value 是 categoryCollection.get() 方法返回的 QuerySnapshot 对象
        //代表了从 Firestore 中获取的文档快照
            (value) => value.docs.map(
              //CategoryEntity 对象再被传递给 Category.fromEntity将其转换成 Category 对象。
              //e 是 map 函数中的一个参数，表示 value.docs 列表中的每个元素,代表 Firestore 中的一条文档数据。
              (e) => Category.fromEntity(
                //这个方法将 Map 数据转换为 CategoryEntity 对象。
                CategoryEntity.fromDocument(
                  //data() 返回的是一个 Map
                  e.data(),
                ),
              ),
              //将 map 返回的元素转换成一个列表
            ).toList()
          );
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
