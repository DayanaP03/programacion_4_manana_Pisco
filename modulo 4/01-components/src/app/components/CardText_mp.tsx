import React from 'react'
import { ReactNode } from 'react'
import { StyleSheet, Text, View } from 'react-native'

interface HotelCardProps {
  children: ReactNode
  hotelNombre: string
  ubicacion: string
  precioPorNoche?: string
  estadoReserva?: string // Ej: "Confirmada", "Disponible", "Últimas habitaciones"
}

export function Card({ hotelNombre, ubicacion, precioPorNoche, estadoReserva, children }: HotelCardProps) {
  return (
    <View style={stylesCard.card}>
      <View style={stylesCard.cardCabecera}>
        <View style={stylesCard.cardCabeceraTop}>
          <Text style={stylesCard.cardTitulo} numberOfLines={1}>{hotelNombre}</Text>
          {estadoReserva ? (
            <View style={stylesCard.badgeContainer}>
              <Text style={stylesCard.badgeText}>{estadoReserva}</Text>
            </View>
          ) : null}
        </View>
        <Text style={stylesCard.cardSubtitulo}>{ubicacion}</Text>
      </View>
      
      <View style={stylesCard.cardCuerpo}>
        {children}
        {precioPorNoche ? (
          <View style={stylesCard.footerPrecio}>
            <Text style={stylesCard.labelPrecio}>Precio por noche</Text>
            <Text style={stylesCard.valorPrecio}>{precioPorNoche}</Text>
          </View>
        ) : null}
      </View>
    </View>
  )
}

const stylesCard = StyleSheet.create({
  card: {
    backgroundColor: '#121212',
    borderRadius: 12,
    overflow: 'hidden',
    borderWidth: 1,
    borderColor: '#2a2a2a',
    shadowColor: '#ff007f',
    shadowOpacity: 0.12,
    shadowRadius: 8,
    shadowOffset: { width: 0, height: 4 },
    elevation: 4,
    marginBottom: 16,
  },
  cardCabecera: {
    backgroundColor: '#1a1a1a',
    paddingHorizontal: 16,
    paddingVertical: 12,
    borderBottomWidth: 1,
    borderBottomColor: '#2a2a2a',
    gap: 4,
  },
  cardCabeceraTop: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  cardTitulo: {
    fontSize: 16,
    fontWeight: '700',
    color: '#ffffff',
    flex: 1,
    marginRight: 8,
  },
  badgeContainer: {
    backgroundColor: 'rgba(255, 0, 127, 0.15)',
    paddingHorizontal: 8,
    paddingVertical: 3,
    borderRadius: 6,
    borderWidth: 1,
    borderColor: 'rgba(255, 0, 127, 0.4)',
  },
  badgeText: {
    fontSize: 10,
    fontWeight: '600',
    color: '#ff007f',
    textTransform: 'uppercase',
  },
  cardSubtitulo: {
    fontSize: 12,
    color: '#9e9e9e',
  },
  cardCuerpo: {
    padding: 12,
    gap: 8,
  },
  footerPrecio: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginTop: 8,
    paddingTop: 8,
    borderTopWidth: 1,
    borderTopColor: '#2a2a2a',
  },
  labelPrecio: {
    fontSize: 12,
    color: '#9e9e9e',
  },
  valorPrecio: {
    fontSize: 16,
    fontWeight: '700',
    color: '#ff007f',
  },
})