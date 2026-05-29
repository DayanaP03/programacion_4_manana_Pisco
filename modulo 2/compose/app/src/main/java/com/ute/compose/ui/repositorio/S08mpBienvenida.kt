package com.ute.compose.ui.repositorio



import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
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
fun S08mpBienvenidaScreen() {

    // Estado global del flujo del hotel (recepción controla todo)
    var paso by remember { mutableStateOf(1) }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(24.dp),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        when (paso) {
            1 -> PasoHabitacion(onSiguiente = { paso = 2 })
            2 -> PasoDatosHuesped(
                onSiguiente = { paso = 3 },
                onVolver = { paso = 1 }
            )
            3 -> PasoConfirmacion(onReiniciar = { paso = 1 })
        }
    }
}

/* ─────────────────────────────── */
/* PASO 1: elegir habitación       */
/* ─────────────────────────────── */

@Composable
private fun PasoHabitacion(onSiguiente: () -> Unit) {

    var habitacionElegida by remember { mutableStateOf<String?>(null) }

    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {

        IndicadorPasosHotel(1)

        Text(
            "🏨 Selecciona tu habitación",
            style = MaterialTheme.typography.headlineSmall,
            fontWeight = FontWeight.Bold
        )

        listOf("101 - Vista mar", "102 - Doble", "103 - Suite").forEach { hab ->

            val seleccionado = habitacionElegida == hab

            Button(
                onClick = { habitacionElegida = hab },
                modifier = Modifier.fillMaxWidth(),
                colors = if (seleccionado)
                    ButtonDefaults.buttonColors()
                else
                    ButtonDefaults.outlinedButtonColors()
            ) {
                Text(hab)
                if (seleccionado) {
                    Spacer(Modifier.width(8.dp))
                    Text("✓")
                }
            }
        }

        Button(
            onClick = onSiguiente,
            enabled = habitacionElegida != null,
            modifier = Modifier.fillMaxWidth().height(50.dp),
            shape = RoundedCornerShape(12.dp)
        ) {
            Text("Continuar")
        }
    }
}

/* ─────────────────────────────── */
/* PASO 2: datos del huésped      */
/* ─────────────────────────────── */

@Composable
private fun PasoDatosHuesped(onSiguiente: () -> Unit, onVolver: () -> Unit) {

    var nivelServicio by remember { mutableStateOf(1) }
    val max = 5

    val descripcion = when (nivelServicio) {
        1 -> "Servicio básico"
        2 -> "Servicio estándar"
        3 -> "Servicio confort"
        4 -> "Servicio premium"
        else -> "Servicio VIP"
    }

    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {

        IndicadorPasosHotel(2)

        Text(
            "⭐ Nivel de servicio",
            style = MaterialTheme.typography.headlineSmall,
            fontWeight = FontWeight.Bold
        )

        Text(
            "Nivel $nivelServicio de $max",
            style = MaterialTheme.typography.displaySmall,
            fontWeight = FontWeight.Bold,
            color = MaterialTheme.colorScheme.primary
        )

        Text(
            descripcion,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )

        // estado derivado
        LinearProgressIndicator(
            progress = { nivelServicio.toFloat() / max },
            modifier = Modifier
                .fillMaxWidth()
                .height(8.dp)
                .clip(RoundedCornerShape(4.dp))
        )

        Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
            OutlinedButton(
                onClick = { if (nivelServicio > 1) nivelServicio-- },
                enabled = nivelServicio > 1
            ) { Text("−") }

            Button(
                onClick = { if (nivelServicio < max) nivelServicio++ },
                enabled = nivelServicio < max
            ) { Text("+") }
        }

        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            OutlinedButton(
                onClick = onVolver,
                modifier = Modifier.weight(1f)
            ) {
                Text("Volver")
            }

            Button(
                onClick = onSiguiente,
                modifier = Modifier.weight(1f)
            ) {
                Text("Continuar")
            }
        }
    }
}

/* ─────────────────────────────── */
/* PASO 3: confirmación hotel      */
/* ─────────────────────────────── */

@Composable
private fun PasoConfirmacion(onReiniciar: () -> Unit) {

    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {

        IndicadorPasosHotel(3)

        Box(
            modifier = Modifier
                .size(88.dp)
                .clip(CircleShape)
                .background(MaterialTheme.colorScheme.primaryContainer),
            contentAlignment = Alignment.Center
        ) {
            Text(
                "✓",
                style = MaterialTheme.typography.displaySmall,
                fontWeight = FontWeight.Bold,
                color = MaterialTheme.colorScheme.onPrimaryContainer
            )
        }

        Text(
            "🏨 Registro completado",
            style = MaterialTheme.typography.headlineSmall,
            fontWeight = FontWeight.Bold
        )

        Text(
            "El huésped ha sido registrado correctamente en el sistema del hotel.",
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )

        OutlinedButton(
            onClick = onReiniciar,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("↺ Nuevo registro")
        }
    }
}

/* ─────────────────────────────── */
/* INDICADOR DE PASOS (STATLESS)   */
/* ─────────────────────────────── */

@Composable
private fun IndicadorPasosHotel(pasoActual: Int) {

    Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {

        (1..3).forEach { paso ->

            Box(
                modifier = Modifier
                    .size(if (paso == pasoActual) 12.dp else 8.dp)
                    .clip(CircleShape)
                    .background(
                        if (paso <= pasoActual)
                            MaterialTheme.colorScheme.primary
                        else
                            MaterialTheme.colorScheme.surfaceVariant
                    )
            )
        }
    }
}

@Preview(showBackground = true)
@Composable
fun HotelBienvenidaPreview() {
    MaterialTheme {
        S08mpBienvenidaScreen()
    }
}