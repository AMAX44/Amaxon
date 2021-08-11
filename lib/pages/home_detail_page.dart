import 'package:catalog_app/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog_app/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            '\$ ${catalog.price}'.text.bold.xl4.red800.make(),
            10.heightBox,
            AddToCart(
              catalog: catalog,
              ).wh(130, 50)
          ],
        ).p12(),
      ),
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.network(catalog.image))
                  .h32(context),
              Expanded(
                child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: SingleChildScrollView(
                    child: Container(
                        color: context.cardColor,
                        width: context.screenWidth,
                        child: Column(
                          children: [
                            catalog.name.text.xl4
                                .color(context.accentColor)
                                .bold
                                .make(),
                            catalog.desc.text.xl
                                .color(context.accentColor)
                                .make(),
                            'Kasd eirmod labore kasd aliquyam sadipscing lorem accusam sit aliquyam, elitr sed vero sea sea amet. Erat sea rebum duo lorem vero vero lorem eos lorem. Et et tempor aliquyam takimata est nonumy, sit dolores at takimata dolor consetetur ipsum. Et at dolore kasd et ea, et amet kasd lorem.' 
                            .text
                            .lg
                            .make()
                            .p(16)   
                          ],
                        ).py64()),
                  ),
                ),
              ),
            ],
          )
        ),
    );
  }
}
