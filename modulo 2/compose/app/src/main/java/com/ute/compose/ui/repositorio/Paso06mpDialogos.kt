package com.ute.compose.ui.repositorio

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.window.Dialog

data class ReservaHotel2(
    val id: Int,
    val cliente: String,
    val habitacion: String,
    val favorito: Boolean
)

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun Paso06mpDialogosScreen() {

    var reservas by remember {
        mutableStateOf(
            listOf(
                ReservaHotel2(
                    1,
                    "Dayana",
                    "Suite",
                    true
                ),

                ReservaHotel2(
                    2,
                    "Carlos",
                    "Doble",
                    false
                ),

                ReservaHotel2(
                    3,
                    "Ana",
                    "Simple",
                    true
                )
            )
        )
    }

    var mostrarDialogo by remember {
        mutableStateOf(false)
    }

    var reservaEliminar by remember {
        mutableStateOf<ReservaHotel2?>(null)
    }

    Scaffold(

        topBar = {

            TopAppBar(

                title = {

                    Text(
                        text = "Reservas Hotel"
                    )
                }
            )
        },

        floatingActionButton = {

            FloatingActionButton(

                onClick = {
                    mostrarDialogo = true
                }
            ) {

                Icon(
                    Icons.Default.Add,
                    contentDescription = null
                )
            }
        }

    ) { paddingValues ->

        LazyColumn(

            modifier = Modifier
                .padding(paddingValues)
                .fillMaxSize(),

            contentPadding =
                PaddingValues(16.dp),

            verticalArrangement =
                Arrangement.spacedBy(8.dp)
        ) {

            items(

                reservas,
                key = { it.id }

            ) { reserva ->

                ElevatedCard(

                    modifier =
                        Modifier.fillMaxWidth()
                ) {

                    Row(

                        modifier =
                            Modifier.padding(16.dp),

                        verticalAlignment =
                            Alignment.CenterVertically
                    ) {

                        Box(

                            modifier = Modifier
                                .size(50.dp)
                                .clip(CircleShape)
                                .background(
                                    MaterialTheme.colorScheme.primaryContainer
                                ),

                            contentAlignment =
                                Alignment.Center
                        ) {

                            Text(

                                text =
                                    reserva.cliente.first().uppercase(),

                                fontWeight =
                                    FontWeight.Bold
                            )
                        }

                        Spacer(
                            modifier = Modifier.width(12.dp)
                        )

                        Column(
                            modifier = Modifier.weight(1f)
                        ) {

                            Text(
                                text = reserva.cliente,
                                fontWeight = FontWeight.Bold
                            )

                            Text(
                                text =
                                    "Habitación: ${reserva.habitacion}"
                            )
                        }

                        IconButton(

                            onClick = {

                                reservas =
                                    reservas.map {

                                        if (it.id == reserva.id)

                                            it.copy(
                                                favorito =
                                                    !it.favorito
                                            )

                                        else
                                            it
                                    }
                            }
                        ) {

                            Icon(

                                imageVector =

                                    if (reserva.favorito)
                                        Icons.Default.Favorite
                                    else
                                        Icons.Default.FavoriteBorder,

                                contentDescription = null
                            )
                        }

                        IconButton(

                            onClick = {

                                reservaEliminar =
                                    reserva
                            }
                        ) {

                            Icon(
                                Icons.Default.Delete,
                                contentDescription = null
                            )
                        }
                    }
                }
            }
        }
    }

    // DIALOGO NUEVA RESERVA
    if (mostrarDialogo) {

        Dialog(

            onDismissRequest = {
                mostrarDialogo = false
            }
        ) {

            Card {

                var cliente by remember {
                    mutableStateOf("")
                }

                var habitacion by remember {
                    mutableStateOf("")
                }

                Column(

                    modifier =
                        Modifier.padding(20.dp),

                    verticalArrangement =
                        Arrangement.spacedBy(12.dp)
                ) {

                    Text(
                        text = "Nueva Reserva",
                        style =
                            MaterialTheme.typography.titleLarge
                    )

                    OutlinedTextField(

                        value = cliente,

                        onValueChange = {
                            cliente = it
                        },

                        label = {
                            Text("Cliente")
                        },

                        leadingIcon = {
                            Icon(Icons.Default.Person, null)
                        },

                        singleLine = true,

                        modifier =
                            Modifier.fillMaxWidth(),

                        keyboardOptions =
                            KeyboardOptions(
                                imeAction =
                                    ImeAction.Next
                            )
                    )

                    OutlinedTextField(

                        value = habitacion,

                        onValueChange = {
                            habitacion = it
                        },

                        label = {
                            Text("Habitación")
                        },

                        leadingIcon = {
                            Icon(Icons.Default.Hotel, null)
                        },

                        singleLine = true,

                        modifier =
                            Modifier.fillMaxWidth(),

                        keyboardOptions =
                            KeyboardOptions(
                                keyboardType =
                                    KeyboardType.Text,

                                imeAction =
                                    ImeAction.Done
                            )
                    )

                    Row(

                        modifier =
                            Modifier.fillMaxWidth(),

                        horizontalArrangement =
                            Arrangement.End
                    ) {

                        TextButton(

                            onClick = {
                                mostrarDialogo = false
                            }
                        ) {

                            Text("Cancelar")
                        }

                        Spacer(
                            modifier = Modifier.width(8.dp)
                        )

                        Button(

                            onClick = {

                                reservas =
                                    reservas + ReservaHotel2(

                                        id =
                                            reservas.size + 1,

                                        cliente =
                                            cliente,

                                        habitacion =
                                            habitacion,

                                        favorito =
                                            false
                                    )

                                mostrarDialogo = false
                            }
                        ) {

                            Text("Guardar")
                        }
                    }
                }
            }
        }
    }

    // ALERT DIALOG ELIMINAR
    reservaEliminar?.let { reserva ->

        AlertDialog(

            onDismissRequest = {
                reservaEliminar = null
            },

            title = {
                Text("Eliminar Reserva")
            },

            text = {
                Text(
                    "¿Deseas eliminar la reserva de ${reserva.cliente}?"
                )
            },

            confirmButton = {

                Button(

                    onClick = {

                        reservas =
                            reservas.filter {

                                it.id != reserva.id
                            }

                        reservaEliminar = null
                    }
                ) {

                    Text("Eliminar")
                }
            },

            dismissButton = {

                OutlinedButton(

                    onClick = {
                        reservaEliminar = null
                    }
                ) {

                    Text("Cancelar")
                }
            }
        )
    }
}

@Preview(showBackground = true)
@Composable
fun Paso06Preview() {

    MaterialTheme {

        Paso06mpDialogosScreen()
    }
}