import 'package:flutter/material.dart';
import 'package:iron_kids/main.dart';
import 'package:iron_kids/models/recetas.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets.dart';
import 'package:iron_kids/styles/widgets/filter_chips.dart';

final TextEditingController _controllerCantidadPorciones = TextEditingController(text: "1");

PageController _pageController = PageController(initialPage: 0, keepPage: false);
int pageIndex = 0;

List<List<String>> experienciasLista = [
  [
    "https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/Profile%2Fphoto_romina.png?alt=media&token=b2f72383-f153-4fd6-8b25-91afe051060b",
    "Romina Cortez",
    "Qué alivio encontrar una receta fácil y rápida para preparar en medio del caos diario. Los niños la devoraron y hasta pedían repetir!",
  ],
  [
    "https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/Profile%2Fphoto_maribel_rojas.png?alt=media&token=cc1c28dd-0bf7-48cf-b0c1-1a04a2067509",
    "Marilyn Cisneros",
    "La combinación de la suave papa amarilla con las crujientes habas, y la cremosidad de la leche, hace que cada bocado sea delicioso y lleno de sabor.",
  ],
  [
    "https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/Profile%2Fphoto_natalia.png?alt=media&token=50e8d1f9-5771-45e0-9f7e-8db3f804bdf7",
    "Natalia Olivares",
    "Esta receta es fácil de preparar, lo que la convierte en una excelente opción para una cena rápida y saludable. Y los ingredientes saludables son muy sabrosos.",
  ],
];

class RecetasDetailsScreen extends StatefulWidget {
  final Receta receta;
  const RecetasDetailsScreen({Key? key, required this.receta}) : super(key: key);

  @override
  State<RecetasDetailsScreen> createState() => _RecetasDetailsScreenState();
}

class _RecetasDetailsScreenState extends State<RecetasDetailsScreen> {
  bool _ingredientesChipValue = true;

  bool _pasosChipValue = false;

  bool _experienciasChipValue = false;

  void onPageChanged(int index){
    if (index == 0){
      _ingredientesChipValue = true;
      _pasosChipValue = false;
      _experienciasChipValue = false;
    }else if(index == 1){
      _ingredientesChipValue = false;
      _pasosChipValue = true;
      _experienciasChipValue = false;
    }else{
      _ingredientesChipValue = false;
      _pasosChipValue = false;
      _experienciasChipValue = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [

            // Imagen
            Container(
              height: screenH * 1/3 + 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.receta.imagenXL),
                  fit: BoxFit.cover
                ),
              ),
            ),

            // Contenido
            Column(
              children: [
                
                // Regresar y me gusta
                ScreenApp(
                  child: SizedBox(
                    height: screenH * 1/3,
                    child: Padding(
                      padding: const EdgeInsets.only(top: AppTheme.spacing8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const ButtonBack(),
                          ButtonIcon(
                            backgroundColor: widget.receta.liked ? AppTheme.primary500.withOpacity(0.8) : AppTheme.gray200.withOpacity(0.8),
                            iconColor: widget.receta.liked ? AppTheme.white : AppTheme.gray600,
                            icon: Icons.thumb_up_outlined,
                            size: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                // Contenido receta
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)
                    ),
                    color: Colors.white
                  ),
                  child: Column(
                    children: [

                      // Titulo, datos, informacion nutricional, calculador de porciones
                      ScreenApp(
                        child: Column(
                          children: [

                            // Titulo, datos, informacion nutricional, calculador de porciones
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[

                                  AppTheme.spacingWidget4,

                                  // Titulo boton
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(widget.receta.titulo, style: textTheme.headlineLarge),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius: AppTheme.borderRadiusL
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: AppTheme.spacing4,
                                          vertical: AppTheme.spacing3
                                        ),
                                        child: Text(widget.receta.region,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.white
                                          ),
                                        ),
                                      )
                                    ],
                                  ),

                                  AppTheme.spacingWidget4,

                                  // Datos Receta
                                  Row(
                                    children: [
                                      
                                      // Tiempo
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.timer_outlined, color: AppTheme.gray500, size: 24),
                                          const SizedBox(width: 4),
                                          Text(widget.receta.tiempo, style: textTheme.bodyMediumMedium.copyWith(color: AppTheme.gray500)),
                                        ],
                                      ),

                                      Container(
                                        height: 20,
                                        width: 1.5,
                                        color: AppTheme.gray500,
                                        margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacing3),
                                      ),

                                      // Edad
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.child_care, color: AppTheme.gray500, size: 24),
                                          const SizedBox(width: 4),
                                          Text(widget.receta.edad, style: textTheme.bodyMediumMedium.copyWith(color: AppTheme.gray500)),
                                        ],
                                      ),
                                      
