//
//  GRJComm.h
//  Jenkins
//
//  Created by Garrett Richards on 7/23/14.
//  Copyright (c) 2014 garrett richards. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"

@interface GRJComm : AFHTTPRequestOperation
- (void)setCustomHandler:(void (^)(NSHTTPURLResponse *resp, NSError *error, id responseObj))handler;
@end
