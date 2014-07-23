//
//  GRJComm.m
//  Jenkins
//
//  Created by Garrett Richards on 7/23/14.
//  Copyright (c) 2014 garrett richards. All rights reserved.
//

#import "GRJComm.h"

@implementation GRJComm
- (void)setCustomHandler:(void (^)(NSHTTPURLResponse *resp, NSError *error, id responseObj))handler {
    [self setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (handler)
            handler(operation.response, nil, operation.responseObject);

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (handler)
            handler(operation.response, error, operation.responseObject);
    }];
}

@end
