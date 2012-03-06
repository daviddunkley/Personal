//
//  SecondViewController.h
//  GATest
//
//  Created by David Dunkley on 27/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

@interface SecondViewController : MBViewController

@property (nonatomic, retain) IBOutlet UIButton *trackTranButton;
@property (nonatomic, retain) IBOutlet UIButton *clearTranButton;

- (IBAction)doTrackTrans:(id)sender;
- (IBAction)doClearTrans:(id)sender;

@end
