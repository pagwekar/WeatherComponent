@isTest
global class CallOutMock implements HttpCalloutMock {

    String responsebody;
    Integer Statuscode;
    
    public CallOutMock(string response, integer status_code) {
        responsebody = response;
        Statuscode = status_code;
    }
    
    //Method To Create a Fake Response
    global HTTPResponse respond(HTTPRequest req) {
        Integer status_code = Statuscode;
        HttpResponse res = new HttpResponse();
        res.setBody(responsebody);
        res.setStatusCode(Statuscode);
        return res;
    }
}