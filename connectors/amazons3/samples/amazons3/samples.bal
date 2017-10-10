import ballerina.lang.system;
import ballerina.net.http;
import ballerina.net.http.response;

import org.wso2.ballerina.connectors.amazons3;

function main (string[] args) {

    amazons3:ClientConnector s3Connector;

    http:Response s3Response;
    int s3Status;
    string s3StringResponse;

    if (args[0] == "getBucketList") {
        system:println("Sampleeeeeee");
        s3Connector = create amazons3:ClientConnector(args[1], args[2], args[3]);
        system:println("sampleee22");
        s3Response = s3Connector.getBucketList ();

    }
    s3Status = response:getStatusCode(s3Response);
    system:println(s3Status);
    s3StringResponse = response:getStringPayload(s3Response);
    system:println(s3StringResponse);
}