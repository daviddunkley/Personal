//
//  MBViewController.m
//  GATest
//
//  Created by David Dunkley on 27/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MBViewController.h"
#import "GANTracker.h"

@implementation MBViewController

@synthesize pageViewURI = _pageViewURI;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self trackGAPageView:self.pageViewURI];
}

- (bool)trackGAPageView:(NSString *)pageView
{
    NSError *error;
    if (![[GANTracker sharedTracker] trackPageview:pageView withError:&error])
    {
        NSLog(@"GANTracker trackPageview Error: %@, %@", [error description], [error debugDescription]);
        return NO;
    }
    
    return YES;
}

- (bool)trackGAEvent:(NSString *)eventName forAction:(NSString *)action withLabel:(NSString *)label andValue:(NSNumber *)value
{
    NSError *error;
    if (![[GANTracker sharedTracker] trackEvent:eventName
                                     action:action 
                                      label:label 
                                     value:[value integerValue]
                                  withError:&error])
    {
        NSLog(@"GANTracker trackEvent Error: %@, %@", [error description], [error debugDescription]);
        return NO;
    }
    
    return YES;
}


- (bool)addGATransaction:(NSString *)orderUID forTotalPrice:(NSNumber *)totalPrice
{
    NSError *error;
    if (![[GANTracker sharedTracker] addTransaction:orderUID 
                                    totalPrice:13.23 
                                     storeName:@"MoBank Test Client" 
                                      totalTax:0.00 
                                  shippingCost:0.00 
                                     withError:&error])
    {
        NSLog(@"GANTracker addTransaction Error: %@, %@", [error description], [error debugDescription]);
        return NO;
    }
    return YES;
}

- (bool)addGATranItem:(NSString *)orderUID forSKU:(NSString *)sku andItemPrice:(NSNumber *)itemPrice andItemCount:(NSNumber *)itemCount andItemName:(NSString *)itemName
{
    NSError *error;
    if (![[GANTracker sharedTracker] addItem:orderUID
                                itemSKU:sku
                              itemPrice:[itemPrice doubleValue]
                              itemCount:[itemCount integerValue]
                               itemName:itemName
                           itemCategory:@""
                              withError:&error])
    {
        NSLog(@"addItem Error: %@, %@", [error description], [error debugDescription]);
        return NO;
    }
    return YES;
}

- (bool)trackGATransactions
{
    NSError *error;
    if (![[GANTracker sharedTracker] trackTransactions:nil])
    {
        NSLog(@"GANTracker trackTransactions Error: %@, %@", [error description], [error debugDescription]);
        return NO;
    }
    return YES;
}

- (bool)clearGATransactions 
{
    NSError *error;
    if (![[GANTracker sharedTracker] clearTransactions:nil])
    {
        NSLog(@"GANTracker clearTransactions Error: %@, %@", [error description], [error debugDescription]);
        return NO;
    }
    return YES;
}

- (NSString *)GetUUID
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);

    return (__bridge NSString *)string;
}

@end
