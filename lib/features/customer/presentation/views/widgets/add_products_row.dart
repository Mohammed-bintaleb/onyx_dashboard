import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_localizations.dart';
import '../../../domain/Entities/product_row_entity.dart';
import '../../manger/product_cubit/product_cubit.dart';
import '../../manger/product_cubit/product_state.dart';
import 'add_product_table_header.dart';
import 'add_row_button.dart';
import 'grand_total.dart';
import 'product_row_widget.dart';

class AddProductsRow extends StatelessWidget {
  final VoidCallback onContinue;
  final Function(List<ProductRowEntity> products, double grandTotal)
  onProductsUpdated;

  const AddProductsRow({
    super.key,
    required this.onContinue,
    required this.onProductsUpdated,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductCubit>();
    final t = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocListener<ProductCubit, ProductState>(
        listener: (context, state) {
          onProductsUpdated(state.products, state.grandTotal);
        },
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            return Column(
              children: [
                const AddProductTableHeader(),
                ...List.generate(
                  state.products.length,
                  (index) => ProductRowWidget(
                    product: state.products[index],
                    productDatabase: cubit.productDatabase,
                    onNameChanged: (newName) =>
                        cubit.updateProductName(index, newName),
                    onQuantityChanged: (quantity) =>
                        cubit.updateQuantity(index, quantity),
                    onDelete: () => cubit.deleteProduct(index),
                  ),
                ),
                GrandTotal(grandTotal: state.grandTotal),
                const SizedBox(height: 16),
                AddRowButton(onPressed: cubit.addProduct),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: onContinue,
                      child: Text(t.translate('continue')),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
