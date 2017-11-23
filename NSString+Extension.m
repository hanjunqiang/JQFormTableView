//
//  NSString+Extension.m
//  UILabel高度解析
//
//  Created by apple on 2017/9/13.
//  Copyright © 2017年 Mrhan. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)



/**
 * 计算文字高度，可以处理计算带行间距的
 */
- (CGSize)jq_boundingRectWithSize:(CGSize)size font:(UIFont*)font  lineSpacing:(CGFloat)lineSpacing
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:self];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    /**
        不能在这里尝试判断一行（无法获取高度）和是否包含中文
        （重点是，一行的时候外面style就不能设置lineSpacing,因为那样虽然得到的高度是对的，
          但是一行的时候文字顶了上去，超过了控件的顶部。）
     */
    paragraphStyle.lineSpacing = lineSpacing;
    
    [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.length)];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, self.length)];
    
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesDeviceMetrics;
    CGRect rect = [attributeString boundingRectWithSize:size options:options context:nil];
    
    //    NSLog(@"size:%@", NSStringFromCGSize(rect.size));
    
    //文本的高度减去字体高度小于等于行间距，判断为当前只有1行.
    if ((rect.size.height - font.lineHeight) <= paragraphStyle.lineSpacing) {
        if ([self jq_containChinese:self]) {  //如果包含中文,需要去掉一个行间距。
            rect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height-paragraphStyle.lineSpacing);
        }
    }
    
    
    return rect.size;
}



//判断是否包含中文
- (BOOL)jq_containChinese:(NSString *)str {
    
    for(int i=0; i< [str length];i++){
        
        int a = [str characterAtIndex:i];
        
        if( a > 0x4e00 && a < 0x9fff){
            return YES;
        }
    }
    return NO;
}


/**
 *  计算最大行数文字高度,可以处理计算带行间距的
 */
- (CGFloat)jq_boundingRectWithSize:(CGSize)size font:(UIFont*)font  lineSpacing:(CGFloat)lineSpacing maxLines:(NSInteger)maxLines{
    
    if (maxLines <= 0) {
        return 0;
    }
    
    CGFloat maxHeight = font.lineHeight * maxLines + lineSpacing * (maxLines - 1);
    
    CGSize orginalSize = [self jq_boundingRectWithSize:size font:font lineSpacing:lineSpacing];
    
    if ( orginalSize.height >= maxHeight ) {
        return maxHeight;
    }else{
        return orginalSize.height;
    }
}

/**
 *  计算是否超过一行   用于给Label 赋值attribute text的时候 超过一行设置lineSpace
 */
- (BOOL)jq_isMoreThanOneLineWithSize:(CGSize)size font:(UIFont *)font lineSpaceing:(CGFloat)lineSpacing{
    
    if ( [self jq_boundingRectWithSize:size font:font lineSpacing:lineSpacing].height > font.lineHeight  ) {
        return YES;
    }else{
        return NO;
    }
}



@end
