@isTest(seeAllData = False)
public class GetWeatherClassTest{

    static testMethod void getWeatherTest(){           
        test.startTest();                 
            String responseString =  '{'+
                                    '  '+
                                    '  "main": {'+
                                    '    "temp": 30.32,'+
                                    '    "pressure": 1012,'+
                                    '    "humidity": 81,'+
                                    '    "temp_min": 20.15,'+
                                    '    "temp_max": 35.15'+
                                    '  }'+
                                    ' '+
                                    '}';
            Test.setMock(HttpCalloutMock.class, new CallOutMock(responseString, 200));            
            string resultTemp = GetWeatherClass.getWeatherData('Mumbai');                    
            system.assertEquals(resultTemp, '30.32');
        test.stopTest();
    }
    
     
     static testMethod void getWeatherExceptionTest(){           
        test.startTest();                 
            String responseString =  '';
            Test.setMock(HttpCalloutMock.class, new CallOutMock(responseString, 404));            
            string resultTemp = GetWeatherClass.getWeatherData('Mumbai');              
            system.assertEquals(resultTemp, 'failure');
        test.stopTest();
    }
}