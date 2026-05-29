package com.ute.compose.ui.respositio

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Favorite
import androidx.compose.material.icons.filled.FavoriteBorder
import androidx.compose.material.icons.filled.Hotel
import androidx.compose.material.icons.filled.Person
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

data class Reserva(
    val cliente: String,
    val habitacion: String,
    val noches: Int,
    val favorito: Boolean
)

val reservasDeMuestra = listOf(

    Reserva(
        "Dayana",
        "Suite",
        3,
        true
    ),

    Reserva(
        "Carlos",
        "Doble",
        2,
        false
    ),

    Reserva(
        "Ana",
        "Simple",
        1,
        true
    )
)

@Composable
fun TarjetaReserva(
    reserva: Reserva,
    onClick: () -> Unit = {},
    onFavorito: () -> Unit = {}
) {

    ElevatedCard(
        onClick = onClick,
        modifier = Modifier.fillMaxWidth()
    ) {

        Row(
            modifier = Modifier.padding(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {

            Box(
                modifier = Modifier
                    .size(52.dp)
                    .clip(CircleShape)
                    .background(
                        MaterialTheme.colorScheme.primaryContainer
                    ),
                contentAlignment = Alignment.Center
            ) {

                Icon(
                    imageVector = Icons.Default.Person,
                    contentDescription = null
                )
            }

            Spacer(modifier = Modifier.width(12.dp))

            Column(
                modifier = Modifier.weight(1f)
            ) {

                Text(
                    text = reserva.cliente,
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Bold
                )

                Text(
                    text = "Habitación: ${reserva.habitacion}",
                    style = MaterialTheme.typography.bodyMedium
                )

                Spacer(modifier = Modifier.height(4.dp))

                AssistChip(
                    onClick = {},
                    label = {
                        Text(
                            "${reserva.noches} noches"
                        )
                    },
                    leadingIcon = {
                        Icon(
                            imageVector = Icons.Default.Hotel,
                            contentDescription = null
                        )
                    }
                )
            }

            IconButton(
                onClick = onFavorito
            ) {

                Icon(
                    imageVector =
                        if (reserva.favorito)
                            Icons.Default.Favorite
                        else
                            Icons.Default.FavoriteBorder,

                    contentDescription = null,

                    tint =
                        if (reserva.favorito)
                            MaterialTheme.colorScheme.error
                        else
                            MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}

@Composable
fun Paso02mpReservaScreen() {

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),

        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {

        Text(
            text = "RESERVAS DE HOTEL",
            style = MaterialTheme.typography.titleLarge
        )

        HorizontalDivider()

        reservasDeMuestra.forEach { reserva ->

            TarjetaReserva(
                reserva = reserva
            )
        }

        HorizontalDivider()

        Card(
            modifier = Modifier.fillMaxWidth()
        ) {

            Text(
                text = "Card simple",
                modifier = Modifier.padding(16.dp)
            )
        }

        ElevatedCard(
            modifier = Modifier.fillMaxWidth()
        ) {

            Text(
                text = "ElevatedCard con sombra",
                modifier = Modifier.padding(16.dp)
            )
        }

        OutlinedCard(
            modifier = Modifier.fillMaxWidth()
        ) {

            Text(
                text = "OutlinedCard con borde",
                modifier = Modifier.padding(16.dp)
            )
        }
    }
}

@Preview(showBackground = true)
@Composable
fun Paso02ReservaPreview() {

    MaterialTheme {
        Paso02mpReservaScreen()
    }
}