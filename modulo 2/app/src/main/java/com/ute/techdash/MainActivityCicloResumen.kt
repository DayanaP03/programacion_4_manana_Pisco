package com.ute.techdash

data class MainActivityCicloResumen()


import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.ute.techdash.ui.theme.TechDashTheme

class MainActivityCicloVidaResumen : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            TechDashTheme {
                Scaffold(modifier = Modifier.fillMaxSize()) { innerPadding ->
                    ResumenCicloVida(modifier = Modifier.padding(innerPadding))
                }
            }
        }
    }
}

@Composable
fun ResumenCicloVida(modifier: Modifier = Modifier) {
    Column(
        modifier = modifier
            .fillMaxSize()
            .padding(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Text(
            text = "Resumen del Ciclo de Vida",
            style = MaterialTheme.typography.headlineMedium,
            fontWeight = FontWeight.Bold
        )
        Text(
            text = "1. onCreate: Creación inicial\n" +
                    "2. onStart: Visible\n" +
                    "3. onResume: Interactuable\n" +
                    "4. onPause: Pierde foco\n" +
                    "5. onStop: No visible\n" +
                    "6. onDestroy: Destruida",
            modifier = Modifier.padding(top = 16.dp)
        )
    }
}
