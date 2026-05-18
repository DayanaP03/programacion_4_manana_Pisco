// MainActivity.kt
package com.ute.compose
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.material3.MaterialTheme
import com.ute.compose.ui.repositorio.S01mpSaludoScreen
import com.ute.compose.ui.repositorio.S02mpTextScreen
import com.ute.compose.ui.repositorio.S03mpButtonScreen
import com.ute.compose.ui.repositorio.S04mpLayoutScreen
import com.ute.compose.ui.repositorio.S05mpModiferScreen
import com.ute.compose.ui.repositorio.S06mpEstadoScreen
import com.ute.compose.ui.repositorio.S07moStateHoistingScreen
import com.ute.compose.ui.repositorio.S08mpBienvenidaScreen

//


class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MaterialTheme {
                // ◀ CAMBIA AQUÍ para probar cada paso
                // //Componentes bascicos nativos:
                //S01_SaludoScreen()
                //S02_TextScreen()
               // S03ButtonScreen()
                //S04LayoutScreen()
                //S05ModifierScreen()
                //S06EstadoScreen()
                //S07StateHoistingScreen()
                //S08BienvenidaScreen()

                //componente material 3
                // ◀ CAMBIA AQUÍ para probar cada paso:
                //Paso01TextFieldScreen()

                //Paso01TiendaScreen()
                //Paso02CardScreen()
                //Paso03LazyColumnScreen()
                // Paso03_LazyColumnScreen()
                // Paso04_ScaffoldScreen()
                // Paso05_NavBarScreen()


                //repaso
                //Paso01mpScreen()
                //Paso02mpReservaScreen()
                //Paso03ColumnaScreen()
                //Paso04ScaffoldScreen()
                //Paso05mpNavBarScreen()
                //Paso06mpDialogosScreen()
                //S01mpSaludoScreen()
                //S02mpTextScreen()
                //S03mpButtonScreen()
                //S04mpLayoutScreen()
                //S05mpModiferScreen()
                //S06mpEstadoScreen()
                //S07moStateHoistingScreen()
                S08mpBienvenidaScreen()
            // reen()
                // Paso03_LazyColumnScreen()
                // Paso04_ScaffoldScreen()
                // Paso05_NavBarScreen()
                //Paso06_DialogosScreen()   // ← paso activo
            }
        }
    }
}