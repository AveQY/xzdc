require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "AndLua"
import "fun"
import "toast/toa"
import "Animation/cartoon"
import "function"

activity.setTheme(R.Theme_Black)

order_layout={
  LinearLayout;
  orientation="vertical";
  layout_height="fill";
  id="back";
  background="/storage/emulated/0/小贼单词/data/1_1.bin";
  {
    LinearLayout;
    layout_height="80%w";
    layout_width="fill";
    gravity="center";
    orientation="vertical";
    {
      TextView;
      text="";
      layout_marginTop="0dp";
      layout_width="150dp";
      gravity="center";
      id="mTextView2";
    };
    {
      LinearLayout;
      layout_width="match_parent";
      gravity="center";
      layout_marginTop="15dp";
      layout_height="40dp";
      layout_marginRight="10dp";
      layout_marginLeft="10dp";
      {
        ImageView;
        layout_height="match_parent";
        layout_width="25dp";
        id="Previous";
        layout_marginLeft="25dp";
        src="res/ic_fast_rewind_black_24dp.png",
      };
      {
        TextView;
        text="";
        layout_height="40dp";
        layout_marginTop="0dp";
        gravity="center";
        layout_marginBottom="3dp";
        layout_width="match_parent";
        textSize="22sp";
        layout_marginLeft="50dp";
        id="hq";
        layout_marginRight="50dp";
        textColor="#0";
      };
      {
        ImageView;
        layout_height="match_parent";
        layout_width="25dp";
        layout_marginRight="25dp";
        id="next";
        src="res/ic_fast_forward_black_24dp.png",
      };
    };
    {
      CardView;
      layout_marginTop="30dp";
      layout_height="44dp";
      cardElevation="";
      radius="20dp";
      id="card";
      layout_width="match_parent";
      layout_marginLeft="20dp";
      backgroundcolor="#FFFFFF";
      layout_marginRight="20dp";
      {
        LinearLayout;
        layout_width="match_parent";
        layout_height="44dp";
        {
          EditText;
          layout_weight="1";
          hint="请输入";
          layout_height="44dp";
          paddingLeft="20dp";
          singleLine="true";
          id="edit3";
          background="#00000000";
          textColor="#0";
        };
        {
          ImageView,
          layout_width="44dp",
          layout_height="44dp",
          padding="12dp",
          colorFilter="#80808080",
          src="res/ic_send_black_24dp.png",
          id="yes";
        },
      };
    };
  };
  {
    LinearLayout;
    layout_width="match_parent";
    gravity="center|bottom";
    layout_marginTop="10dp";
    layout_height="87%w";
    {
      Button;
      text="重新开始";
      layout_height="55dp";
      layout_width="45%w";
      gravity="center";
      id="Restart";
      layout_marginRight="10dp";
    };
    {
      Button;
      text="继续上次";
      layout_height="55dp";
      layout_width="45%w";
      gravity="Center";
      id="Continue";
      layout_marginLeft="10dp";
    };
  };
};

activity.setContentView(loadlayout(order_layout))
activity.ActionBar.hide()

CircleButton(card,0x2FFFFFFF,50)
CircleButton(Previous,0x72FFFFFF,50)
CircleButton(next,0x72FFFFFF,50)
CircleButton(yes,0x00FFFFFF,50)
CircleButton(Restart,0x00FFFFFF,50)
CircleButton(Continue,0x00FFFFFF,50)
设置字体加粗(hq)

time_set()
进度(mTextView2)

Previous.onClick=function()
  缩放(Previous)
  至多至少()
  设置文本(edit3,"")
  进度(mTextView2)
end
next.onClick=function()
  缩放(next)
  顺序背诵()
  设置文本(edit3,"")
  进度(mTextView2)
end
hq.onClick=function()
  查看中文()
end
hq.onLongClick=function()
  修改单词()
end
yes.onClick=function()
  缩放(yes)
  增加单词()
  进度(mTextView2)
end
Restart.onClick=function()
  缩放(Restart)
  io.open("/sdcard/小贼单词/data/random","w"):write("0"):close()
  toa("已重置！","res/ic_memory_black_24dp.png",0xFFFF6064)
  进度(mTextView2)
  设置文本(edit3,"")
end
Continue.onClick=function()
  缩放(Continue)
  继续(hq)
  进度(mTextView2)
  设置文本(edit3,"")
end
mTextView2.onClick=function()
  缩放(mTextView2)
  list_words()
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