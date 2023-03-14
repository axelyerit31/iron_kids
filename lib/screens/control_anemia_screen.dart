import 'package:flutter/material.dart';
import 'package:iron_kids/nav_bar_routes.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets.dart';
import 'package:iron_kids/styles/widgets/filter_chips.dart';

class ControlAnemiaScreen extends StatefulWidget {
  const ControlAnemiaScreen({super.key});

  @override
  State<ControlAnemiaScreen> createState() => _ControlAnemiaScreenState();
}

class _ControlAnemiaScreenState extends State<ControlAnemiaScreen> {
  bool citaPasada = false;
  bool isSelectedFirst = false;
  bool isSelectedSecond = true;
  String item1 = "Fecha";
  String dataItem1 = "10 mar 2023";
  String item2 = "Descripción";
  String dataItem2 = "Tercer chequeo de control de la anemia";

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKeys[indexControlAnemiaScreen],
        onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
              return Scaffold(
                body: ScreenApp(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppTheme.spacingWidget10,
                        //Titulo
                        Text(
                          'Control de Anemia',
                          style: textTheme.headlineMedium!
                              .copyWith(color: AppTheme.gray800),
                        ),
                        AppTheme.spacingWidget7,
                        //Tarjeta de notificacion
                        const _NotificationCard(),

                        //*------Seccion de mis hijitos --------- */

                        AppTheme.spacingWidget7,
                        Text(
                          'Mis hijitos',
                          style: textTheme.titleMedium!
                              .copyWith(color: AppTheme.gray800),
                        ),
                        AppTheme.spacingWidget7,

                        // * Botones de los hijos
                        Row(
                          children: [
                            const CardHijo(
                              linkImg:
                                  'https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/AvatarChild%2Fboy_avatar.png?alt=media&token=11a7b731-6753-4dbe-a095-4249be3fd1d9',
                              nombre: 'Luquitas',
                              border: true,
                            ),
                            AppTheme.spacingWidget4,
                            const CardHijo(
                                linkImg:
                                    'https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/AvatarChild%2Fgirl_avatar.png?alt=media&token=0af88513-e1fb-416f-9dfc-88b561635785',
                                nombre: 'Sofia'),
                          ],
                        ),
                        AppTheme.spacingWidget7,
                        /*------Seccion de mis hijitos : segun de control de hijo seleccionado --------- */
                        Text(
                          'Control de Luquitas',
                          style: textTheme.titleMedium!
                              .copyWith(color: AppTheme.gray700),
                        ),
                        AppTheme.spacingWidget6,

                        //las pildoras de los tags de las citas del hijo
                        Row(
                          children: [
                            // Citas pasadas
                            MyFilterChip(
                              selected: isSelectedFirst,
                              onSelected: (value) {
                                setState(() {
                                  citaPasada = true;
                                  isSelectedFirst = true;
                                  isSelectedSecond = false;
                                  item1 = "Fecha";
                                  dataItem1 = "03 mar 2023";
                                  item2 = "Hemoglobina";
                                  dataItem2 = "10.2 g/dL";
                                });
                              },
                              label: 'Citas pasadas',
                            ),
                            AppTheme.spacingWidget4,

                            // Cita futura
                            MyFilterChip(
                              selected: isSelectedSecond,
                              onSelected: (value) {
                                setState(() {
                                  citaPasada = false;
                                  isSelectedSecond = true;
                                  isSelectedFirst = false;
                                  item1 = "Fecha";
                                  dataItem1 = "10 mar 2023";
                                  item2 = "Descripción";
                                  dataItem2 =
                                      "Tercer chequeo de control de la anemia";
                                });
                              },
                              label: 'Citas futuras',
                            ),
                          ],
                        ),
                        AppTheme.spacingWidget7,
                        _CitaCard(
                          item1: item1,
                          dataItem1: dataItem1,
                          item2: item2,
                          dataItem2: dataItem2,
                          citaPasada: citaPasada,
                        ),
                        AppTheme.spacingWidget7,
                        ButtonOutlined(
                          (citaPasada)
                              ? 'Agregar registro de control'
                              : 'Agregar nueva cita futura',
                          size: 2,
                          iconRight: Icons.arrow_forward_ios,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return _ModalAddCita(
                                    citaPasada: citaPasada,
                                  );
                                });
                          },
                        ),

                        AppTheme.spacingWidget10,
                        AppTheme.spacingWidget5,
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}

