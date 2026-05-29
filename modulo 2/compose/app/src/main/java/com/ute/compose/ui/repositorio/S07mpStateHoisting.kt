package com.ute.compose.ui.repositorio


import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun S07moStateHoistingScreen() {

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(20.dp)
    ) {

        Text(
            "🏨 Sección 7 · State Hoisting en hotel",
            style = MaterialTheme.typography.titleMedium
        )

        HorizontalDivider()

        DemoEstadoAtrapadoHotel()
        HorizontalDivider()
        DemoEstadoElevadoHotel()
    }
}

/* ───────────────────────────────────────────── */
/* ❌ ESTADO ATRAPADO (MAL DISEÑO)              */
/* ───────────────────────────────────────────── */

@Composable
private fun DemoEstadoAtrapadoHotel() {

    Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {

        EtiquetaHotel("❌ Botón de habitación con estado interno")

        Text(
            "El estado está dentro del botón. El sistema del hotel no sabe " +
                    "cuántas veces fue usado ni puede controlarlo.",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )

        BotonHabitacionAtrapado()

        Text(
            "El recepcionista (padre) NO puede ver este estado ❌",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.error
        )
    }
}

@Composable
private fun BotonHabitacionAtrapado() {

    var reservas by remember { mutableStateOf(0) }

    Button(onClick = { reservas++ }) {
        Text("Reservas internas: $reservas")
    }
}

/* ───────────────────────────────────────────── */
/* ✅ ESTADO ELEVADO (CORRECTO)                  */
/* ───────────────────────────────────────────── */

@Composable
private fun DemoEstadoElevadoHotel() {

    var habitacionSeleccionada by remember { mutableStateOf<String?>(null) }
    var historial by remember { mutableStateOf(listOf<String>()) }

    val habitaciones = listOf(
        "101 - Disponible",
        "102 - Ocupada",
        "103 - Limpieza",
        "104 - Disponible"
    )

    Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {

        EtiquetaHotel("✅ Recepción controla el estado del hotel")

        Text(
            "El botón solo informa. La recepción decide qué hacer con la acción.",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )

        SelectorHabitaciones(
            habitaciones = habitaciones,
            seleccionada = habitacionSeleccionada,
            onSeleccion = { habitacion ->

                // 🏨 El padre controla todo
                habitacionSeleccionada = habitacion
                historial = (historial + habitacion).takeLast(4)
            }
        )

        // Vista del estado actual
        habitacionSeleccionada?.let { hab ->

            val color = when {
                "Disponible" in hab -> Color(0xFFC8E6C9)
                "Ocupada" in hab -> Color(0xFFFFCDD2)
                "Limpieza" in hab -> Color(0xFFFFF9C4)
                else -> Color.Transparent
            }

            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(50.dp)
                    .clip(RoundedCornerShape(8.dp))
                    .background(color),
                contentAlignment = Alignment.Center
            ) {
                Text("Seleccionada: $hab")
            }
        }

        if (historial.isNotEmpty()) {
            Text(
                "Historial: ${historial.joinToString(" → ")}",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

/* ───────────────────────────────────────────── */
/* COMPONENTE SIN ESTADO (STATELSS)             */
/* ───────────────────────────────────────────── */

@Composable
private fun SelectorHabitaciones(
    habitaciones: List<String>,
    seleccionada: String?,
    onSeleccion: (String) -> Unit
) {

    Column(verticalArrangement = Arrangement.spacedBy(6.dp)) {

        habitaciones.forEach { habitacion ->

            val activa = seleccionada == habitacion

            Button(
                onClick = { onSeleccion(habitacion) },
                modifier = Modifier.fillMaxWidth(),
                colors = if (activa)
                    ButtonDefaults.buttonColors()
                else
                    ButtonDefaults.outlinedButtonColors()
            ) {
                Text(habitacion)
            }
        }
    }
}

/* ───────────────────────────────────────────── */

@Composable
internal fun EtiquetaaHotel(texto: String) {
    Text(
        text = texto,
        style = MaterialTheme.typography.labelMedium,
        color = MaterialTheme.colorScheme.primary
    )
}

@Preview(showBackground = true)
@Composable
fun HotelStateHoistingPreview() {
    MaterialTheme {
        S07moStateHoistingScreen()
    }
}