import 'package:flutter/material.dart';
import 'package:iron_kids/nav_bar_routes.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets.dart';
import 'package:iron_kids/styles/widgets/filter_chips.dart';

List<List<String>> citasPasadasList = [
];

List<List<String>> citasFuturasList = [
];

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
                          style: textTheme.headlineLarge,
                        ),
                        AppTheme.spacingWidget7,


                        //Tarjeta de notificacion
                        citasFuturasList.isNotEmpty ? const _NotificationCard() : Container(),

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
                          children: const [
                            /* const CardHijo(
                              linkImg:
                                  'https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/AvatarChild%2Fboy_avatar.png?alt=media&token=11a7b731-6753-4dbe-a095-4249be3fd1d9',
                              nombre: 'Luquitas',
                            ),
                            AppTheme.spacingWidget4, */
                            CardHijo(
                                linkImg:
                                    'https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/AvatarChild%2Fgirl_avatar_2.png?alt=media&token=8f716cc4-93c4-4d80-8ba1-9c984cd454e9',
                                nombre: 'Maia'),
                          ],
                        ),
                        AppTheme.spacingWidget7,

                        /*------Seccion de mis hijitos : segun de control de hijo seleccionado --------- */
                        Text(
                          'Control de Maia',
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
                                    onPressed: () {
                                      setState(() {
                                        citaPasada
                                        ? citasPasadasList.add(
                                          [
                                            "17 mar 2023",
                                            controllerFirst.text,
                                            controllerSecond.text
                                          ]
                                        )
                                        : citasFuturasList.add(
                                          [
                                            controllerFirst.text,
                                            controllerSecond.text
                                          ]
                                        );

                                        controllerFirst.clear();
                                        controllerSecond.clear();
                                        Navigator.pop(context);
                                      });
                                    });
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
            child: citasFuturasList.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Maia tiene una cita el ${citasFuturasList[0][0]}',
                    style: textTheme.bodyMediumSemiBold.copyWith(
                      color: AppTheme.primary600,
                    ),
                    textAlign: TextAlign.left,
                    softWrap: true,
                  ),
                  AppTheme.spacingWidget2,
                  Text(
                    'Recuerda que es su ${citasFuturasList[0][1].toLowerCase()}',
                    style: textTheme.bodyMedium,
                    softWrap: true,
                  )
                ],
              )
            : Container()
          )
        ],
      ),
    );
  }
}

class _CitaCard extends StatelessWidget {
  final bool citaPasada;

  //final bool citapasada;
  const _CitaCard({
    required this.citaPasada
  });

  @override
  Widget build(BuildContext context) {

    List<List<String>> citasSeleccionadas = citaPasada ? citasPasadasList : citasFuturasList;

    return Container(
      padding: const EdgeInsets.only(
        top: AppTheme.spacing6,
        bottom: AppTheme.spacing3,
        left: AppTheme.spacing6,
        right: AppTheme.spacing6,
      ),
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

            // Fecha
            Text(
              "Fecha",
              style: textTheme.bodySmall!.copyWith(color: AppTheme.gray500),
            ),
            AppTheme.spacingWidget5,

            // Contenido Fecha
            for (int i = 0; i < citasSeleccionadas.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: AppTheme.spacing4),
                child: Text(
                  citasSeleccionadas[i][0], //'10 mar 2023'
                  style:
                      textTheme.bodySmallSemiBold.copyWith(color: AppTheme.gray500),
                ),
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

              // Hemoglobina / Descripcion
              Text(
                citaPasada ? "Hemoglobina" : "Descripción", 
                style: textTheme.bodySmall!.copyWith(color: AppTheme.gray500),
              ),

              AppTheme.spacingWidget5,

              // Contenido Fecha
              for (int i = 0; i < citasSeleccionadas.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: AppTheme.spacing4),
                  child: Text(
                    citasSeleccionadas[i][1],
                    style: textTheme.bodySmall!.copyWith(color: AppTheme.gray700),
                  ),
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

                    // Peso
                    Text(
                      "Peso", 
                      style: textTheme.bodySmall!.copyWith(color: AppTheme.gray500),
                    ),

                    AppTheme.spacingWidget5,

                    // Contenido Fecha
                    for (int i = 0; i < citasSeleccionadas.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: AppTheme.spacing4),
                        child: Text(
                          citasSeleccionadas[i][2],
                          style: textTheme.bodySmall!.copyWith(color: AppTheme.gray700),
                          softWrap: true,
                        ),
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

final TextEditingController controllerFirst = TextEditingController();
final TextEditingController controllerSecond = TextEditingController();

class _ModalAddCita extends StatelessWidget {
  final bool citaPasada;
  final VoidCallback? onPressed;
  const _ModalAddCita({required this.citaPasada, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Nuevo registro',
            style: textTheme.headlineSmall!.copyWith(color: AppTheme.gray800),
            softWrap: true,
          ),
          ButtonSecondary(
            'Cerrar',
            size: 0,
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
          AppTheme.spacingWidget4,
          InputField(
            controller: controllerFirst,
            placeholder: (!citaPasada) ? 'dd/mm/aa' : '0.0 g/dL',
            label: (!citaPasada)
                ? '¿Cuándo será la cita? '
                : '¿Cuánta hemoglobina tiene su niño(a)?',
            iconLeft: (citaPasada) ? Icons.water_drop_outlined : Icons.date_range_outlined,
          ),
          AppTheme.spacingWidget6,
          InputField(
              controller: controllerSecond,
              placeholder: (!citaPasada) ? 'ej: segundo chequeo' : 'El peso de su hijo',
              label: (!citaPasada)
                  ? '¿Sobre que será la cita?'
                  : '¿Cuánto pesa su hijo(a)? (Kg)',
              iconLeft: (!citaPasada)
                  ? Icons.short_text_rounded
                  : Icons.scale),
          AppTheme.spacingWidget6,
          ButtonPrimary(
            'Guardar registro',
            size: 2,
            onPressed: onPressed ?? () {},
          ),
        ],
      ),
      actions: const [],
    );
  }
}