//tarjeta de notificaciones

class _NotificationCard extends StatelessWidget {
  const _NotificationCard();

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

class _CitaCard extends StatelessWidget {
  final String item1;
  final String item2;
  final String dataItem1;
  final String dataItem2;
  final bool citaPasada;
  //final bool citapasada;
  const _CitaCard(
      {required this.item1,
      required this.dataItem1,
      required this.item2,
      required this.dataItem2,
      required this.citaPasada});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.gray100,
        borderRadius: AppTheme.borderRadiusL + BorderRadius.circular(4),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Fecha
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item1, //'Fecha'
              style: textTheme.bodySmall!.copyWith(color: AppTheme.gray500),
            ),
            AppTheme.spacingWidget5,
            Text(
              dataItem1, //'10 mar 2023'
              style:
                  textTheme.bodySmallSemiBold.copyWith(color: AppTheme.gray500),
            )
          ],
        ),
        AppTheme.spacingWidget7,
        // Descripcion
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item2, //'Descripción'
                style: textTheme.bodySmall!.copyWith(color: AppTheme.gray500),
              ),
              AppTheme.spacingWidget5,
              Text(
                dataItem2, //'Tercer chequeo de control de la anemia'
                style: textTheme.bodySmall!.copyWith(color: AppTheme.gray700),
                softWrap: true,
              )
            ],
          ),
        ),
        if (citaPasada)
          Expanded(
            child: Row(
              children: [
                AppTheme.spacingWidget7,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Peso',
                      style: textTheme.bodySmall!
                          .copyWith(color: AppTheme.gray500),
                    ),
                    AppTheme.spacingWidget5,
                    Text(
                      '24 kg',
                      style: textTheme.bodySmall!
                          .copyWith(color: AppTheme.gray700),
                      softWrap: true,
                    )
                  ],
                ),
              ],
            ),
          ),
      ]),
    );
  }
}

class _ModalAddCita extends StatelessWidget {
  final TextEditingController controllerFirst = TextEditingController();
  final TextEditingController controllerSecond = TextEditingController();
  final bool citaPasada;
  _ModalAddCita({
    this.citaPasada = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              (!citaPasada)
                  ? 'Nuevo registro de cita futura'
                  : 'Nuevo registro de control de Luquitas',
              style: textTheme.headlineSmall!.copyWith(color: AppTheme.gray800),
              softWrap: true,
            ),
          ),
          ButtonSecondary(
            'Cerrar',
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTheme.spacingWidget6,
          InputField(
            controller: controllerFirst,
            placeholder: (!citaPasada) ? 'dd/mm/aa' : 'El peso de su hijo',
            label: (!citaPasada)
                ? '¿Cuándo será la cita? '
                : '¿Cuánto pesa su hijo(a)? (Kg)',
            iconLeft: (citaPasada) ? Icons.date_range_outlined : Icons.abc,
          ),
          AppTheme.spacingWidget6,
          InputField(
              controller: controllerSecond,
              placeholder: (!citaPasada) ? 'ej: segundo chequeo' : '0.0 g/dL',
              label: (!citaPasada)
                  ? '¿Sobre que será la cita?'
                  : '¿Cuánta hemoglobina tiene su niño(a)?',
              iconLeft: (!citaPasada)
                  ? Icons.short_text_rounded
                  : Icons.bar_chart_rounded),
          AppTheme.spacingWidget6,
          const ButtonPrimary(
            'Guardar registro',
            size: 2,
          ),
        ],
      ),
      actions: const [],
    );
  }
}
