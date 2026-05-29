package com.ute.compose.ui.repositorio


import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.Delete
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun S03mpButtonScreen() {

    var ultimoAccion by remember { mutableStateOf("(ninguna)") }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(24.dp),
        verticalArrangement = Arrangement.spacedBy(10.dp),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {

        Text(
            "🏨 Sección 3 · Botones del sistema de hotel",
            style = MaterialTheme.typography.titleMedium
        )

        HorizontalDivider()

        // Estado / feedback
        Surface(
            color = MaterialTheme.colorScheme.surfaceVariant,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text(
                text = "Última acción: $ultimoAccion",
                modifier = Modifier.padding(12.dp),
                style = MaterialTheme.typography.bodyMedium
            )
        }

        Spacer(Modifier.height(4.dp))

        // Acción principal: reservar habitación
        Button(
            onClick = { ultimoAccion = "Reservar habitación" },
            modifier = Modifier.fillMaxWidth()
        ) {
            Icon(Icons.Default.Add, contentDescription = null)
            Spacer(Modifier.width(8.dp))
            Text("Reservar habitación")
        }

        // Check-in
        Button(
            onClick = { ultimoAccion = "Check-in realizado" },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Check-in huésped")
        }

        // Check-out
        OutlinedButton(
            onClick = { ultimoAccion = "Check-out realizado" },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Check-out huésped")
        }

        // Ver detalles
        TextButton(
            onClick = { ultimoAccion = "Ver detalles de habitación" },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Ver detalles")
        }

        // Botón secundario
        FilledTonalButton(
            onClick = { ultimoAccion = "Actualizar disponibilidad" },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Actualizar disponibilidad")
        }

        // Deshabilitado (ejemplo: sin permisos o sin stock de habitaciones)
        Button(
            onClick = { },
            enabled = false,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Eliminar (bloqueado)")
        }

        HorizontalDivider()

        Text("Acciones rápidas")

        Row(
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            IconButton(onClick = { ultimoAccion = "Agregar habitación" }) {
                Icon(Icons.Default.Add, contentDescription = "Agregar habitación")
            }

            IconButton(onClick = { ultimoAccion = "Eliminar habitación" }) {
                Icon(
                    Icons.Default.Delete,
                    contentDescription = "Eliminar habitación",
                    tint = MaterialTheme.colorScheme.error
                )
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun HotelButtonsPreview() {
    MaterialTheme {
        S03mpButtonScreen()
    }
}