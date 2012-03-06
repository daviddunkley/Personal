//
//  dnViewController.m
//  10CMSTest
//
//  Created by David Dunkley on 18/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "dnViewController.h"
//#import "JSON/JSON.h"

@implementation dnViewController

@synthesize cmsWebView = _cmsWebView;
@synthesize refreshButton = _refreshButton;

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
    self.cmsWebView.delegate = self;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSURL *cmsURL = [[NSURL alloc] initWithString:@"http://sitiosparausted.com/10cms/orphan.html"];
    [self.cmsWebView loadRequest:[NSURLRequest requestWithURL:cmsURL]]; 
    
//    [cmsURL release];
    
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
    // Return YES for supported orientations`
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request 
 navigationType:(UIWebViewNavigationType)navigationType {
    NSString *requestString = [[request URL] absoluteString];
    NSLog(@"%@", [requestString substringToIndex:33]);
    
    if ([[requestString substringToIndex:33] isEqualToString:@"http://m.hmv.com/product/details/"]) 
    {
        NSString *SKU = [requestString lastPathComponent];
        NSLog(@"Request for SKU %@", SKU);
        return NO;
    }
    
    return YES; // Return YES to make sure regular navigation works as expected.
}

@end
