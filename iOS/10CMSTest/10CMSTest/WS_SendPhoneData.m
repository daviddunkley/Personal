//
//  WS_SendPhoneData.m
//  MoBankPush
//


//  Created by Marco De Girolamo on 23/09/11.
//  Copyright 2011 iostek di Marco De Girolamo. All rights reserved.
//

#import "WS_SendPhoneData.h"


@implementation WS_SendPhoneData

@synthesize webData;
@synthesize theXML;

-(void) sendRequest:(NSString *) identifier applicationBundle:(NSString *) bundleID serverURL:(NSString *) server
{	
	//Web Service Call
	NSString *soapMessage = [NSString stringWithFormat:
                             @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                             "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                             "<soap:Body>"
                             "<register xmlns=\"http://iostek.com/\">"
                             "<deviceID>%@</deviceID>"
                             "<deviceType>iphone</deviceType>"
                             "<email>xxx@xxx.xx</email>"
                             "<applicationID>%@</applicationID>"
                             "</register>"
                             "</soap:Body>"
                             "</soap:Envelope>",identifier,bundleID];
	
	NSURL *url =[NSURL URLWithString:[NSString stringWithFormat:@"%@RegistrationService/RegistrarWS.asmx", server]];
	
	NSLog(@"%@",soapMessage);
	NSLog(@"-- Waiting for response:.............");
    
	
	NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:300.0];            
	[theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];       
	[theRequest addValue: @"http://iostek.com/register" forHTTPHeaderField:@"Soapaction"];
	[theRequest addValue: [NSString stringWithFormat:@"%d", [soapMessage length]] forHTTPHeaderField:@"Content-Length"];
	[theRequest setHTTPMethod:@"POST"];     
	[theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
	NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
	
	if(theConnection) {
		webData = [[NSMutableData data] retain];
		
	}
	else {
		NSLog(@"theConnection is NULL");
	}
	
	[theConnection release];
}

-(void) connection:(NSURLConnection *) connection didReceiveData:(NSData *) sdata {
	[webData appendData:sdata];
}

-(void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    NSURLCredential *credential = [NSURLCredential credentialWithUser:@"Administrator" password:@"mdfeb272" persistence:NSURLCredentialPersistenceForSession];
    [[challenge sender] useCredential:credential forAuthenticationChallenge:challenge];
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
	//[webData release];
    
	NSLog(@"WS HANDLER SendPhoneData INFO : Connection fail with error..");
	
}

-(void) connectionDidFinishLoading:(NSURLConnection *) connection {
	NSLog(@"WS HANDLER SendPhoneData : Connection didFinishLoading., no error..");
	
	// Avverto il gestore di servizi che può passare al prossimo
    
	NSLog(@"WS HANDLER SendPhoneData : Connection response : DONE. Received Bytes: %d", [webData length]);
   	
    NSString *xmlString = [[NSString alloc] 
                           initWithBytes: [webData mutableBytes] 
                           length:[webData length] 
                           encoding:NSUTF8StringEncoding];
	self.theXML = xmlString;
    [xmlString release];
    
	if( self.theXML )
    {   self.theXML = [ self.theXML stringByReplacingOccurrencesOfString:@"&amp;" withString: @"&"  ];
		self.theXML = [ self.theXML stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""  ];
		self.theXML = [ self.theXML stringByReplacingOccurrencesOfString:@"&#x27;" withString:@"'"  ];
		self.theXML = [ self.theXML stringByReplacingOccurrencesOfString:@"&#x39;" withString:@"'"  ];
		self.theXML = [ self.theXML stringByReplacingOccurrencesOfString:@"&#x92;" withString:@"'"  ];
		self.theXML = [ self.theXML stringByReplacingOccurrencesOfString:@"&#x96;" withString:@"'"  ];
		self.theXML = [ self.theXML stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"  ];
		self.theXML = [ self.theXML stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"  ];
		self.theXML = [ self.theXML stringByReplacingOccurrencesOfString:@"<?xml version=\"1.0\" encoding=\"utf-16\"?>" withString:@""];
		
	}
	
    //---shows the XML---
   	NSLog(@"WS HANDLER SendPhoneData INFO : Connection response : %@",theXML);
    //	NSData *data = [NSMutableData dataWithBytes:[self.theXML UTF8String] length:[self.theXML length]];
    
    
}


- (void)dealloc {
    
	[webData release];
	[theXML release];
	[super dealloc];
}

@end

