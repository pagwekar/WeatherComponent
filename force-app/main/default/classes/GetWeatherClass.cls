public class GetWeatherClass {
    //Method to Perform Callout to Weather APIdd
    @AuraEnabled
    public static string getWeatherData(string locationStr){
        try{
            //Get Integration Details
            IntegrationSetting__mdt settings = [Select EndPoint__c, Value__c from IntegrationSetting__mdt where developername='weatherApiKeys'];
            String endpoint = settings.EndPoint__c + '?q='+locationStr+'&units=metric&appid='+settings.Value__c;
            
            //Prepare Request
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request = CalloutHelper.createRequest(endpoint, 'GET');
            HttpResponse response = http.send(request);
            
            //Process Response
            if (response.getStatusCode() == 200) {  
               WeatherResponseWrapper results = (WeatherResponseWrapper)JSON.deserialize(response.getBody(),WeatherResponseWrapper.class);
               WeatherResponseWrapper.WeatherResponse weatherResult = results.main;
               return string.ValueOf(weatherResult.temp);
            }
            else {
                return 'failure';
            }
        }
        catch(Exception e){
            return 'failure';
        }        
    }
}