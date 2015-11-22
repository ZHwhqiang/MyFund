//
//  ParameterManager.h
//  Coucou
//
//  Created by Ralf on 3/24/15.
//  Copyright (c) 2015 next-software. All rights reserved
//

@import Foundation;

@interface ParameterManager : NSObject

@property(strong) NSMutableDictionary *parameters;

@property(strong, readonly) NSString *server;

@property(strong) NSString *sessionId;

- (void)load;

- (void)save;

@end
