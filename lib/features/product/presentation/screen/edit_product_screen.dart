import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

import '../../controller/controller.dart';

class EditProductScreen extends HookWidget {
  final int id;
  const EditProductScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final productBloc = useBloc<ProductBloc>();
    final editProductBloc = useBloc<EditProductBloc>();

    useEffect(() {
      productBloc.add(ProductEvent.fetch(id));
      return null;
    }, []);

    return FScaffold(
      header: FHeader(title: Text('Edit Product')),
      child: Container(),
    );
  }
}
