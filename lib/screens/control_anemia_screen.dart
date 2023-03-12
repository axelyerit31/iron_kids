import 'package:flutter/material.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets/screen_app.dart';

class ControlAnemiaScreen extends StatefulWidget {
  const ControlAnemiaScreen({super.key});

  @override
  State<ControlAnemiaScreen> createState() => _ControlAnemiaScreenState();
}

class _ControlAnemiaScreenState extends State<ControlAnemiaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenApp(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTheme.spacingWidget10,
            Text(
              'Control de Anemia',
              style:
                  textTheme.headlineMedium!.copyWith(color: AppTheme.gray800),
            ),
            AppTheme.spacingWidget7,
            const _NotificationCard(),
            AppTheme.spacingWidget7,
            Text(
              'Mis hijitos',
              style: textTheme.headlineSmall!.copyWith(color: AppTheme.gray800),
            ),
            AppTheme.spacingWidget7,
          ],
        ),
      ),
    );
    ;
  }
}

//tarjeta de notificaciones

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.gray100,
        borderRadius: AppTheme.borderRadiusL,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(9.0),
            decoration: BoxDecoration(
              color: AppTheme.gray200,
              borderRadius: AppTheme.borderRadiusS,
            ),
            child: Icon(
              Icons.notifications_active_outlined,
              size: 28,
              color: AppTheme.gray700,
            ),
          ),
          AppTheme.spacingWidget4,
          Expanded(
            child: Column(
              children: [
                Text(
                  'Luquitas tiene una cita el 10 de Marzo',
                  style: textTheme.bodyMediumSemiBold.copyWith(
                    color: AppTheme.primary600,
                  ),
                  textAlign: TextAlign.left,
                  softWrap: true,
                ),
                AppTheme.spacingWidget2,
                Text(
                  'Recuerda que es su tercer chequeo para el control de la anemia.',
                  style: textTheme.bodyMedium,
                  softWrap: true,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