                                      Container(
                                        height: 20,
                                        width: 1.5,
                                        color: AppTheme.gray500,
                                        margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacing3),
                                      ),

                                      // Likes
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.thumb_up_outlined, color: AppTheme.gray500, size: 22),
                                          const SizedBox(width: 4),
                                          Text(widget.receta.likes, style: textTheme.bodyMediumMedium.copyWith(color: AppTheme.gray500)),
                                        ],
                                      ),
                                    ],
                                  ),

                                  AppTheme.spacingWidget6,

                                  const Text(
                                    "Es un plato delicioso y nutritivo que combina la tradición culinaria peruana con influencias de la cocina italiana."
                                  ),

                                  AppTheme.spacingWidget6,

                                  // Informacion nutricional
                                  Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppTheme.gray100,
                                        borderRadius: AppTheme.borderRadiusL
                                      ),
                                      margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacing2),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: AppTheme.spacing6,
                                        vertical: AppTheme.spacing6
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                          children: [
                                            Text('Energía', style: textTheme.titleSmall),
                                            const Text('221 kcal')
                                          ],
                                          ),

                                          AppTheme.spacingWidget5,

                                          Column(
                                            children: [
                                              Text('Proteína', style: textTheme.titleSmall),
                                              const Text('7,7 g')
                                            ],
                                          ),

                                          AppTheme.spacingWidget5,

                                          Column(
                                            children: [
                                              Text('Hierro', style: textTheme.titleSmall),
                                              const Text('0,7 mg')
                                            ],
                                          ),

                                          AppTheme.spacingWidget5,

                                          Column(
                                            children: [
                                              Text('Retinol', style: textTheme.titleSmall),
                                              const Text('32,7 ug')
                                            ],
                                          ),

                                          AppTheme.spacingWidget5,

                                          Column(
                                            children: [
                                              Text('Zinc', style: textTheme.titleSmall),
                                              const Text('0,8 mg')
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  AppTheme.spacingWidget6,

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Número de porciones:', style: textTheme.bodyMediumMedium),
                                      Row(
                                        children: [
                                          ButtonIcon(
                                            onPressed: () {
                                              setState(() {
                                                if (int.parse(_controllerCantidadPorciones.text) > 1){
                                                  _controllerCantidadPorciones.text = (int.parse(_controllerCantidadPorciones.text) - 1).toString();
                                                }
                                              });
                                            },
                                            iconColor: AppTheme.gray600,
                                            backgroundColor: AppTheme.gray100,
                                            icon: Icons.remove
                                          ),
                                          AppTheme.spacingWidget4,
                                          Container(
                                            alignment: Alignment.center,
                                            width: 35,
                                            child: InputField(
                                              controller: _controllerCantidadPorciones,
                                              placeholder: "0",
                                              keyboardType: TextInputType.number,
                                            ),
                                          ),
                                          AppTheme.spacingWidget4,
                                          ButtonIcon(
                                            onPressed: () {
                                              setState(() {
                                                _controllerCantidadPorciones.text = (int.parse(_controllerCantidadPorciones.text) + 1).toString();
                                              });
                                            },
                                            iconColor: AppTheme.gray600,
                                            backgroundColor: AppTheme.gray100,
                                            icon: Icons.add
                                          )
                                        ],
                                      ),
                                    ],
                                  )

                                ]
                              ),
                            ),

                            AppTheme.spacingWidget4,

                            // Filtros ingredientes, paso a paso, experiencias
                            Row(
                              children: [

                                // Ingredientes
                                MyFilterChip(
                                  selected: _ingredientesChipValue,
                                  onSelected: (value) {
                                    if (value == true){
                                      setState(() {
                                        _pageController.animateToPage(
                                          0,
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.easeInOutCubic
                                        );
                                      });
                                    }
                                  },
                                  label: "Ingredientes"
                                ),

                                AppTheme.spacingWidget4,

                                // Paso a paso
                                MyFilterChip(
                                  selected: _pasosChipValue,
                                  onSelected: (value) {
                                    if (value == true){
                                      setState(() {
                                        _pageController.animateToPage(
                                          1,
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.easeInOutCubic
                                        );
                                      });
                                    }
                                  },
                                  label: "Paso a paso"
                                ),

                                AppTheme.spacingWidget4,

                                // Experiencias
                                MyFilterChip(
                                  selected: _experienciasChipValue,
                                  onSelected: (value) {
                                    if (value == true){
                                      setState(() {
                                        _pageController.animateToPage(
                                          2,
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.easeInOutCubic
                                        );
                                      });
                                    }
                                  },
                                  label: "Experiencias"
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      AppTheme.spacingWidget4,

                      // Page View
                      SizedBox(
                        height: 400,
                        child: PageView(
                          onPageChanged: (value) {
                            setState(() {
                              pageIndex = value;
                              onPageChanged(value);
                            });
                          },
                          controller: _pageController,
                          children: [

                            // Ingredientes
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing6),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Lista de ingredientes", style: textTheme.titleMedium,),
                                      Text("${widget.receta.ingredientes.length} items", style: textTheme.titleSmall,),
                                    ],
                                  ),
                                  AppTheme.spacingWidget4,
                                  for(final ingrediente in widget.receta.ingredientes)
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: AppTheme.spacing3),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(ingrediente[0]),
                                          Text("${int.parse(ingrediente[1]) * int.parse(_controllerCantidadPorciones.text)} ${ingrediente[2]}"),
                                        ],
                                      ),
                                    )
                                ],
                              ),
                            ),
                            
                            // Pasos
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppTheme.spacingWidget2,
                                  for(int i = 0; i < widget.receta.pasos.length; i++)
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: AppTheme.spacing5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Paso ${i+1}", style: textTheme.titleSmall,),
                                          AppTheme.spacingWidget2,
                                          Text(widget.receta.pasos[i]),
                                        ],
                                      ),
                                    )
                                ],
                              ),
                            ),
                            
                            // Experiencias
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppTheme.spacingWidget2,
                                  for(int i = 0; i < experienciasLista.length; i++)
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: AppTheme.spacing6),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: NetworkImage(experienciasLista[i][0]),
                                            radius: 25,
                                          ),
                                          AppTheme.spacingWidget4,
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(experienciasLista[i][1], style: textTheme.titleSmall,),
                                                AppTheme.spacingWidget2,
                                                Text(experienciasLista[i][2]),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
              
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}