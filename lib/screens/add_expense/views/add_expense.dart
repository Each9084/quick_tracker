import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  //控制三个文本输入的内容
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  List<String> userCategoriesIcons = [
    "entertainment",
    "food",
    "home",
    "pet",
    "shopping",
    "tech",
    "travel",
  ];

  String selectedIcon = "";

  @override
  void initState() {
    //导入了intl包 用来更好的展示
    dateController.text = DateFormat('yyyy/MM/dd').format(DateTime.now());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //这样点击空白后就不会在聚焦与text栏了
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Add Expenses",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  controller: expenseController,
                  //textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.cyan,
                    prefixIcon: Icon(
                      FontAwesomeIcons.poundSign,
                      color: Colors.yellowAccent,
                      size: 18,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                //width: MediaQuery.of(context).size.width*0.7,
                child: TextFormField(
                  readOnly: true,
                  //下拉菜单
                  onTap: () {},
                  controller: categoryController,
                  //textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.cyan,
                    prefixIcon: Icon(
                      FontAwesomeIcons.list,
                      color: Colors.yellowAccent,
                      size: 18,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            //这个ctx好像是 expanded的新环境 专注于对dialog
                            // context则专注于对原本的页面
                            builder: (ctx) {
                              bool isExpanded = false;
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return AlertDialog(
                                    //未来多了 可以设置成滚动scrollable: true,
                                    title: Text(
                                      "Create a Category",
                                    ),
                                    content: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: 16,
                                          ),
                                          TextFormField(
                                            decoration: InputDecoration(
                                              isDense: true,
                                              filled: true,
                                              fillColor: Colors.cyan,
                                              hintText: "Name",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                borderSide: BorderSide.none,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          TextFormField(
                                            readOnly: true,
                                            onTap: () {
                                              setState(() {
                                                isExpanded = !isExpanded;
                                              });
                                            },
                                            decoration: InputDecoration(
                                              isDense: true,
                                              filled: true,
                                              fillColor: Colors.cyan,
                                              hintText: "Icon",
                                              suffixIcon: Icon(
                                                CupertinoIcons.chevron_down,
                                                size: 12,
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: isExpanded
                                                    //如果展开 上面圆润 下边平整
                                                    ? BorderRadius.vertical(
                                                        top:
                                                            Radius.circular(30),
                                                      )
                                                    //不展开 则通体为12
                                                    : BorderRadius.circular(12),
                                                borderSide: BorderSide.none,
                                              ),
                                            ),
                                          ),
                                          //判断是否展开
                                          isExpanded
                                              //为true展开
                                              ? Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 200,
                                                  //color: Colors.red,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                      bottom:
                                                          Radius.circular(12),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GridView.builder(
                                                        gridDelegate:
                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                          //控制各个框的距离
                                                          crossAxisSpacing: 5,
                                                          mainAxisSpacing: 5,
                                                          //控制一行现实的内容量
                                                          crossAxisCount: 3,
                                                        ),
                                                        itemCount:
                                                            userCategoriesIcons
                                                                .length,
                                                        itemBuilder:
                                                            (context, int i) {
                                                          //判断用户选择了什么图标,让边框颜色变为选中状态
                                                          return GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                selectedIcon =
                                                                    userCategoriesIcons[
                                                                        i];
                                                              });
                                                            },
                                                            child: Container(
                                                              width: 50,
                                                              height: 50,
                                                              decoration:
                                                                  BoxDecoration(
                                                                //加上边框
                                                                border:
                                                                    Border.all(
                                                                  width: 3,
                                                                  color: selectedIcon ==
                                                                          userCategoriesIcons[
                                                                              i]
                                                                      ? Colors
                                                                          .green
                                                                      : Colors
                                                                          .grey,
                                                                ),

                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                image:
                                                                    DecorationImage(
                                                                  image: AssetImage(
                                                                      'assets/img/${userCategoriesIcons[i]}.png'),
                                                                      //fit: BoxFit.contain,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                  ),
                                                )
                                              : Container(),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          TextFormField(
                                            decoration: InputDecoration(
                                              isDense: true,
                                              filled: true,
                                              fillColor: Colors.cyan,
                                              hintText: "Color",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                borderSide: BorderSide.none,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            });
                      },
                      icon: Icon(
                        FontAwesomeIcons.plus,
                        size: 16,
                        color: Colors.yellowAccent,
                      ),
                    ),
                    hintText: "Category",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                //width: MediaQuery.of(context).size.width*0.7,
                child: TextFormField(
                  controller: dateController,
                  //textAlignVertical: TextAlignVertical.center,
                  readOnly: true,
                  onTap: () async {
                    DateTime? newDate = await showDatePicker(
                      context: context,
                      //设置日期选择器的默认日期
                      initialDate: selectedDate,
                      //TODO 不合理 后期需要调整 至少要让用户可以选择前面
                      //限制用户可选日期的最早日期
                      firstDate: DateTime.now(),
                      //限制用户可选日期的最晚日期
                      lastDate: DateTime.now().add(
                        Duration(days: 365),
                      ),
                    );
                    if (newDate != null) {
                      setState(() {
                        dateController.text =
                            DateFormat("yyyy/MM/dd").format(newDate);
                        selectedDate = newDate;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.cyan,
                    prefixIcon: Icon(
                      FontAwesomeIcons.calendar,
                      color: Colors.yellowAccent,
                      size: 18,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                height: kToolbarHeight,
                child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Save",
                      style: TextStyle(
                          //backgroundColor: Colors.blue,
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
