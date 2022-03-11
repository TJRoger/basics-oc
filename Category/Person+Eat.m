//
//  Person+Eat.m
//  Category
//
//  Created by Roger Luo on 2022/3/9.
//

#import "Person+Eat.h"

@implementation Person (Eat)

- (void)eat{
    NSLog(@"eat meal %@\n", [self meal]);
}

+ (void)eatMeal {
    printf("eat meal\n");
}
@end
