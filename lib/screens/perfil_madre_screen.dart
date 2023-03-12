
import 'package:flutter/material.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets.dart';


class PerfilMadreScreen extends StatelessWidget {
  const PerfilMadreScreen({super.key});

  @override
  Widget build(BuildContext context) {

  int puntajeMaximo = 100;
  int puntajeUsuario = 20;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
            AppTheme.spacingWidget10,
      
            // AppBar?
            ScreenApp(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hola, Lupe Batallán", style: textTheme.headlineLarge,),
            
                  AppTheme.spacingWidget6,
            
                  // Usuario imagen, datos, barra de puntos
                  _UsuariosDatosSection(puntajeUsuario: puntajeUsuario, puntajeMaximo: puntajeMaximo),
            
                  AppTheme.spacingWidget8,
                  
                  // Hijos
                  const _HijosSection(),
                ],
              ),
            ),
      
            AppTheme.spacingWidget8,
            
            // Menu Options
            Column(
              children: [
                const _MenuOption(icon: Icons.settings_outlined, label: "Editar perfil",),
                AppTheme.spacingWidget1,
                Container(height: 2, width: double.infinity, color: AppTheme.gray100,),
      
                const _MenuOption(icon: Icons.menu_book_outlined, label: "Mis recetas",),
                AppTheme.spacingWidget1,
                Container(height: 2, width: double.infinity, color: AppTheme.gray100,),
      
                const _MenuOption(icon: Icons.comment_outlined, label: "Mis comentarios",),
                AppTheme.spacingWidget1,
                Container(height: 2, width: double.infinity, color: AppTheme.gray100,),
      
                const _MenuOption(icon: Icons.logout_outlined, label: "Cerrar sesión", logout: true,),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _MenuOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool logout;

  const _MenuOption({
    required this.icon,
    required this.label,
    this.logout = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppTheme.spacing4),
        child: Row(
          children: [
            AppTheme.spacingWidget6,
            Container(
              decoration: BoxDecoration(
                color: logout ? AppTheme.primary50 : AppTheme.gray100,
                borderRadius: AppTheme.borderRadiusL
              ),
              padding: const EdgeInsets.all(AppTheme.spacing4),
              child: Icon(icon, size: 32, color:  logout ? AppTheme.primary600 : AppTheme.gray600),
            ),
            AppTheme.spacingWidget6,
            Text(label, style: textTheme.bodyLarge!.copyWith(color: logout ? AppTheme.primary600 : AppTheme.gray700),)
          ],
        ),
      ),
    );
  }
}

class _UsuariosDatosSection extends StatelessWidget {
  const _UsuariosDatosSection({
    required this.puntajeUsuario,
    required this.puntajeMaximo,
  });

  final int puntajeUsuario;
  final int puntajeMaximo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: AppTheme.spacing6,
          alignment: WrapAlignment.center,
          runSpacing: AppTheme.spacing4,
          children: [

            // Imagen usuario
            const CircleAvatar(
              backgroundImage: NetworkImage('https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/Profile%2Fphoto_lupe.png?alt=media&token=b6be5f56-41e7-47a2-b240-97a9c3131690'),
              radius: 45,
            ),

            // Datos y barra de puntos
            Container(
              decoration: BoxDecoration(
                color: AppTheme.gray100,
                borderRadius: AppTheme.borderRadiusL
              ),
              padding: const EdgeInsets.symmetric(
                vertical: AppTheme.spacing5,
                horizontal: AppTheme.spacing6,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
            
                  // Niños
                  Column(
                    children: [
                      Icon(Icons.people_alt_outlined, color: AppTheme.gray700,),
                      Text("Niños", style: textTheme.titleSmall,),
                      Text("2", style: textTheme.bodyMedium,)
                    ],
                  ),
            
                  AppTheme.spacingWidget10,
            
                  // Region
                  Column(
                    children: [
                      Icon(Icons.pin_drop_outlined, color: AppTheme.gray700,),
                      Text("Región", style: textTheme.titleSmall,),
                      Text("Ica, Perú", style: textTheme.bodyMedium,)
                    ],
                  ),
            
                  AppTheme.spacingWidget10,
            
                  // Puntos
                  Column(
                    children: [
                      Icon(Icons.emoji_events_outlined, color: AppTheme.gray700,),
                      Text("Puntos", style: textTheme.titleSmall,),
                      Text(puntajeUsuario.toString(), style: textTheme.bodyMedium,)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        
        AppTheme.spacingWidget5,
          
        // Barra de puntos
        Container(
          decoration: BoxDecoration(
            color: AppTheme.gray100,
            borderRadius: AppTheme.borderRadiusXL
          ),
          height: 25,
          alignment: Alignment.centerLeft,
          child: Stack(
            children: [
              FractionallySizedBox(
                widthFactor: puntajeUsuario/puntajeMaximo,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: AppTheme.primary400,
                    borderRadius: AppTheme.borderRadiusXL
                  ),
                ),
              ),
              Center(child: Text("$puntajeUsuario/$puntajeMaximo", style: textTheme.bodySmallMedium,)),

            ],
          ),
        )
      ],
    );
  }
}

class _HijosSection extends StatelessWidget {
  const _HijosSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mis hijitos',
          style: textTheme.headlineSmall,
        ),

        AppTheme.spacingWidget4,
        
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ButtonIcon(
                icon: Icons.add,
                iconColor: AppTheme.gray500,
                backgroundColor: AppTheme.gray100,
                size: 1,
              ),
        
              AppTheme.spacingWidget5,
        
              // Hijo 1
              const CardHijo(
                nombre: "Luquitas",
                linkImg: "https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/AvatarChild%2Fboy_avatar.png?alt=media&token=11a7b731-6753-4dbe-a095-4249be3fd1d9",
              ),
        
              AppTheme.spacingWidget5,
        
              // Hijo 2
              const CardHijo(
                nombre: "Sofia",
                linkImg: "https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/AvatarChild%2Fgirl_avatar.png?alt=media&token=0af88513-e1fb-416f-9dfc-88b561635785",
              ),],
          ),
        ),
      ],
    );
  }
}
