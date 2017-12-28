import {NativeModules, NativeEventEmitter} from 'react-native';

const RNQWSdk = NativeModules.RNQWSdk;
const RNQWSdkEmitter = new NativeEventEmitter(RNQWSdk);


module.exports = {
  test(name) {
    RNQWSdk.test(name);
  },

  init(data){
    RNQWSdk.init(data);
  },

  subscribe(callback){
  	RNQWSdkEmitter.addListener( 'QWCallback', (data) => callback(data));
  }

  unsuscribe(){
  	RNQWSdkEmitter.removeListener("QWCallback", () => console.log("Successfully removed QWCallback listener"));
  }
}
