// app/index.tsx — Componente adaptado para Reserva de Hotel
import React from 'react'
import { useState } from 'react'
import { Pressable, StyleSheet, Text, View } from 'react-native'

export function Paso1_mp() {
  const [intentos, setIntentos] = useState<number>(0)
  const [conectado, setConectado] = useState<boolean>(false)

  function manejarReintento() {
    if (conectado) return
    const nuevoIntento = intentos + 1
    setIntentos(nuevoIntento)

    if (nuevoIntento >= 3) {
      setConectado(true)
    }
  }

  function reiniciar() {
    setIntentos(0)
    setConectado(false)
  }

  const estadoTexto = conectado
    ? '✓ Reserva Confirmada con Éxito'
    : `Intento de pago ${intentos} de 3 fallido`

  const colorEstado = conectado ? '#ff007f' : '#cf6679'

  return (
    <View style={styles.contenedor}>
      <Text style={styles.titulo}>Proceso de Pago - Hotel</Text>

      <View style={[styles.tarjeta, { borderColor: colorEstado }]}>
        <Text style={[styles.estado, { color: colorEstado }]}>
          {estadoTexto}
        </Text>
        <Text style={styles.detalle}>Grand Luxury Hotel & Spa · $280.00 / noche</Text>
      </View>

      <Pressable
        style={({ pressed }) => [
          styles.boton,
          conectado ? styles.botonDeshabilitado : styles.botonActivo,
          pressed && !conectado && { opacity: 0.75 },
        ]}
        onPress={manejarReintento}
        disabled={conectado}
      >
        <Text style={styles.textoBoton}>
          {conectado ? 'Reservado' : 'Reintentar Pago'}
        </Text>
      </Pressable>

      <Pressable style={styles.botonSecundario} onPress={reiniciar}>
        <Text style={styles.textoSecundario}>Reiniciar simulación</Text>
      </Pressable>
    </View>
  )
}

export { Paso1_mp as Paso1 }

const styles = StyleSheet.create({
  contenedor: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 24,
    backgroundColor: '#0a0a0a',
    gap: 16,
  },
  titulo: {
    fontSize: 20,
    fontWeight: '700',
    color: '#ffffff',
  },
  tarjeta: {
    width: '100%',
    padding: 16,
    borderRadius: 10,
    borderWidth: 2,
    backgroundColor: '#121212',
    gap: 6,
  },
  estado: {
    fontSize: 15,
    fontWeight: '600',
  },
  detalle: {
    fontSize: 13,
    color: '#9e9e9e',
  },
  boton: {
    width: '100%',
    paddingVertical: 14,
    borderRadius: 8,
    alignItems: 'center',
  },
  botonActivo: {
    backgroundColor: '#ff007f',
  },
  botonDeshabilitado: {
    backgroundColor: '#880e4f',
  },
  textoBoton: {
    color: '#ffffff',
    fontWeight: '600',
    fontSize: 15,
  },
  botonSecundario: {
    paddingVertical: 10,
  },
  textoSecundario: {
    color: '#ff007f',
    fontSize: 14,
  },
})