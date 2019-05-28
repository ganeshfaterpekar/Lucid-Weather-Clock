//
//  PZAPIService.h
//  PZAPPObj
//
//  Created by ganesh faterpekar on 5/29/19.
//  Copyright © 2019 ganesh faterpekar. All rights reserved.
//

#import "PZDataModels.h"
#import <Foundation/Foundation.h>

@interface PZAPIService : NSObject
- (void)getToolTipData: (NSURLRequest *)request completion:(void (^)(PZData *result))completion;
- (void)downloadImage: (NSString *)imageUrl completion:(void (^)(UIImage *result))completion;
@end
