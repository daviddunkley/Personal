//
//  MBViewController.h
//  GATest
//
//  Created by David Dunkley on 27/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

@interface MBViewController : UIViewController

@property (nonatomic, retain) NSString *pageViewURI;

// GA Methods
- (bool)trackGAPageView:(NSString *)pageView;
- (bool)trackGAEvent:(NSString *)eventName forAction:(NSString *)action withLabel:(NSString *)label andValue:(NSNumber *)value;
- (bool)addGATransaction:(NSString *)orderUID forTotalPrice:(NSNumber *)totalPrice;
- (bool)addGATranItem:(NSString *)orderUID forSKU:(NSString *)sku andItemPrice:(NSNumber *)itemPrice andItemCount:(NSNumber *)itemCount andItemName:(NSString *)itemName;
- (bool)trackGATransactions;
- (bool)clearGATransactions;

- (NSString *)GetUUID;

@end
