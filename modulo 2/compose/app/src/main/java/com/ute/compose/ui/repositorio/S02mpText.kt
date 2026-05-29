package com.ute.compose.ui.repositorio



import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

@Composable
fun S02mpTextScreen() {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(24.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {

        Text(
            "🏨 Sección 2 · Estilos de texto en hotel",
            style = MaterialTheme.typography.titleMedium
        )

        HorizontalDivider()

        EtiquetteHotel("1. Información básica del huésped")
        Text("Huésped registrado: Ana Torres")

        EtiquetteHotel("2. Tipografía en precios y estados")
        Text(
            "💰 Precio: $120 por noche",
            fontSize = 22.sp,
            fontWeight = FontWeight.Bold
        )

        Text(
            "🛏️ Habitación Deluxe",
            fontSize = 18.sp,
            fontStyle = FontStyle.Italic
        )

        Text(
            "📌 Estado: Disponible",
            fontSize = 18.sp,
            fontWeight = FontWeight.Light
        )

        EtiquetteHotel("3. Colores de estado")
        Text(
            "🔴 OCUPADA",
            color = Color(0xFFD32F2F)
        )

        Text(
            "🟢 DISPONIBLE",
            color = Color(0xFF388E3C)
        )

        Text(
            "🟡 EN MANTENIMIENTO",
            color = Color(0xFFFBC02D)
        )

        EtiquetteHotel("4. Descripción de habitación (overflow)")
        Text(
            text = "Habitación con vista al mar, aire acondicionado, WiFi gratis, desayuno incluido y servicio a la habitación las 24 horas del día.",
            maxLines = 2,
            overflow = TextOverflow.Ellipsis
        )

        EtiquetteHotel("5. Tipografía Material 3 (hotel UI)")
        Text("Título habitación", style = MaterialTheme.typography.headlineSmall)
        Text("Descripción corta", style = MaterialTheme.typography.bodyLarge)
        Text("Nota: check-in 3PM", style = MaterialTheme.typography.bodySmall)

        EtiquetteHotel("6. Alineación de información")
        Text(
            text = "Hotel Quito Plaza",
            textAlign = TextAlign.Center,
            modifier = Modifier.fillMaxWidth()
        )

        Text(
            text = "Check-out: 12:00 PM",
            textAlign = TextAlign.End,
            modifier = Modifier.fillMaxWidth()
        )
    }
}

@Composable
internal fun EtiquetaHotel(texto: String) {
    Text(
        text = texto,
        style = MaterialTheme.typography.labelMedium,
        color = MaterialTheme.colorScheme.primary
    )
}

@Preview(showBackground = true)
@Composable
fun HotelTextStylesPreview() {
    MaterialTheme {
        S02mpTextScreen()
    }
}