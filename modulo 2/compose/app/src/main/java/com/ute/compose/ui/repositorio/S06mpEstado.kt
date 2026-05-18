package com.ute.compose.ui.repositorio


import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun S06mpEstadoScreen() {

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(24.dp)
    ) {

        Text(
            "🏨 Sección 6 · Estado del sistema de hotel",
            style = MaterialTheme.typography.titleMedium
        )

        HorizontalDivider()

        ContadorHabitacionesDemo()
        HorizontalDivider()
        EstadoOcupacionDerivado()
    }
}

/* ───────────────────────────────────────────────────────────── */
/* 1. CONTADOR DE HABITACIONES OCUPADAS                         */
/* ───────────────────────────────────────────────────────────── */

@Composable
private fun ContadorHabitacionesDemo() {

    var ocupadas by remember { mutableStateOf(0) }

    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {

        EtiquetaHotel("Habitaciones ocupadas (estado básico)")

        Text(
            text = "$ocupadas",
            style = MaterialTheme.typography.displayMedium,
            fontWeight = FontWeight.Bold
        )

        Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {

            Button(onClick = { ocupadas-- }) {
                Text("−")
            }

            Button(onClick = { ocupadas++ }) {
                Text("+")
            }

            OutlinedButton(onClick = { ocupadas = 0 }) {
                Text("Reset")
            }
        }

        Text(
            "Solo el número se recompone cuando cambia el estado",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}

/* ───────────────────────────────────────────────────────────── */
/* 2. ESTADO DERIVADO: NIVEL DE OCUPACIÓN DEL HOTEL            */
/* ───────────────────────────────────────────────────────────── */

@Composable
private fun EstadoOcupacionDerivado() {

    var ocupadas by remember { mutableStateOf(0) }
    val capacidadTotal = 10

    // 🔥 Estado derivado (NO se guarda, se calcula)
    val porcentaje = ocupadas.toFloat() / capacidadTotal

    val estadoHotel = when {
        ocupadas == 0 -> "Hotel vacío"
        ocupadas <= 3 -> "Baja ocupación"
        ocupadas <= 7 -> "Ocupación media"
        else -> "Hotel casi lleno"
    }

    Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {

        EtiquetaHotel("Estado derivado — ocupación del hotel")

        Text(
            "$estadoHotel ($ocupadas/$capacidadTotal)",
            style = MaterialTheme.typography.titleMedium,
            fontWeight = FontWeight.SemiBold
        )

        LinearProgressIndicator(
            progress = { porcentaje },
            modifier = Modifier
                .fillMaxWidth()
                .height(12.dp)
                .clip(RoundedCornerShape(6.dp))
        )

        Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {

            OutlinedButton(
                onClick = { if (ocupadas > 0) ocupadas-- },
                enabled = ocupadas > 0
            ) {
                Text("Liberar habitación")
            }

            Button(
                onClick = { if (ocupadas < capacidadTotal) ocupadas++ },
                enabled = ocupadas < capacidadTotal
            ) {
                Text("Ocupar habitación")
            }
        }

        Text(
            "porcentaje = ${"%.0f".format(porcentaje * 100)}% — calculado automáticamente",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}

/* ───────────────────────────────────────────────────────────── */

@Composable
internal fun EtiquetaHotelL(texto: String) {
    Text(
        text = texto,
        style = MaterialTheme.typography.labelMedium,
        color = MaterialTheme.colorScheme.primary
    )
}

@Preview(showBackground = true)
@Composable
fun HotelEstadoPreview() {
    MaterialTheme {
        S06mpEstadoScreen()
    }
}