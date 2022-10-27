import * as React from 'react';

import { Dimensions, StyleSheet } from 'react-native';
import { AwesomeLibraryView } from 'react-native-awesome-library';

export default function App() {
  return (
    <AwesomeLibraryView
      items={['teste 3', 'item 22']}
      color="#32a852"
      style={styles.list}
      onPress={(event) => console.log(event.nativeEvent)}
    />
  );
}

const styles = StyleSheet.create({
  list: {
    width: Dimensions.get('screen').width,
    height: Dimensions.get('screen').height,
  },
});
