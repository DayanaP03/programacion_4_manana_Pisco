package com.ute.compose.ui.repositorio

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun S04mpLayoutScreen() {

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(20.dp)
    ) {

        Text(
            "🏨 Sección 4 · Layouts del sistema de hotel",
            style = MaterialTheme.typography.titleMedium
        )

        HorizontalDivider()

        // ───────────────── COLUMN: lista de habitaciones ─────────────────
        EtiquetteHotel("Column — Lista de habitaciones")

        Column(
            modifier = Modifier
                .fillMaxWidth()
                .background(Color(0xFFE3F2FD))
                .padding(12.dp),
            verticalArrangement = Arrangement.spacedBy(6.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            HabitacionItem("Habitación 101 - Disponible", Color(0xFF81C784))
            HabitacionItem("Habitación 102 - Ocupada", Color(0xFFE57373))
            HabitacionItem("Habitación 103 - Limpieza", Color(0xFFFFB74D))
        }

        // ───────────────── ROW: menú rápido ─────────────────
        EtiquetteHotel("Row — Acciones rápidas del hotel")

        Row(
            modifier = Modifier
                .fillMaxWidth()
                .background(Color(0xFFF3E5F5))
                .padding(12.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text("Reservas")
            Text("Check-in")
            Text("Check-out")
        }

        // ───────────────── ROW: distribución ─────────────────
        EtiquetteHotel("Row — Distribución de ocupación")

        Row(
            modifier = Modifier
                .fillMaxWidth()
                .height(50.dp)
        ) {

            Box(
                modifier = Modifier
                    .weight(2f)
                    .fillMaxHeight()
                    .background(Color(0xFFEF5350)),
                contentAlignment = Alignment.Center
            ) {
                Text("Ocupadas")
            }

            Box(
                modifier = Modifier
                    .weight(1f)
                    .fillMaxHeight()
                    .background(Color(0xFF81C784)),
                contentAlignment = Alignment.Center
            ) {
                Text("Libres")
            }

            Box(
                modifier = Modifier
                    .weight(1f)
                    .fillMaxHeight()
                    .background(Color(0xFFFFB74D)),
                contentAlignment = Alignment.Center
            ) {
                Text("Limpieza")
            }
        }

        // ───────────────── BOX: tarjeta de hotel ─────────────────
        EtiquetteHotel("Box — Tarjeta de habitación")

        Box(
            modifier = Modifier
                .fillMaxWidth()
                .height(140.dp)
                .background(Color(0xFF1565C0)),
            contentAlignment = Alignment.Center
        ) {

            // estado superior izquierda
            Box(
                modifier = Modifier
                    .size(50.dp)
                    .background(Color(0xFF42A5F5))
                    .align(Alignment.TopStart)
            )

            // precio inferior derecha
            Box(
                modifier = Modifier
                    .size(50.dp)
                    .background(Color(0xFF1976D2))
                    .align(Alignment.BottomEnd)
            )

            Text(
                "🏨 Suite Deluxe - $120/noche",
                color = Color.White,
                style = MaterialTheme.typography.labelLarge
            )
        }
    }
}

@Composable
private fun HabitacionItem(texto: String, color: Color) {
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .height(36.dp)
            .background(color),
        contentAlignment = Alignment.Center
    ) {
        Text(texto, style = MaterialTheme.typography.labelMedium)
    }
}

@Composable
fun EtiquetteHotel(texto: String) {
    Text(
        text = texto,
        style = MaterialTheme.typography.labelMedium,
        color = MaterialTheme.colorScheme.primary
    )
}

@Preview(showBackground = true)
@Composable
fun HotelLayoutPreview() {
    MaterialTheme {
        S04mpLayoutScreen()
    }
}