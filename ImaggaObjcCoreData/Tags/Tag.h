//
//  Tag.h
//  ImaggaObjcCoreData
//
//  Created by Jenny Chang on 26/03/2019.
//  Copyright © 2019 Jenny Chang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tag : NSObject

@property (nonatomic) NSString *tag;
@property (nonatomic) NSString *confidenceLevel;

-(instancetype)initWith:(NSString *)tag andConfidence:(NSString *)confidenceLevel;

@end

NS_ASSUME_NONNULL_END
