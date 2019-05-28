//
//  WebService.m
//  PointziSDKOBJC
//
//  Created by ganesh faterpekar on 5/28/19.
//  Copyright © 2019 ganesh faterpekar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PZWebService.h"


@implementation PZWebServiceResult
@end

@implementation PZWebServices

- (void)doURLRequest:(NSURLRequest *)request completion:(void (^)(PZWebServiceResult *result))completion {
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                            PZWebServiceResult *res = [[PZWebServiceResult alloc] init];
                                            res.responseData = data;
                                            res.URLResponse = response;
                                            res.connectionError = error;
                                                
                                            completion(res);
                                   }];

    [task resume];
}



@end
