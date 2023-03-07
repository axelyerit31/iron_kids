import 'package:flutter/material.dart';
import 'package:iron_kids/styles/appTheme.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Niños de Hierro',
              style: AppTheme.displayLarge(context),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  image: DecorationImage(
                    image: NetworkImage('https://via.placeholder.com/50x50'),
                    fit: BoxFit.cover,
                  )),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          
          //Spacing 10px
          const SizedBox(height: 10,),

          // Tarjeta control de anemia
          Card(
            shape: RoundedRectangleBorder(borderRadius: AppTheme.borderRadiusL),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Control de Anemia',
                        style: AppTheme.titleLarge(context),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 200,
                        child: Text(
                          'Lleva un control de la anemia y registra citas pasadas o futuras.',
                          style: AppTheme.bodyLarge(context),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: const Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Spacing 10px
          const SizedBox(height: 10,),

          // Recomendados
          Column(
            children: [
              // Fila con espacio entre los elementos
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Recomendados',
                    style: AppTheme.headlineSmall(context),
                  ),
                  Text(
                    'Ver más',
                    style: AppTheme.labelLarge(context),
                  ),
                ],
              ),

              //Spacing 10px
              AppTheme.spacingWidget4,
          
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(5, (index) {
                    return SizedBox(
                      height: 280,
                      width: 200,
                      child: Card(
                        color: Colors.grey[100],
                        shape: RoundedRectangleBorder(borderRadius: AppTheme.borderRadiusL),
                        margin: const EdgeInsets.only(
                          right: 10
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      AppTheme.borderRadiusL,
                                  image: const DecorationImage(
                                    image: NetworkImage(
                                      'https://via.placeholder.com/150x150',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(AppTheme.spacing3),
                                  child: Text(
                                    'Chaufa con Sangrecita',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(Icons.timer),
                                        SizedBox(width: 4),
                                        Text('12 min'),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(Icons.thumb_up),
                                        SizedBox(width: 4),
                                        Text('128'),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(Icons.child_care),
                                    SizedBox(width: 4),
                                    Text('12 a 23 meses'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ]),
      )
    );
  }
}


/* Gpt, dame el codigo para un diseño en flutter, los estilos son extraidos del widget: Theme.of(context).textTheme.

fila (con for de 5 para mostrar 5 veces el card de debajo)
  card
    column
      container con bordes redondeado en 16 px, (imagen en decoration)
        "Chaufa con Sangrecita", ubicado con Alignment.end
      Columna
        Fila
          Fila (Con mainaxissize min)
            Icono tiempo
            "12 min"
          Fila (Con mainaxissize min)
            Icono like
            "128"
          Fila (Con mainaxissize min)
            Icono bebe
            "12 a 23 meses"
          


*/
