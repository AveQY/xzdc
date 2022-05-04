require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "layout3"
import "fun"
import "AndLua"
import "toast/toa"
import "java.io.File"
import "android.widget.TimePicker$OnTimeChangedListener"
import "Animation/cartoon"
import "function"

activity.setTheme(R.Theme_Black)
activity.setTitle("背诵单词")
activity.setContentView(loadlayout(layout3))
activity.ActionBar.setDisplayHomeAsUpEnabled(true)
activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)
activity.ActionBar.hide()
activity.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_PAN)

time_set()

function onOptionsItemSelected(item)
  if item.Title==nil then
    activity.finish()
  end
end

CircleButton(card,0x2FFFFFFF,50)
CircleButton(Previous,0x72FFFFFF,50)
CircleButton(next,0x72FFFFFF,50)
CircleButton(yes,0x00FFFFFF,50)
设置字体加粗(hq)


next.onClick=function()
  随机单词()
  缩放(next)
end
Previous.onClick=function()
  随机单词()
  缩放(next)
end
hq.onClick=function()
  查看中文()
end
hq.onLongClick=function()
  修改单词()
end
yes.onClick=function()
  判断单词()
  缩放(yes)
end

time_end=0
ti=Ticker()
ti.start()
ti.Period=1000
ti.onTick=function()
  time_end=time_end+1
end
function onKeyDown(code,event)
  if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
    if time_end < 300 then
      toast_set()
     else
      activity.finish()
    end
    return true
  end
end