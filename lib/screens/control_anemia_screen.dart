import 'package:flutter/material.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets.dart';

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
                style:
                    textTheme.headlineMedium!.copyWith(color: AppTheme.gray800),
              ),
              AppTheme.spacingWidget7,
              //Tarjeta de notificacion
              const _NotificationCard(),

              /*------Seccion de mis hijitos --------- */
              AppTheme.spacingWidget7,
              Text(
                'Mis hijitos',
                style: textTheme.titleMedium!.copyWith(color: AppTheme.gray800),
              ),
              AppTheme.spacingWidget7,
              //Botones de los hijos
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
                style: textTheme.titleMedium!.copyWith(color: AppTheme.gray700),
              ),
              AppTheme.spacingWidget6,

              //las pildoras de los tags de las citas del hijo
              Row(
                children: [
                  const _PillTag(name: 'Citas pasadas'),
                  AppTheme.spacingWidget4,
                  const _PillTag(
                    name: 'Citas futuras',
                    active: true,
                  ),
                ],
              ),
              AppTheme.spacingWidget7,
              const _CitaCard(),
              AppTheme.spacingWidget7,
              ButtonOutlined(
                'Agregar nueva cita futura',
                size: 2,
                iconRight: Icons.arrow_forward_ios,
                onPressed: () {
                  showDialog(
                    context: context,
<<<<<<< HEAD
                    child: _ModalAddCita(
                      citafutura: true,
                    ),
=======
                    builder: (BuildContext context) {
                      return _ModalAddCita(
                        citafutura: true,
                      );
                    }
>>>>>>> f6ebbe74256530b8799cb4bd53e80f1ab6508b42
                  );
                  // AlertDialog(
                  //   content: _ModalAddCita(citafutura: true),
                  // );
                  // showModalBottomSheet(
                  //   backgroundColor: Colors.transparent,
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return _ModalAddCita(
                  //       citafutura: true,
                  //     );
                  //   },
                  // );
                },
              ),
              AppTheme.spacingWidget10,
              AppTheme.spacingWidget5,
            ],
          ),
        ),
      ),
    );
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

class _PillTag extends StatelessWidget {
  final String name;
  final bool active;
  const _PillTag({required this.name, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: (active) ? AppTheme.primary50 : AppTheme.gray100,
        borderRadius: AppTheme.borderRadiusL,
      ),
      child: InkWell(
        borderRadius: AppTheme.borderRadiusL,
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacing5,
            vertical: AppTheme.spacing3,
          ),
          child: Text(
            name,
            style: (active)
                ? textTheme.labelMedium!.copyWith(color: AppTheme.primary600)
                : textTheme.labelMedium!.copyWith(color: AppTheme.gray500),
          ),
        ),
      ),
    );
  }
}

class _CitaCard extends StatelessWidget {
  const _CitaCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.gray100,
        borderRadius: AppTheme.borderRadiusL + BorderRadius.circular(4),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fecha',
              style: textTheme.bodySmall!.copyWith(color: AppTheme.gray500),
            ),
            AppTheme.spacingWidget5,
            Text(
              '10 mar 2023',
              style:
                  textTheme.bodySmallSemiBold.copyWith(color: AppTheme.gray500),
            )
          ],
        ),
        AppTheme.spacingWidget7,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Descripción',
                style: textTheme.bodySmall!.copyWith(color: AppTheme.gray500),
              ),
              AppTheme.spacingWidget5,
              Text(
                'Tercer chequeo de control de la anemia',
                style: textTheme.bodySmall!.copyWith(color: AppTheme.gray700),
                softWrap: true,
              )
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
  final bool citafutura;
  _ModalAddCita({
    this.citafutura = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('prueba'),
      content: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppTheme.gray100,
            borderRadius: AppTheme.borderRadiusXL,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      (citafutura)
                          ? 'Nuevo registro de cita futura'
                          : 'Nuevo registro de control de Luquitas',
                      style: textTheme.headlineSmall!
                          .copyWith(color: AppTheme.gray800),
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
              AppTheme.spacingWidget6,
              InputField(
                controller: controllerFirst,
                placeholder: (citafutura) ? 'dd/mm/aa' : 'El peso de su hijo',
                label: (citafutura)
                    ? '¿Cuándo será la cita? '
                    : '¿Cuánto pesa su hijo(a)? (Kg)',
                iconLeft: (citafutura)
                    ? Icon(
                        Icons.date_range_outlined,
                        color: AppTheme.gray400,
                      )
                    : Icon(
                        Icons.abc,
                        color: AppTheme.gray400,
                      ),
              ),
              AppTheme.spacingWidget6,
              InputField(
                controller: controllerSecond,
                placeholder: (citafutura) ? 'ej: segundo chequeo' : '0.0 g/dL',
                label: (citafutura)
                    ? '¿Sobre que será la cita?'
                    : '¿Cuánta hemoglobina tiene su niño(a)?',
                iconLeft: (citafutura)
                    ? Icon(
                        Icons.short_text_rounded,
                        color: AppTheme.gray400,
                      )
                    : Icon(
                        Icons.bar_chart_rounded,
                        color: AppTheme.gray400,
                      ),
              ),
              AppTheme.spacingWidget6,
              const ButtonPrimary(
                'Guardar registro',
                size: 2,
              ),
            ],
          ),
        ),
      ),
      actions: const [],
    );
  }
}
/* 
AlertDialog alerta = new AlertDialog(
      title: Wrap(
        direction: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: new Text("Editar encabezado: ",
                style: TextStyle(fontFamily: "WorkSans", fontWeight: FontWeight.w600, fontSize: ResponsiveFlutter.of(context).fontSize(2.1))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 3),
            child: new Text("$frase", style: TextStyle(fontFamily: "WorkSans", fontSize: ResponsiveFlutter.of(context).fontSize(2.05), fontWeight: FontWeight.w400)),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: new TextFormField(
          initialValue: "",
          //maxLength: 18,
          style: estiloContenidoRegular(context),
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.greenAccent[700]),
            ),
            //helperText: "Tienen que ser 18 caracteres, ¿podrás?",
            helperStyle: TextStyle(fontFamily: "WorkSans", fontSize: ResponsiveFlutter.of(context).fontSize(1.3)),
            hintText: "Nuevo encabezado",
            hintStyle: estiloHint(context),
          ),
          onFieldSubmitted: (String value) {
            if(value != ""){
              celdas[indice].texto = value;
              contenidoFrases[indice] = value;
              guardarPreferencias(contenidoFrases, contenidoFechas, contenidoDescripcion);
              Navigator.pop(context, editarEncabezado);
            }
            Navigator.pop(context);
            CeldaItem.mostrarCeldaDialogo(d, contenidoFechas[indice], indice, contenidoDescripcion[indice], context, 0);

            /* if (manejador == 1) {
              //Transicion sin animacion
              Navigator.pushReplacement(context, PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => Menu(),
                transitionDuration: Duration(seconds: 0),
              ),);
            } */
          },
          onChanged: (String value) {
            d = value;
          },
        ),
      ),
      actions: [],
  ); */