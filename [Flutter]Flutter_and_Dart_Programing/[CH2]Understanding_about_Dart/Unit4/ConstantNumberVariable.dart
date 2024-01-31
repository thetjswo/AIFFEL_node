/*
* 컴파일 타임 상수 변수는 변수명 앞에 const를 붙여야 하며, 특히 클래스 내에서 상수 변수를 선언할 때에는 static을 같이 사용해야 한다.
* 컴파일 타임 상수 변수 선언 시 오류가 나는 경우는 다음과 같다.
* - 변수 초기화를 안한 경우
*   ex) const String c_data1;
*   컴파일 타임 상수 변수는 컴파일 단계(프로그램을 빌드하면서 각각의 파일을 읽는 시점)에서 상수가 되므로, 초기화가 되어있지 않으면 에러가 발생한다.
*   -> 프로그램 빌드 시, 에러 발생 (앱 빌드 단계)
* - 변수에 할당된 값을 변경하려는 경우
*   ex) const String c_data1 = 0;
*       data1 = 1;
*   상수 변수는 이미 값이 할당되어 고정된 변수로, 새로운 데이터를 대입하려고 시도하면 에러가 발생한다.
*/
const String c_data1 = 'Hello';
/*
* 런 타임 상수 변수는 변수명 앞에 final을 붙여야 하며, 특히 클래스 내에서 상수 변수를 선언할 때에는 나중에 초기화를 하는 것을 허용하는 의미의 late를 같이 사용해야 한다.
* 컴파일 타임 상수 변수 선언 시 오류가 나는 경우는 다음과 같다.
*  - ex) (탑 레벨)final String f_data1;
*    탑 레벨의 런 타임 상수 변수는 런 단계(다른 파일에서 현재 파일을 import하여 호출하는 시점)에서 상수가 되므로, 초기화가 되어있지 않으면 에러가 발생한다.
*    -> 프로그램 시작 시, 에러 발생 (앱 실행 단계)
*  - ex) final String f_data1;
*        f_data1 = 'world';
*        f_data1 = 'test';
*    탑 레벨을 제외한 런 타임 상수 변수는 미리 초기화를 시키지 않아도 되지만, 한 번 값이 할당된 뒤에 다른 값을 대입하려 하면 에러가 발생한다.
*    -> 변수에 다른 값을 대입하려는 시점에서 에러 발생
*/
final String f_data1 = 'world';

class User {
  // 클래스의 상수 변수는 static을 붙인다.
  static const String c_data2 = 'Hello';
  // late를 붙여서 나중에 값을 대입하겠다는 것을 알린다.
  late final String f_data2;

  void some() {
    //초기화 필수
    const String c_data3 = 'Hello';
    //초기화 필수 아님
    final String f_data3;
    f_data3 = 'world';

    // 기존에 존재하던 상수 변수의 값을 대입할 때에는 새로운 변수를 각 타입에 맞는 상수 변수로 선언해줘야 한다.
    const String c_data4 = '$c_data1';
    final String f_data4 = '$f_data1';

    print(f_data3);
    print(c_data4);
    print(f_data4);
  }
}

main(){
  User user = User();

  user.some();
}