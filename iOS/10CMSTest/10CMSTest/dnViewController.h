//
//  dnViewController.h
//  10CMSTest
//
//  Created by David Dunkley on 18/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface dnViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *cmsWebView;
@property (nonatomic, retain) UIButton *refreshButton;

@end
