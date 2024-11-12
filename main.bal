import ballerina/http;

// type Greeting record {|
//     string to;
//     string content;
// |};

int port = 8080;
string to = "Jim";
string content = "GM";
//Greeting greeting = ?; //Indicates that the configurable variable must be provided a value during the runtime or will throw an error

service http:Service / on new http:Listener(port){
    resource function post greeting() returns string{
        //string message = string `Hello ${greeting.to}! ${greeting.content}`;
        string message = string `Hello ${to}! ${content}`;
        return message;
    }
}


