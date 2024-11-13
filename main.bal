import ballerina/http;

type Greeting record {|
    string to;
    string content;
|};

configurable int port = 8080;
//string to = "Jim";
//string content = "GM";
//listener http:Listener httpListener = new(port);
configurable Greeting greeting = ?; //Indicates that the configurable variable must be provided a value during the runtime or will throw an error

service http:Service / on new http:Listener(port){
    isolated resource function post greeting() returns string{
        string message = string `Hello ${greeting.to}! ${greeting.content}`;
        //string message = string `Hello ${name}! ${content}`;
        return message;
    }
}


