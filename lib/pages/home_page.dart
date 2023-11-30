import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../api/request.dart';
import '../widgets/stackedPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  final PageController _pageController = PageController();
  final ValueNotifier<double> dragValue = ValueNotifier(0);
  final List<Color> colors = <Color>[
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.purpleAccent,
    Colors.orange
  ];
  ValueNotifier< List<Widget>> pageList = ValueNotifier([]);
  ValueNotifier<int> currentPage = ValueNotifier(0);
  late AnimationController _ctrl;
  Offset startOffset = Offset(0, 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTodayInfo();
    pageList.value = [buildPageItem(0),buildPageItem(1),buildPageItem(2)];
    _ctrl = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _pageController.addListener(() {
      // log("${_pageController.position.pixels}");
    });
    // _ctrl.addStatusListener((status) {
    //   log("status:$status");
    // });
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text("首页",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body:buildPageView(),
      // body: PageView.builder(itemBuilder: (BuildContext context, int index) {
      //   return buildPageItem(index);
      // },controller: _pageController,itemCount: 3,onPageChanged: (currentPageIndex){
      //   log("currentPageIndex:$currentPageIndex");
      // },)
    );
  }
  //手势控制左右滑动
  Widget buildGestureDetector(){
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onHorizontalDragStart: (event){
        startOffset = event.localPosition;
        setState(() {});
      },
      onHorizontalDragUpdate: (event){
        log("update.....:${event.delta}");
        if(event.localPosition.dx<startOffset.dx){
          log("左滑控制当前页");
        }else{
          log("右滑控制上一页");
        }
        double cur = dragValue.value+event.delta.dx;
        dragValue.value = cur.clamp(-MediaQuery.of(context).size.width, MediaQuery.of(context).size.width);
      },
      onHorizontalDragEnd: (event){
        if(dragValue.value.abs()>(MediaQuery.of(context).size.width/2)){
          log("end.....,${dragValue.value}");
          open();
        }else{
          close();
        }
      },
      child: Container(alignment: Alignment.center,child: Flow(
        delegate: SwiperFlowDelegate(dragValue,currentPage),
        children: List.generate(pageList.value.length, (index) => buildPageItem(index)),
      ),),
    );
  }
  Widget buildPageItem(int index){
    log("build,$index");
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: colors[index],
          border: Border.all(width: 20,color: Colors.grey)
      ),
      child: Center(child: Text("$index",style: const TextStyle(fontSize: 40,fontWeight: FontWeight.w700),)),
    );
  }
  // 动画打开
  Future<void> open() async {
    Animation<double> anim = Tween<double>(begin: dragValue.value, end: -MediaQuery.of(context).size.width).animate(_ctrl);
    anim.addListener(() => dragValue.value = anim.value);
    await _ctrl.forward(from: -MediaQuery.of(context).size.width);
  }
  // 动画关闭
  Future<void> close() async {
    Animation<double> tweenAnim = Tween<double>(begin: dragValue.value, end: 0).animate(_ctrl);
    tweenAnim.addListener(() => dragValue.value = tweenAnim.value);
    await _ctrl.forward(from: 0);
  }
  Widget buildPageView(){
    return PageView.builder(
      itemCount: colors.length,
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      itemBuilder: (context, index) {
        return StackPageView(
          animationAxis: Axis.horizontal,
          controller: _pageController,
          index: index,
          child:buildPageItem(index),
        );
      },
      onPageChanged: (int i){
        log("currentIndex:$i");
      },
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _ctrl.dispose();
    _pageController.dispose();
    super.dispose();
  }
}

class SwiperFlowDelegate extends FlowDelegate{
  final ValueListenable<double> offsetX;
  final ValueListenable<int> page;
  SwiperFlowDelegate(this.offsetX,this.page):super(repaint: offsetX);
  @override
  void paintChildren(FlowPaintingContext context) {
    // TODO: implement paintChildren
    Matrix4 offsetM4 = Matrix4.translationValues(offsetX.value, 0, 0);
    context.paintChild(page.value, transform: offsetM4);
  }

  @override
  bool shouldRepaint(covariant SwiperFlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate.offsetX.value != offsetX.value;
  }
}
