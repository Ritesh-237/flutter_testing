






/*

* setup : 
var getIt = GetIt.instance;
@InjectableInit()
void configureDependencies() => getIt.init();


@Injectable()
class HomeBloc{
  final Usecase usecase;
  final DataSource dataSource;
  HomeBloc(this.usecase,this.dataSource);
}

@lazysingleton
class Usecase{
}

@Singleton(dispose: disposeDataSource)  
class DataSource {  
  
  void dispose() {  
   
  }  
} 
FutureOr disposeDataSource(DataSource instance){  
   instance.dispose();  
} 


* usage : 

HomeBloc homeBloc = getIt<HomeBloc>()

*/