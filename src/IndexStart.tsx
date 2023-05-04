import React from 'react'
import { ScrollView, View } from 'react-native'
import HomePage from './Pages/HomePage'
import indexStyles from './IndexStartStyle'

function IndexStart() {
  return (
      <ScrollView style={indexStyles.body}>
         <HomePage/>
      </ScrollView>
    )
}

export default IndexStart