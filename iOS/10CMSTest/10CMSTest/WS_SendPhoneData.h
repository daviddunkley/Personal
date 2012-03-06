//
//  WS_SendPhoneData.h
//  MoBankPush
//
//  Created by Marco De Girolamo on 23/09/11.
//  Copyright 2011 iostek di Marco De Girolamo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WS_SendPhoneData : NSObject {
    
    NSMutableData *webData;
    NSString *theXML;
    
}

@property (nonatomic, retain) NSMutableData *webData;
@property (nonatomic, retain) NSString *theXML;

-(void) sendRequest:(NSString *) identifier applicationBundle:(NSString *) bundleID serverURL:(NSString *) server;

@end
