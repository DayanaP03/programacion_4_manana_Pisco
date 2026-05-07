package com.ute.compose.ui.material3

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Person
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun Paso01TiendaScreen() {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(24.dp)
    ) {
        Text(
            text = "Compra de Producto",
            style = MaterialTheme.typography.titleMedium
        )

        HorizontalDivider()

        CompraProducto()
    }
}

// ────────────────────────────────────────────────────────────────
@Composable
private fun CompraProducto() {

    var nombre by remember { mutableStateOf("") }
    var cantidad by remember { mutableStateOf("") }
    var precioUnitario by remember { mutableStateOf("") }

    var subTotal by remember { mutableStateOf(0.0) }
    var descuento by remember { mutableStateOf(0.0) }
    var totalPagar by remember { mutableStateOf(0.0) }

    Column(
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {

        Text(
            text = "Formulario de Compra",
            style = MaterialTheme.typography.labelLarge,
            color = MaterialTheme.colorScheme.primary
        )

        // Nombre
        OutlinedTextField(
            value = nombre,
            onValueChange = { nombre = it },
            label = { Text("Ingrese el nombre") },
            leadingIcon = {
                Icon(
                    Icons.Default.Person,
                    contentDescription = null
                )
            },
            keyboardOptions = KeyboardOptions(
                imeAction = ImeAction.Next
            ),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        // Cantidad
        OutlinedTextField(
            value = cantidad,
            onValueChange = { cantidad = it },
            label = { Text("Cantidad") },
            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Number,
                imeAction = ImeAction.Next
            ),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        // Precio Unitario
        OutlinedTextField(
            value = precioUnitario,
            onValueChange = { precioUnitario = it },
            label = { Text("Precio Unitario") },
            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Number,
                imeAction = ImeAction.Done
            ),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        // Botón calcular
        Button(
            onClick = {

                val cantidadDouble =
                    cantidad.toDoubleOrNull() ?: 0.0

                val precioDouble =
                    precioUnitario.toDoubleOrNull() ?: 0.0

                // Subtotal
                subTotal = cantidadDouble * precioDouble

                // Descuento
                descuento = when {
                    subTotal > 50 -> subTotal * 0.10
                    subTotal > 20 -> subTotal * 0.05
                    else -> 0.0
                }

                // Total
                totalPagar = subTotal - descuento
            },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Calcular")
        }

        // Resultados
        Text(text = "Subtotal: $subTotal")
        Text(text = "Descuento: $descuento")
        Text(text = "Total a pagar: $totalPagar")
    }
}

@Preview(showBackground = true)
@Composable
fun Paso01SumaPreview() {
    MaterialTheme {
        Paso01TiendaScreen()
    }
}