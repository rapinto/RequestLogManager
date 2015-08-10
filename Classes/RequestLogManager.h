//
//  LogManager.h
//  Dealabs
//
//  Created by Raphaël Pinto on 07/08/2015.
//  Copyright (c) 2015 HUME Network. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "RPOperationManagerDelegate.h"



@interface RequestLogManager : NSObject <RPOperationManagerDelegate>



+ (RequestLogManager*)sharedInstance;



@end
