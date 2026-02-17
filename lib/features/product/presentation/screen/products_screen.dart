import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:merchant_product/features/product/controller/controller.dart';
import 'package:merchant_product/features/product/domain/domain.dart';
import 'package:merchant_product/features/product/router/router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:merchant_product/ui/infinite_scroll_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsScreen extends HookWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = useBloc<ProductsBloc>();
    final scrollController = useScrollController();

    useEffect(() {
      bloc.add(ProductsEvent.fetch());
      return null;
    }, []);

    return FScaffold(
      header: FHeader(
        title: const Text('Products'),
        suffixes: [
          FButton.icon(
            variant: .ghost,
            onPress: () {
              context.pushNamed(ProductRoutes.create.name);
            },
            child: const Icon(FIcons.plus),
          ),
        ],
      ),
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: (products) => Skeletonizer(
              enabled: true,
              child: InfiniteScrollItem(
                items: products,
                itemBuilder: (context, index) =>
                    _Item(product: products[index]),
                itemSkeletonBuilder: (context) =>
                    _Item(product: ProductEntity.init()),
                controller: scrollController,
              ),
            ),
            loaded: (products, hasReachedMax) {
              if (products.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: .min,
                    children: [
                      Icon(
                        FIcons.package,
                        size: 128,
                        color: context.theme.colors.border,
                      ),
                      Text(
                        'No Products Found',
                        style: context.theme.typography.sm,
                      ),
                    ],
                  ),
                );
              }
              return RefreshIndicator(
                onRefresh: () async {
                  bloc.add(ProductsEvent.fetch());
                },
                child: InfiniteScrollItem(
                  items: products,
                  hasReachedMax: hasReachedMax,
                  onLoadMore: () {
                    bloc.add(ProductsEvent.loadMore());
                  },
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) => SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final item = products[index];
                    return _Item(
                      product: item,
                      onTap: () {
                        context.pushNamed(
                          ProductRoutes.product.name,
                          pathParameters: {'id': item.id.toString()},
                        );
                      },
                    );
                  },
                  itemSkeletonBuilder: (context) =>
                      _Item(product: ProductEntity.init()),
                  controller: scrollController,
                ),
              );
            },
            orElse: () => SizedBox.shrink(),
          );
        },
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback? onTap;
  const _Item({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FCard(
        title: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Expanded(
              child: Text(
                product.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: .circle,
                color: switch (product.status) {
                  ProductStatus.active => null,
                  ProductStatus.draft => context.theme.colors.destructive,
                  ProductStatus.unknown => null,
                },
              ),
            ),
          ],
        ),
        subtitle: Text(product.description, maxLines: 2, overflow: .ellipsis),
      ),
    );
  }
}
