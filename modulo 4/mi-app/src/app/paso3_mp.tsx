// app/components/Paso3.tsx
import * as React from 'react'
import { Alert, Image, Pressable, StyleSheet, Text, View } from 'react-native'

export function Paso3mp() {
  return (
    <View style={styles.contenedor}>
      <Image
        source={{ uri: 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=200&auto=format&fit=crop&q=80' }}
        style={styles.photo}
      />
      <Text style={styles.titulo}>Suite de Lujo - Hotel</Text>

      <Text style={styles.name}>Grand Suite Vista al Mar</Text>
      <Text style={styles.position}>Incluye desayuno y spa</Text>

      <Pressable
        style={({ pressed }) => [
          styles.boton,
          pressed && styles.botonPresionado,
        ]}
        onPress={() => Alert.alert('Habitación Seleccionada', 'Procediendo con la reserva...')}
      >
        <Text style={styles.textoBoton}>Reservar Habitación</Text>
      </Pressable>
    </View>
  )
}

const styles = StyleSheet.create({
  contenedor: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    gap: 16,
    backgroundColor: '#0a0a0a',
    padding: 24,
  },
  photo: {
    width: 80,
    height: 80,
    borderRadius: 40,
    borderWidth: 1,
    borderColor: '#ff007f',
  },
  titulo: {
    fontSize: 20,
    fontWeight: '600',
    color: '#ffffff',
  },
  boton: {
    backgroundColor: '#ff007f',
    paddingVertical: 12,
    paddingHorizontal: 24,
    borderRadius: 8,
  },
  botonPresionado: {
    backgroundColor: '#c50063',
  },
  textoBoton: {
    color: '#ffffff',
    fontWeight: '600',
    fontSize: 16,
  },
  name: {
    fontSize: 20,
    fontWeight: '600',
    backgroundColor: '#121212',
    color: '#ffffff',
    paddingHorizontal: 12,
    paddingVertical: 6,
    borderRadius: 6,
    overflow: 'hidden',
  },
  position: {
    fontSize: 16,
    color: '#9e9e9e',
    fontWeight: '400',
    backgroundColor: '#121212',
    paddingHorizontal: 12,
    paddingVertical: 4,
    borderRadius: 6,
    overflow: 'hidden',
  },
})