// MainActivity.kt
package com.ute.compose
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.material3.MaterialTheme
import com.ute.compose.ui.material3.Paso01SumaScreen
import com.ute.compose.ui.material3.Paso01TextFieldScreen

import com.ute.compose.ui.screens.*


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
                Paso01SumaScreen()
                // Paso02_CardScreen()
                // Paso03_LazyColumnScreen()
                // Paso04_ScaffoldScreen()
                // Paso05_NavBarScreen()

            // reen()
                // Paso03_LazyColumnScreen()
                // Paso04_ScaffoldScreen()
                // Paso05_NavBarScreen()
                //Paso06_DialogosScreen()   // ← paso activo
            }
        }
    }
}