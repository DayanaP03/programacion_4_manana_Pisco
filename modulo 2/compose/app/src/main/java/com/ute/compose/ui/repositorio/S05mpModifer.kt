package com.ute.compose.ui.repositorio


import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
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
fun S05mpModiferScreen() {

    var ultimoClick by remember { mutableStateOf("Toca un elemento del hotel") }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {

        Text(
            "🏨 Sección 5 · Modifier en sistema de hotel",
            style = MaterialTheme.typography.titleMedium
        )

        HorizontalDivider()

        // Panel de feedback
        Surface(
            color = MaterialTheme.colorScheme.surfaceVariant,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text(
                ultimoClick,
                modifier = Modifier.padding(12.dp),
                style = MaterialTheme.typography.bodySmall
            )
        }

        // ───────────────── 1. CARD de habitación (clip correcto) ─────────────────
        EtiquetaHotel("1. Card habitación (clip correcto)")

        Box(
            modifier = Modifier
                .fillMaxWidth()
                .height(120.dp)
                .clip(RoundedCornerShape(16.dp))
                .background(MaterialTheme.colorScheme.primaryContainer)
                .border(2.dp, MaterialTheme.colorScheme.primary, RoundedCornerShape(16.dp))
                .clickable { ultimoClick = "Habitación Deluxe seleccionada" },
            contentAlignment = Alignment.Center
        ) {
            Text(
                "🏨 Suite Deluxe\n$120 / noche",
                style = MaterialTheme.typography.labelLarge,
                color = MaterialTheme.colorScheme.onPrimaryContainer
            )
        }

        // ───────────────── 2. error conceptual background/clip ─────────────────
        EtiquetaHotel("2. Estado visual (background antes de clip)")

        Box(
            modifier = Modifier
                .fillMaxWidth()
                .height(120.dp)
                .background(Color(0xFFFFCDD2))
                .clip(RoundedCornerShape(16.dp))
                .clickable { ultimoClick = "Estado habitación tocado" },
            contentAlignment = Alignment.Center
        ) {
            Text("Estado habitación (ejemplo visual)")
        }

        // ───────────────── 3. Avatares de huéspedes ─────────────────
        EtiquetaHotel("3. Avatares de huéspedes")

        Row(horizontalArrangement = Arrangement.spacedBy(12.dp)) {
            listOf(
                "A" to Color(0xFF1976D2),
                "B" to Color(0xFF388E3C),
                "C" to Color(0xFFF57C00)
            ).forEach { (letra, color) ->

                Box(
                    modifier = Modifier
                        .size(56.dp)
                        .clip(CircleShape)
                        .background(color)
                        .clickable {
                            ultimoClick = "Huésped $letra seleccionado"
                        },
                    contentAlignment = Alignment.Center
                ) {
                    Text(
                        letra,
                        color = Color.White,
                        style = MaterialTheme.typography.titleMedium
                    )
                }
            }
        }

        // ───────────────── 4. Layout de información ─────────────────
        EtiquetaHotel("4. Padding en ficha de hotel")

        Text(
            text = "Check-in: 3:00 PM | Check-out: 12:00 PM",
            modifier = Modifier
                .fillMaxWidth()
                .background(Color(0xFFE8F5E9))
                .padding(horizontal = 32.dp, vertical = 8.dp)
        )

        // ───────────────── 5. Distribución de habitaciones ─────────────────
        EtiquetaHotel("5. Distribución de habitaciones")

        Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {

            Box(
                modifier = Modifier
                    .size(60.dp)
                    .background(Color(0xFFBBDEFB)),
                contentAlignment = Alignment.Center
            ) {
                Text("101")
            }

            Box(
                modifier = Modifier
                    .weight(1f)
                    .height(60.dp)
                    .background(Color(0xFFB3E5FC)),
                contentAlignment = Alignment.Center
            ) {
                Text("Habitaciones disponibles")
            }
        }
    }
}

@Composable
internal fun EtiquetaHotels(texto: String) {
    Text(
        text = texto,
        style = MaterialTheme.typography.labelMedium,
        color = MaterialTheme.colorScheme.primary
    )
}

@Preview(showBackground = true)
@Composable
fun HotelModifierPreview() {
    MaterialTheme {
        S05mpModiferScreen()
    }
}