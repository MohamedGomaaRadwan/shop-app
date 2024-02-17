import 'package:shop/core/usecases/app_usecases.dart';
import 'package:shop/modules/products/data/model/product_model.dart';
import 'package:shop/modules/products/domain/repositories/product_repository.dart';

class AddProductUseCase extends AppUseCase<void,ProductModel>{
  final ProductRepository productRepositoryImpl;
  AddProductUseCase(this.productRepositoryImpl);

  @override
  void execute(params){
    return productRepositoryImpl.addProduct(params);
  }

}