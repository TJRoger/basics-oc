//
//  Person+Eat.m
//  Category
//
//  Created by Roger Luo on 2022/3/9.
//

#import "Person+Eat.h"
#import <objc/runtime.h>

@implementation Person (Eat)

@dynamic meal;

static void *mealPropertyKey; // = &mealPropertyKey;
const void *WeightPropertyKey;

- (void)eat{
    NSLog(@"eat meal %@\n", [self meal]);
}

+ (void)eatMeal {
    printf("eat meal\n");
}

- (void)run {
    printf("eat run\n");
}

- (NSString *)meal {
    return objc_getAssociatedObject(self, mealPropertyKey);
}

- (void)setMeal:(NSString *)meal {
    objc_setAssociatedObject(self, mealPropertyKey, meal, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (int)weight {
    return [objc_getAssociatedObject(self, WeightPropertyKey) intValue];
}

- (void)setWeight:(int)weight {
    objc_setAssociatedObject(self, WeightPropertyKey, @(weight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
