// MainActivity.kt
package com.ute.compose
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.material3.MaterialTheme
import com.ute.compose.ui.repositorio.Paso01mpScreen
import com.ute.compose.ui.repositorio.Paso03ColumnaScreen
import com.ute.compose.ui.repositorio.Paso04ScaffoldScreen
import com.ute.compose.ui.repositorio.Paso05mpNavBarScreen
import com.ute.compose.ui.repositorio.Paso06mpDialogosScreen
import com.ute.compose.ui.respositio.Paso02mpReservaScreen
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
                //Paso01SumaScreen()
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
                Paso06mpDialogosScreen()
            // reen()
                // Paso03_LazyColumnScreen()
                // Paso04_ScaffoldScreen()
                // Paso05_NavBarScreen()
                //Paso06_DialogosScreen()   // ← paso activo
            }
        }
    }
}