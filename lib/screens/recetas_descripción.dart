import 'package:flutter/material.dart';

class RecetaInfo extends StatelessWidget {
  String descripcion = "Es un plato delicioso y nutritivo que combina la tradición culinaria peruana con influencias de la cocina italiana. Además, es fácil de preparar y se puede disfrutar en cualquier momento del día.";

  @override
  Widget build(BuildContext context) {
    final titulo = Text('Purecito Verde');
    final boton_etiqueta = TextButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors .amber),
            padding: MaterialStatePropertyAll(EdgeInsets.all(6)),
            shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                )
            )
        ),
        child:  const Center(
          child: Text('Costa',
            style: TextStyle(
                fontSize: 15,
                color: Colors.white
            ),
          ),
        )
    );
    final titulo_boton = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        titulo,
        boton_etiqueta
      ],
    );
    final descripcion_receta = Container(
      child: Text(
        descripcion
      ),
    );
    final palito = Container(
      height: 20,
      width: 1.5,
      color: Colors.black,
    );
    final duracion = RichText(
        text: const TextSpan(
          children: [
            WidgetSpan(
              child: Icon(Icons.access_time_filled_sharp)
            ),
            TextSpan(
              style: TextStyle(
                  color: Colors.black
              ),
              text: '10 min',
            ),
          ]
        )
    );
    final edad_consumo = RichText(
        text: TextSpan(
            children: [
              WidgetSpan(
                  child: Icon(Icons.child_care_rounded)
              ),
              TextSpan(
                text: '9 a 11 meses',
                style: TextStyle(
                  color: Colors.black
                )
              )
            ]
        )
    );
    final likes = RichText(
        text: TextSpan(
            children: [
              WidgetSpan(
                  child: Icon(Icons.thumb_up)
              ),
              TextSpan(
                text: ' 24 me gusta',
                style: TextStyle(
                  color: Colors.black
                )
              ),
            ]
        )
    );
    final estadisticas = Row(
      children: [
        duracion,
        palito,
        edad_consumo,
        palito,
        likes
      ],
    );
    final cuadro_alimenticio = Container(
      child: Row(
        children: [
          Column(
           children: [
             Text('Energía'),
             Text('221 kcal')
           ],
          ),
          Column(
            children: [
              Text('Proteína'),
              Text('7,7 g')
            ],
          ),
          Column(
            children: [
              Text('Hierro'),
              Text('0,7 mg')
            ],
          ),
          Column(
            children: [
              Text('Retinol'),
              Text('32,7 ug')
            ],
          ),
          Column(
            children: [
              Text('Zinc'),
              Text('0,8 mg')
            ],
          ),
        ],
      ),
    );

    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          titulo_boton,
          estadisticas,
          descripcion_receta,
          cuadro_alimenticio
        ]
      ),
    );
  }
}

class RecetaUse extends StatefulWidget {
  @override
  State<RecetaUse> createState() => _RecetaUseState();
}
class _RecetaUseState extends State<RecetaUse> {
  @override
  Widget build(BuildContext context) {
    final textop = Text('Número de porciones:');
    final porciones = Container(
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.remove_circle)
          ),
          Container(
            width: 20,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: '01',
              ),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_circle)
          )
        ],
      ),
    );
    final texto_porciones = Row(
      children: [
        textop,
        porciones
      ],
    );
    final List<String> opciones = ['Ingredientes', 'Paso a paso', 'Experincias'];
    final botones_opciones = SingleChildScrollView(
        child: Row(
          children: opciones.map((option) {
            return FilterChip(
              backgroundColor: Colors.amber,
              shape: RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(10)
              ),
              label: Text(option),
              onSelected: (value) {},
            );
          }).toList(),
        )
    );

    final titulo_ingredientes = Row(
      children: [
        Text('Lista de ingredientes'),
        Text('5 items')
      ],
    );
    //final ingredientes = Column(
      //children: [
        //Row()


    //final lista_ingredientes
    //final pasos
    //final Experiencias
    return Column(
        children:[
          texto_porciones,
          botones_opciones
        ]
    );
  }
}

// Creando listas para llenado

//class Ingredientes {
  //final String imagen;

//}

class ScreenIngredientes extends StatelessWidget {
  const ScreenIngredientes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Image(image: AssetImage("assets/rumi.jpg")),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios_new_outlined),
                label: Text('Regresar')
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.thumb_up_alt_rounded),
            )
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 450,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40)
              ),
              color: Colors.white
            ),
            child: Column(
              children: [
                RecetaInfo(),
                RecetaUse()
              ],
            ),

          ),
        )
      ],
    );
  }
}