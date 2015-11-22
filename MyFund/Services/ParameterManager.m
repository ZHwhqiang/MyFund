//
//  ParameterManager.m
//  Coucou
//
//  Created by Ralf on 3/24/15.
//  Copyright (c) 2015 next-software. All rights reserved.
//

#import "ParameterManager.h"

@implementation ParameterManager

@synthesize server;
@synthesize parameters;

- (void)load
{
    NSString* sParametersFilePath = [self filePath];

    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:sParametersFilePath];

    if(fileExists)
    {
        self.parameters = [[NSMutableDictionary alloc] initWithContentsOfFile:sParametersFilePath];
        self.sessionId = self.parameters[@"sessionId"];
    }
    else
    {
        self.parameters = [NSMutableDictionary new];
    }
}

- (void)save
{
    NSString* sParametersFilePath = [self filePath];

    if(self.sessionId && self.sessionId.length > 0)
    {
        self.parameters[@"sessionId"] = self.sessionId;
    }
    else
    {
        [self.parameters removeObjectForKey:@"sessionId"];
    }

    [self.parameters writeToFile:sParametersFilePath atomically:YES];
}

- (NSString*)filePath
{
    NSString* sDocumentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString* sParametersFilePath = [sDocumentsDirectory stringByAppendingPathComponent:@"parameters.plist"];
    return sParametersFilePath;
}

- (instancetype)init
{
    if(self = [super init])
    {
        server = @"http://www.picture-book-garden.com/cuckoo-server";
        //        server = @"http://192.168.100.104:8080/coucou-server";
        //        server = @"http://localhost:8080";
        [self load];
    }

    return self;
}

@end
