void main() {
  String string = "oops";
  string = "viin";

  dynamic dyna = "oops";
  dyna = 123;

  final String fin = "oops"; //
  // test3 = "viin"; // error

  late final String late; // 값이 타입 변수를 선언
  // final String test4; // error
  late = "oops";

  const con = "oops";
  // const API = "someting"; // error
  //api값은 변경돼서 final or var를 사용해야됨, 항상 고정값만 적용 가능

  String? optional = "oops"; //  string 타임과 null 타입을 같이 사용할 때
  optional = null;

  num numb = 123; // int
  numb = 123.456; // double
  // num은 int와 double을 동시에 사용할 수 있다. (상위 class)

  bool giveMeFive = true;
  List<int> lis = [1, 2, 3, 4, if (giveMeFive) 5];
  lis.first; // 1
  print(lis.last); // 5

  String name = "oops";
  int age = 10;
  String greeting = "Hello, I'm $name, nice to meet you! and I'm ${age + 2}";
  print(greeting);

  List<String> oldFriend = ["tom", "jack"];
  List<String> newFriend = ["tom", "sim", "stan", for (var friend in oldFriend) "$friend"];
  print(newFriend);

  var playerMap = {
    // Map
    "name": "oops",
    "xp": "19.99",
    "superpower": false,
  };

  Map<int, bool> object1 = {
    1: true,
    2: false,
  };

  Map<List<int>, bool> object2 = {
    [1, 2, 3]: true,
    [4, 5]: false,
  }; // 쓸모없지만 이런식으로 사용 가능

  List<Map<String, Object>> object3 = [
    {"name": "oops", "xp": 1230000.44},
    {"name": "viin", "xp": 1230000.44},
  ];

  Set<int> set1 = {1, 2, 3, 4}; // set의 모든 값은 유니크하다.
  var set2 = {1, 2, 3, 4}; // set
  set1.add(1);
  set1.add(1); // 추가가 안된다.
  set2.add(1);
  set2.add(1); // 추가가 안된다.
  print(set1);
  print(set2);
  sayHello1("oops");
  print(sayHello2("oops"));
  print(sayHello3("oops"));
  print(sayHello4("oops", 20, "bahama"));
  print(sayHello5(
    name: "oops",
    age: 20,
    country: "bahama",
  ));
  // print(sayHello6(
  //   name: "oops",
  //   age: 20,
  // ));
  capitalizeName1(null);
  capitalizeName2(null);
  print(sayHi({"name": "oops"}));

  var player1 = Player1(); // new Player() new를 생략할 수 있음
  player1.sayHello1();
  player1.sayHello2();

  var player2 = Player2("oops", 20);
  player2.sayHello();

  var player3 = Player3("oops", 20);
  player3.sayHello();

  var player4 = Player4(name: "oops", xp: 20, team: "blue", age: 20);
  player4.sayHello();

  var bluePlayer = Player5.createBluePlayer(
    name: "oops",
    age: 21,
  );
  bluePlayer.sayHello();
  var redPlayer = Player5.createRedPlayer(
    "viin",
    22,
  );
  redPlayer.sayHello();

  var apiData = [
    {
      "name": "oops",
      "team": "red",
      "xp": 0,
    },
    {
      "name": "viin",
      "team": "red",
      "xp": 1,
    },
    {
      "name": "ed",
      "team": "red",
      "xp": 2,
    },
  ];

  apiData.forEach((playerJson) {
    var player = Player6.fromJson(playerJson);
    player.sayHello();
  });

  // Cascade Notation
  var oops = Player7(name: "oops", xp: 1200, team: Team.red) // ..은 바로 앞 변수를 받아온다
    ..name = "viin" // oops.name = "viin";
    ..xp = 12000 // oops.xp = 12000;
    ..team = Team.blue // oops.team = "blue";
    ..walk() // oops.walk();
    ..sayHello(); // oops.sayHello();

  var player8 = Player8(team: Team.red, name: "oops");
  player8.sayHello();
  var player9 = Player9(team: Team.red);
  player9.sayHello();
}

/**
 * ################# End main() ################
 */

void sayHello1(String name) {
  //  void는 return 이 없음
  print("hello $name");
}

String sayHello2(String name) {
  return "hello $name";
}

