import { StatusBar,StyleSheet, Text, View } from 'react-native';
import { store } from './src/DataStore/app/store'
import { Provider } from 'react-redux'


import NavbarM from './src/Components/Navbar/NavbarM';
import { ViewComponent } from 'react-native';
import HomePage from './src/Pages/HomePage';
import IndexStart from './src/IndexStart';

export default function App() {

  return (
   
    <Provider store={store}>
      <View>
       <StatusBar
            animated={true}
            backgroundColor="#ffff"
            barStyle='dark-content'
      />
       <NavbarM/>
     <IndexStart/>
        </View>
  </Provider>
  
  );
}



const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
