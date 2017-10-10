package org.wso2.ballerina.connectors.amazons3;

import org.wso2.ballerina.connectors.amazonauth;
import ballerina.doc;
import ballerina.net.http;
import ballerina.net.http.request;
import ballerina.lang.system;


@doc:Description { value:"Amazon S3 client connector"}
@doc:Param { value:"accessKeyId: The access key ID of the Amazon Account"}
@doc:Param { value:"secretAccessKey: The secret access key of the Amazon Account"}
@doc:Param { value:"region: The region to which the request is made"}
public connector ClientConnector (string accessKeyId, string secretAccessKey, string region) {

    amazonauth:ClientConnector amazonAuthConnector;

    @doc:Description { value:"Get List of Buckets"}
    @doc:Return { value:"response object"}
    action getBucketList () (http:Response) {
        http:Request requestMsg = {};
        http:Response response = {};
        system:println("Inside connectorrrrrrrrr");
        string httpMethod = "GET";
        string requestURI = "/";
        string host = "s3.amazonaws.com:443";
        string endpoint = "https://" + host;
        amazonAuthConnector = create amazonauth:ClientConnector(accessKeyId, secretAccessKey, region,
                                                                "s3", "aws4_request", endpoint);
        request:setHeader(requestMsg, "Host", host);
        request:setHeader(requestMsg, "X-Amz-Content-Sha256", "UNSIGNED-PAYLOAD");
        response = amazonAuthConnector.request (requestMsg, httpMethod, requestURI, "UNSIGNED-PAYLOAD");

        return response;
    }
}