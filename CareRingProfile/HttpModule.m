//
//  HttpModule.m
//  CareRingProfile
//
//  Created by James Stiehl on 1/15/15.
//  Copyright (c) 2015 James Stiehl. All rights reserved.
//

#import "HttpModule.h"

@implementation HttpModule

-(void)httpRequest: (NSString *)path requestMethod:(NSString *)method {
    
    request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:path]];
    
    if(method == nil){
       request.HTTPMethod = @"GET";
    } else {
      request.HTTPMethod = method;
    }
    
    connection = [NSURLConnection connectionWithRequest:request delegate:self];

}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    // This is where I will add post my notification and include the data to send back to the app delegate
    json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%@", json);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"httpDataReceived" object:json];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    //might want to put some sort of error logging or handling
}
@end
