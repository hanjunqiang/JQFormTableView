/**
 
     options 类型的详细解释：
     
     typedef NS_OPTIONS(NSInteger, NSStringDrawingOptions) {
     
         NSStringDrawingUsesLineFragmentOrigin = 1 << 0,
         // 整个文本将以每行组成的矩形为单位计算整个文本的尺寸
         // The specified origin is the line fragment origin, not the base line origin
         
         NSStringDrawingUsesFontLeading = 1 << 1,
         // 使用字体的行间距来计算文本占用的范围，即每一行的底部到下一行的底部的距离计算
         // Uses the font leading for calculating line heights
         
         NSStringDrawingUsesDeviceMetrics = 1 << 3,
         // 将文字以图像符号计算文本占用范围，而不是以字符计算。也即是以每一个字体所占用的空间来计算文本范围
         // Uses image glyph bounds instead of typographic bounds
         
         NSStringDrawingTruncatesLastVisibleLine
         // 当文本不能适合的放进指定的边界之内，则自动在最后一行添加省略符号。如果NSStringDrawingUsesLineFragmentOrigin没有设置，则该选项不生效
         // Truncates and adds the ellipsis character to the last visible line if the text doesn't fit into the bounds specified. Ignored if NSStringDrawingUsesLineFragmentOrigin is not also set.
     
     }

     通常使用：    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;

    注意1：在外面调用该分类计算高度的时候
     //需要手动判断一下，一行的时候不能添加lineSpacing属性
     if ([str jq_isMoreThanOneLineWithSize:CGSizeMake(label.frame.size.width, MAXFLOAT) font:font lineSpaceing:style.lineSpacing]) {
     
         style.lineSpacing = 10;
     }
 
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)


/**
 *  判断是否包含中文
 */
- (BOOL)jq_containChinese:(NSString *)str;

/**
 * 计算文字高度，可以处理计算带行间距的
 * 如果是普通文本，lineSpacing 传 0 即可。
 */
- (CGSize)jq_boundingRectWithSize:(CGSize)size font:(UIFont*)font  lineSpacing:(CGFloat)lineSpacing;

/**
 *  计算最大行数文字高度,可以处理计算带行间距的
 */
- (CGFloat)jq_boundingRectWithSize:(CGSize)size font:(UIFont*)font  lineSpacing:(CGFloat)lineSpacing maxLines:(NSInteger)maxLines;

/**
 *  计算是否超过一行   用于给Label 赋值attribute text的时候 超过一行设置lineSpace
 */
- (BOOL)jq_isMoreThanOneLineWithSize:(CGSize)size font:(UIFont *)font lineSpaceing:(CGFloat)lineSpacing;




@end
