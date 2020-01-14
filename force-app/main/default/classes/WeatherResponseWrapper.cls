public class WeatherResponseWrapper{
   @AuraEnabled
   public WeatherResponse main;

    public class WeatherResponse {
        @AuraEnabled
        public Double temp;
        
        @AuraEnabled
        public Integer pressure;
        
        @AuraEnabled
        public Integer humidity;
        
        @AuraEnabled
        public Double temp_min; 
        
        @AuraEnabled
        public Double temp_max; 
    }
    
}