//
//  SecondViewController.m
//  GATest
//
//  Created by David Dunkley on 27/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController

@synthesize trackTranButton = _trackTranButton;
@synthesize clearTranButton = _clearTranButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
        self.pageViewURI = @"/second/";
    }
    return self;
}
							
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)doTrackTrans:(id)sender
{
    NSString *orderUID = [self GetUUID];
    
    [self addGATransaction:orderUID forTotalPrice:[NSNumber numberWithFloat:13.23]];
    [self addGATranItem:orderUID forSKU:@"12121" andItemPrice:[NSNumber numberWithDouble:5] andItemCount:[NSNumber numberWithInt:2] andItemName:@"Item for £5.00"];
    [self addGATranItem:orderUID forSKU:@"5453" andItemPrice:[NSNumber numberWithDouble:3.23] andItemCount:[NSNumber numberWithInt:1] andItemName:@"Item for £3.23"];
    [self trackGATransactions];
    
    self.pageViewURI = [NSString stringWithFormat:@"/second/?orderID=%@", orderUID];
}

- (IBAction)doClearTrans:(id)sender
{
    NSString *orderUID = [self GetUUID];
    
    [self addGATransaction:orderUID forTotalPrice:[NSNumber numberWithFloat:13.23]];
    [self addGATranItem:orderUID forSKU:@"12121" andItemPrice:[NSNumber numberWithDouble:5] andItemCount:[NSNumber numberWithInt:2] andItemName:@"Item for £5.00"];
    [self addGATranItem:orderUID forSKU:@"5453" andItemPrice:[NSNumber numberWithDouble:3.23] andItemCount:[NSNumber numberWithInt:1] andItemName:@"Item for £3.23"];
    [self clearGATransactions];
}

@end
