// 测试dart静态和私有方法属性, 没有反射, 没有动态注入
class TestPrivate {
  final String value;
  TestPrivate(this.value);
  get A {
    return 'nameA';
  }
  test(val) {
    var a = this.value;
    print('A.toString() is: $a');
    // for(var i = 0; i < TestPrivate.iterator; i++) {//可以使用var或int           
    //    print(colorList[i]);               
    // }
    // print('test-val: $val');
    // if(A.toString() == val) {
    //   return A;
    // } else {
    //   return 'empty';
    // }
    
  }
  String toString() => test(value);
  void call(){
    print('call');
  }
}
TestValue(value) {
   return new TestPrivate(value);
}
