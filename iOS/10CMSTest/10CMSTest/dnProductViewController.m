//
//  dnProductViewController.m
//  10CMSTest
//
//  Created by David Dunkley on 27/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "dnProductViewController.h"
#import "Constants.h"

@implementation dnProductViewController

@synthesize SKU = _SKU;

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
    
	responseData = [[NSMutableData data] retain];
    NSString *productURI = [NSString stringWithFormat:LISTING_DETAIL, self.SKU];
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:productURI]];
	[[NSURLConnection alloc] initWithRequest:request delegate:self];    
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

@end
