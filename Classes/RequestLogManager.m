//
//  LogManager.m
//  Dealabs
//
//  Created by Raphaël Pinto on 07/08/2015.
//  Copyright (c) 2015 HUME Network. All rights reserved.
//



#import "RequestLogManager.h"
#import "RPOperationManager.h"
#import "RPRequestOperation.h"



@implementation RequestLogManager



#pragma mark -
#pragma mark Singleton Methods



static RequestLogManager* sharedInstance = nil;



+ (RequestLogManager*)sharedInstance
{
    if (!sharedInstance)
    {
        sharedInstance = [[RequestLogManager alloc] init];
    }
    
    return sharedInstance;
}



#pragma mark -
#pragma mark Operation Manager Delegate Methods



- (void)operationManager:(RPOperationManager*)operationManager
     didSucceedOperation:(RPRequestOperation*)operation
      withResponseObject:(id)responseObject
{
    NSLog(@"##################REQUEST##################");
    NSLog(@"%@ - %@", operation.request.HTTPMethod, operation.request.URL);
    NSLog(@"%@", operation.request.allHTTPHeaderFields);
    
    if (operation.request.HTTPBody)
    {
        NSString* lContent = [[NSString alloc] initWithData:operation.request.HTTPBody encoding:NSUTF8StringEncoding];
        NSLog(@"Content %@", lContent);
    }
    
    NSLog(@"-----------------RESPONSE------------------");
    NSLog(@"Status Code %li", (long)operation.response.statusCode);
    NSLog(@"%@", operation.response.allHeaderFields);
    NSLog(@"Object Response %@", responseObject);
    NSLog(@"##########################################");
}


- (void)operationManager:(RPOperationManager*)operationManager
        didFailOperation:(RPRequestOperation*)operation
               withError:(NSError*)error
{
    NSLog(@"##################REQUEST##################");
    NSLog(@"%@  - %@", operation.request.HTTPMethod, operation.request.URL);
    NSLog(@"%@", operation.request.allHTTPHeaderFields);
    NSString* lContent = [[NSString alloc] initWithData:operation.request.HTTPBody encoding:NSUTF8StringEncoding];
    NSLog(@"Content %@", lContent);
    NSLog(@"-----------------RESPONSE------------------");
    NSLog(@"Status Code %li - Error %@", (long)operation.response.statusCode, error.localizedDescription);
    NSLog(@"%@", operation.response.allHeaderFields);
    NSLog(@"Object Response %@", operation.responseObject);
    NSLog(@"##########################################");
}


@end
