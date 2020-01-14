import { LightningElement ,track} from 'lwc';
import getWeatherData from '@salesforce/apex/GetWeatherClass.getWeatherData';
export default class WeatherComponent extends LightningElement {
    @track locationStr = 'Dubai';
    @track weatherStr;

    connectedCallback(){
        this.getTempreture();
    }
    
    //handle location change
    handleLocationChange(event) {
        this.locationStr = event.target.value;
        this.getTempreture();
    }

    //perform weather API call out from APEX
    getTempreture(){
        getWeatherData({ locationStr: encodeURIComponent(this.locationStr) })
            .then(result => {
                if(result !== 'failure') {
                    this.weatherStr = result + '° C';
                }
                else{
                    this.weatherStr = '-- ° C';
                }
            })
            .catch(error => {
                this.error = error;
            });
    }

}