import { StyleSheet } from 'react-native'

import TarjetaHotel from './components/TarjetaServidor_mp'
import { ThemedText } from '@/components/themed-text'
import { ThemedView } from '@/components/themed-view'

export default function ReservaScreen() {
  return (
    <ThemedView style={styles.container} type="background">
      <ThemedText type="title" style={styles.headerTitle}>
        Reservas
      </ThemedText>

      <ThemedText type="subtitle" style={styles.sectionSubtitle}>
        Hoteles Destacados
      </ThemedText>

      <TarjetaHotel nombre="Grand Luxury Hotel & Spa" ubicacion="Miami Beach" categoria="5 Estrellas" />
      <TarjetaHotel nombre="Urban Boutique Suites" ubicacion="New York City" categoria="4 Estrellas" />
      <TarjetaHotel nombre="Seaside Resort & Club" ubicacion="Cancun" categoria="All Inclusive" />
    </ThemedView>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 16,
    paddingTop: 48,
    backgroundColor: '#0a0a0a',
  },
  headerTitle: {
    marginBottom: 8,
  },
  sectionSubtitle: {
    marginBottom: 16,
  },
})
