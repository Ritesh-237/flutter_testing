// It will create a single instance of the clas

class Singleton {
  static final _instance = Singleton._internal();

  static Singleton get instance => _instance;

  Singleton._internal();
}
