import ballerina/http;
import ballerina/os;

type Greeting record {|
    string to;
    string content;
|};

configurable int port = 8080;
//configurable int port2 = ?;
//port2 = os:getEnv("port");
//string to = "Jim";
//string content = "GM";
//listener http:Listener httpListener = new(port);
//configurable Greeting greeting = ?; //Indicates that the configurable variable must be provided a value during the runtime or will throw an error
configurable string name = ?;
configurable string content = ?;

string envVar_name = os:getEnv("name");
string envVar_content = os:getEnv("content");

service http:Service / on new http:Listener(port){
    isolated resource function post greeting() returns string{
        //string message = string `Hello ${greeting.to}! ${greeting.content}`;
        string message = string `Hello ${name}! ${content} *** envVars - name ${envVar_name} content ${envVar_content}`;
        return message;
    }
}


