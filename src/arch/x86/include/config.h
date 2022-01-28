/* config.h
* 系统内核配置文件
*/

#ifndef __CONFIG_H_
#define __CONFIG_H_

/* ui界面,文本还是图形
* 只能选一个
* 同时要在boot.inc也做同样的选择
*/

/* #define __UI_GRAPHIC__ /* 图形界面(暂不支持) */
#define __UI_TEXT__ /* 文本界面 */

#endif /* __CONFIG_H_ */
