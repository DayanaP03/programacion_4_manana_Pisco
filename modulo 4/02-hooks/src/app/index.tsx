import { StyleSheet, View } from 'react-native'
import { Paso1_mp } from './components/Paso1_mp'

export default function HomeScreen() {
  return (
    <View style={styles.screen}>
      <Paso1_mp />
    </View>
  )
}

const styles = StyleSheet.create({
  screen: {
    flex: 1,
    backgroundColor: '#0a0a0a',
  },
})
