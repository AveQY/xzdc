import "android.view.animation.Animation"
import "android.view.animation.TranslateAnimation"
import "android.view.animation.RotateAnimation"
import "android.view.animation.AlphaAnimation"
import "android.view.animation.AnimationUtils"
import "android.view.animation.LayoutAnimationController"
import "android.view.animation.ScaleAnimation"


function 平移(id,wz,time)
  mode=TranslateAnimation(wz,0, 0, 0)
  mode.setDuration(time)
  mode.setFillAfter(false)
  mode.setRepeatCount(0)
  id.startAnimation(mode)
end

function 振动(id)
  --平移
  mode=TranslateAnimation(0,15,5, 0)
  mode.setDuration(80)--设置动画间隔时间
  mode.setFillAfter(false)--设置动画后停留原来位置
  mode.setRepeatCount(3)--设置循环次数，负数无限循环
  --绑定动画
  id.startAnimation(mode)
end

function 缩放(id)
  big=ScaleAnimation(1,0.97,1,0.97,Animation.RELATIVE_TO_SELF,0.5,Animation.RELATIVE_TO_SELF,0.5)
  big.setDuration(100)--设置动画间隔时间
  big.setFillAfter(false)--设置动画后停留位置
  big.setRepeatCount(0)--设置无限循环
  id.startAnimation(big)
end

function 旋转(id)
  xz=RotateAnimation(0, 360,--左边逆时针，右边顺时针
  Animation.RELATIVE_TO_SELF, 0.5,--0.5表示原地打转
  Animation.RELATIVE_TO_SELF, 0.5)
  xz.setDuration(1000)--设置动画时间
  xz.setFillAfter(false)--设置动画结束后停留位置
  xz.setRepeatCount(0)--设置无限循环
  --绑定动画
  id.startAnimation(xz)
end

function 列表动画(id)
  --创建一个Animation对象
  animation = AnimationUtils.loadAnimation(activity,android.R.anim.slide_in_left)

  --得到对象
  lac = LayoutAnimationController(animation)

  --设置控件显示的顺序
  lac.setOrder(LayoutAnimationController.ORDER_NORMAL)
  --LayoutAnimationController.ORDER_NORMAL   顺序显示
  --LayoutAnimationController.ORDER_REVERSE 反显示
  --LayoutAnimationController.ORDER_RANDOM

  --设置控件显示间隔时间
  lac.setDelay(1)--这里单位是秒

  --设置组件应用
  id.setLayoutAnimation(lac)
end

function 缩放_大(id)
  big=ScaleAnimation(1,0.8,1,0.8,Animation.RELATIVE_TO_SELF,0.5,Animation.RELATIVE_TO_SELF,0.5)
  big.setDuration(100)--设置动画间隔时间
  big.setFillAfter(false)--设置动画后停留位置
  big.setRepeatCount(0)--设置无限循环
  id.startAnimation(big)
end