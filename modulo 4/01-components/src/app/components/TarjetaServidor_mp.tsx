import React from 'react'
import { StyleSheet, Text, View } from 'react-native'

interface TarjetaHotelProps {
  nombre: string
  ubicacion: string
  categoria: string
}

export function TarjetaServidormp({ nombre, ubicacion, categoria }: TarjetaHotelProps) {
  return (
    <View style={styles.card}>
      <Text style={styles.nombre}>{nombre}</Text>
      <Text style={styles.detalles}>{ubicacion} · {categoria}</Text>
    </View>
  )
}

export default TarjetaServidormp

const styles = StyleSheet.create({
  card: {
    backgroundColor: '#121212',
    borderRadius: 12,
    padding: 16,
    borderWidth: 1,
    borderColor: '#2a2a2a',
    marginBottom: 12,
  },
  nombre: {
    fontSize: 16,
    fontWeight: '700',
    color: '#ffffff',
    marginBottom: 4,
  },
  detalles: {
    fontSize: 13,
    color: '#ff007f',
    fontFamily: 'monospace',
  },
})