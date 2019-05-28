//
//  PZAPIService.m
//  PZAPPObj
//
//  Created by ganesh faterpekar on 5/29/19.
//  Copyright © 2019 ganesh faterpekar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PZDataModels.h"
#import "PZAPIService.h"
#import "PZWebService.h"

@implementation PZAPIService
- (void)getToolTipData:(NSURLRequest *)request completion:(void (^)(PZData *result))completion {
    
    PZWebServices *webService = [[PZWebServices alloc] init];
    [webService doURLRequest:request completion:^(PZWebServiceResult *result) {
        
        NSError *localError = nil;
        NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:result.responseData options:0 error:&localError];
        NSArray *results = [parsedObject valueForKey:@"data"];
        
        PZData *tipData = [[PZData alloc] init];
        
        for ( NSDictionary *tipObjects in results )
        {
            [tipData setIdentifier:(tipObjects[@"id"])];
            [tipData setMessage:tipObjects[@"message"]];
            [tipData setImage:tipObjects[@"image"]];
        }
        
        completion(tipData);
    
    }];
    
}

-(void)downloadImage: (NSString *)imageUrl completion:(void (^)(UIImage *result))completion {
    
    dispatch_queue_t myQueue = dispatch_queue_create("My Queue",NULL);
    dispatch_async(myQueue, ^{
        // Perform long running process
        NSURL *url = [NSURL URLWithString:imageUrl];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:imageData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(image);
        });
    });
    

}

@end
