public class CalloutHelper {

//test2
       public static HttpRequest createRequest(string requestEndpoint, string callMethod){
           HttpRequest request = new HttpRequest();
           request.setEndpoint(requestEndpoint);
           request.setMethod(callMethod);           
           return request;
       }


}