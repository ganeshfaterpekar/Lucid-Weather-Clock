//
//  WebService.h
//  PointziSDKOBJC
//
//  Created by ganesh faterpekar on 5/28/19.
//  Copyright © 2019 ganesh faterpekar. All rights reserved.
//

@interface PZWebServiceResult : NSObject
@property (weak, nonatomic) id delegate;
@property(nonatomic, retain) NSURLResponse *URLResponse;
@property(nonatomic, retain) NSData *responseData;
@property(nonatomic, retain) NSError *connectionError;

@end

@interface PZWebServices : NSObject
- (void)doURLRequest:(NSURLRequest *)request completion:(void (^)(PZWebServiceResult *result))completion;
@end






