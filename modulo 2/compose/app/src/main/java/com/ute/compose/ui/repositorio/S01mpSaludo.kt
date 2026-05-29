package com.ute.compose.ui.repositorio



import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

// Composable reutilizable: muestra un huésped
@Composable
fun Huesped(nombre: String) {
    Text(text = "👤 Huésped: $nombre")
}

// Pantalla principal del módulo hotel
@Composable
fun S01mpSaludoScreen() {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(24.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {

        Text(
            "🏨 Sección 1 · Gestión básica de hotel",
            style = MaterialTheme.typography.titleMedium
        )

        HorizontalDivider()

        // Lista de huéspedes (simulación)
        Huesped("Ana Torres")
        Huesped("Luis Pérez")
        Huesped("Kotlin Guest")

        HorizontalDivider()

        // Estado de habitación
        EstadoHabitacion(ocupada = true)
        EstadoHabitacion(ocupada = false)
    }
}

// Composable con lógica condicional
@Composable
private fun EstadoHabitacion(ocupada: Boolean) {
    if (ocupada) {
        Text("🔴 Habitación OCUPADA")
    } else {
        Text(
            "🟢 Habitación DISPONIBLE",
            color = MaterialTheme.colorScheme.primary
        )
    }
}

@Preview(showBackground = true)
@Composable
fun HotelHomePreview() {
    MaterialTheme {
        S01mpSaludoScreen()
    }
}