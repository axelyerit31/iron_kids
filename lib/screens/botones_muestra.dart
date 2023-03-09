import 'package:flutter/material.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets.dart';

class BotonesMuestraScreen extends StatelessWidget {
  const BotonesMuestraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Muestra Botones"),
      ),
      body: ScreenApp(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Large", style: textTheme.titleMedium,),
            AppTheme.spacingWidget3,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                ButtonPrimary(
                  "Text",
                  size: 2,
                  iconLeft: Icons.favorite_border,
                  iconRight: Icons.arrow_forward_ios,
                ),

                ButtonSecondary(
                  "Text",
                  size: 2,
                ),

                ButtonText(
                  "Text",
                  size: 2,
                ),

                ButtonOutlined(
                  "Text",
                  size: 2,
                ),
              ],
            ),
            AppTheme.spacingWidget4,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                ButtonPrimary(
                  "Text",
                  size: 2,
                  disabled: true,
                  iconLeft: Icons.favorite_border,
                  iconRight: Icons.arrow_forward_ios,
                ),

                ButtonSecondary(
                  "Text",
                  size: 2,
                  disabled: true,
                ),

                ButtonText(
                  "Text",
                  size: 2,
                  disabled: true,
                ),

                ButtonOutlined(
                  "Text",
                  size: 2,
                  disabled: true,
                ),
              ],
            ),
            AppTheme.spacingWidget6,

            Text("Medium", style: textTheme.titleMedium,),
            AppTheme.spacingWidget3,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                ButtonPrimary(
                  "Text",
                  iconLeft: Icons.favorite_border,
                  iconRight: Icons.arrow_forward_ios,
                ),

                ButtonSecondary(
                  "Text",
                ),

                ButtonText(
                  "Text",
                ),

                ButtonOutlined(
                  "Text",
                ),
              ],
            ),
            AppTheme.spacingWidget4,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                ButtonPrimary(
                  "Text",
                  disabled: true,
                  iconLeft: Icons.favorite_border,
                  iconRight: Icons.arrow_forward_ios,
                ),

                ButtonSecondary(
                  "Text",
                  disabled: true,
                ),

                ButtonText(
                  "Text",
                  disabled: true,
                ),

                ButtonOutlined(
                  "Text",
                  disabled: true,
                ),
              ],
            ),
            AppTheme.spacingWidget6,

            Text("Small", style: textTheme.titleMedium,),
            AppTheme.spacingWidget3,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                ButtonPrimary(
                  "Text",
                  size: 0,
                  iconLeft: Icons.favorite_border,
                  iconRight: Icons.arrow_forward_ios,
                ),

                ButtonSecondary(
                  "Text",
                  size: 0,
                ),

                ButtonText(
                  "Text",
                  size: 0,
                ),

                ButtonOutlined(
                  "Text",
                  size: 0,
                ),
              ],
            ),
            AppTheme.spacingWidget4,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                ButtonPrimary(
                  "Text",
                  size: 0,
                  disabled: true,
                  iconLeft: Icons.favorite_border,
                  iconRight: Icons.arrow_forward_ios,
                ),

                ButtonSecondary(
                  "Text",
                  size: 0,
                  disabled: true,
                ),

                ButtonText(
                  "Text",
                  size: 0,
                  disabled: true,
                ),

                ButtonOutlined(
                  "Text",
                  size: 0,
                  disabled: true,
                ),
              ],
            ),
            AppTheme.spacingWidget6,
          ]
        ),
      ),
    );
  }
}