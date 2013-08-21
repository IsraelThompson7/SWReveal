//
//  GradeObj.m
//  SWReveal
//
//  Created by scott mehus on 7/7/13.
//  Copyright (c) 2013 scott mehus. All rights reserved.
//

#import "GradeObj.h"

@implementation GradeObj

- (NSComparisonResult)compareName:(GradeObj *)other {
    
    return [self.gradeNumber compare:other.gradeNumber];
    
}




@end