// 위 함수와 아래 함수가 같음
String sayHello3(String name) => "hello $name"; // => 가 return 을 대체함

String sayHello4(String name, int age, String country) {
  return "Hello $name, you are $age, and you come form $country";
}

// named arguments
String sayHello5({required String name, int? age, String country = 'seoul'}) {
  return "Hello $name, you are $age, and you come form $country";
}

// optional positional parameters
String sayHello6(String name, int age, [String? country = 'seoul']) =>
    "Hello $name, you are $age, and you come form $country";

String capitalizeName1(String? name) => name?.toUpperCase() ?? "oops";

String capitalizeName2(String? name) => name ??= "oops";

// typedef
typedef UserInfo = Map<String, String>;

String sayHi(UserInfo userInfo) {
  return "Hi ${userInfo['name']}";
}

/**
 * ################# End function ################
 */

class Player1 {
  final String name = 'oops';
  int xp = 1500;

  void sayHello1() {
    // this.name == name
    print("Hi my name is $name");
  }

  void sayHello2() {
    var name = "viin"; // final임에도 재 선언하면 this를 사용해서 선언할 수 있다. (권장 방법은 아님)
    print("Hi my name is ${this.name}"); // oops
    print("Hi my name is ${name}"); // viin
  }
}

class Player2 {
  late final String name;
  late int xp;

  Player2(String name, int xp) {
    // 함수같은 class, positional parameters
    this.name = name;
    this.xp = xp;
  }

  void sayHello() {
    print("Hi my name is $name, xp is $xp");
  }
}

// Player2의 단순화 버전
class Player3 {
  final String name;
  int xp;

  Player3(this.name, this.xp); // positional parameters(arguments)

  void sayHello() {
    print("Hi my name is $name, xp is $xp");
  }
}

class Player4 {
  final String name;
  int xp;
  String team;
  int age;

  Player4({
    required this.name,
    required this.xp,
    required this.team,
    required this.age,
  }); // positional parameters(arguments)

  void sayHello() {
    print("Hi my name is $name, xp: $xp, team: $team, age: $age");
  }
}

// named constructors
class Player5 {
  final String name;
  int xp, age;
  String team;

  Player5({
    required this.name,
    required this.xp,
    required this.team,
    required this.age,
  }); // positional parameters(arguments)

  Player5.createBluePlayer({required String name, required int age}) // 클론 (:)은 클래스를 초기화 한다.
      : this.age = age,
        this.name = name,
        this.team = 'blue',
        this.xp = 0;

  Player5.createRedPlayer(String name, int age) // 클론 (:)은 클래스를 초기화 한다.
      : this.age = age,
        this.name = name,
        this.team = 'red',
        this.xp = 0;

  void sayHello() {
    print("Hi my name is $name, xp: $xp, team: $team, age: $age");
  }
}

class Player6 {
  final String name;
  int xp;
  String team;

  Player6.fromJson(Map<String, dynamic> playerJson)
      : name = playerJson["name"],
        xp = playerJson["xp"],
        team = playerJson["team"];

  void sayHello() {
    print("Hi my name is $name, xp: $xp, team: $team");
  }
}

enum Team { red, blue }

abstract class Human1 {
  void walk();
}

class Player7 extends Human1 {
  String name;
  int xp;
  Team team;

  Player7({required this.name, required this.xp, required this.team});

  void walk() {
    print("I am walking");
  }

  void sayHello() {
    print("Hi my name is $name, xp: $xp, team: $team");
  }
}

class Human2 {
  final String name;
  Human2({required this.name}); // named arguments
  // Human2(this.name);
  void sayHello() {
    print("Hi my name is $name");
  }
}

class Player8 extends Human2 {
  final Team team;

  Player8({required this.team, required String name}) : super(name: name); //: super(name);

  @override
  void sayHello() {
    super.sayHello();
    print('and I play for $team');
  }
}

class Strong {
  final double strengthLevel = 1500.99;
}

class QuickRunner {
  void runQuick() {
    print("ruuuuuuuuuuuun!");
  }
}

class Tall {
  final double height = 1.99;
}

// Mixin
class Player9 with Strong, QuickRunner, Tall {
  final Team team;

  Player9({required this.team});

  void sayHello() {
    print("${team} - strong: $strengthLevel tall: $height");
  }
}
