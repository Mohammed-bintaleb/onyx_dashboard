import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onyx_dashboard/features/customer/domain/Entities/product_data_entity.dart';
import 'package:onyx_dashboard/features/customer/domain/Entities/product_row_entity.dart';

import '../../../domain/use_case/fetch_product_data_use_case.dart';
import '../../../domain/use_case/fetch_product_rows_use_case.dart';
import '../../../domain/use_case/save_product_rows_use_case.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final FetchProductDataUseCase fetchProductDataUseCase;
  final FetchProductRowsUseCase fetchProductRowsUseCase;
  final SaveProductRowsUseCase saveProductRowsUseCase;

  ProductCubit({
    required this.fetchProductDataUseCase,
    required this.fetchProductRowsUseCase,
    required this.saveProductRowsUseCase,
  }) : super(ProductInitial());

  Future<void> fetchAllProductData() async {
    emit(ProductLoading());
    final productDataResult = await fetchProductDataUseCase.call();
    final productRowsResult = await fetchProductRowsUseCase.call();

    productDataResult.fold((failure) => emit(ProductError(failure.message)), (
      productData,
    ) {
      productRowsResult.fold(
        (failure) => emit(ProductError(failure.message)),
        (productRows) => emit(ProductLoaded(productData, productRows)),
      );
    });
  }

  Future<void> saveProductRows(List<ProductRowEntity> rows) async {
    await saveProductRowsUseCase.call(rows);
    fetchAllProductData(); // Refresh
  }
}
