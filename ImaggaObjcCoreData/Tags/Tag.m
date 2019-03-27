//
//  Tag.m
//  ImaggaObjcCoreData
//
//  Created by Jenny Chang on 26/03/2019.
//  Copyright © 2019 Jenny Chang. All rights reserved.
//

#import "Tag.h"

@implementation Tag

-(instancetype)initWith:(NSString *)tag andConfidence:(NSString *)confidenceLevel {
    
    self = [super init];
    if (self) {
        self.tag = tag;
        self.confidenceLevel = confidenceLevel;
    }
    return self;
}

@end
