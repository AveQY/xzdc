require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "AndLua"
import "http"
import "toast/toa"
import "Animation/cartoon"
import "fun"
import "ts/base64"
import "drawer"
import "content"
import "function"
import "ts/new_app"

layout={DrawerLayout,id="mDrawer"}

table.insert(layout,content)
table.insert(layout,drawer)
activity.setContentView(loadlayout(layout))
activity.setTheme(R.Theme_Black)

activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)
activity.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_PAN)

edit.setOnFocusChangeListener{
  onFocusChange=function( v, hasFocus)
    if hasFocus==true then
      import "android.view.animation.ScaleAnimation"
      text.startAnimation(ScaleAnimation(0.0,1.0,1.0,1.0,1,0.5,1,0.5).setDuration(200))
      text.setVisibility(View.VISIBLE)
      import "android.view.animation.TranslateAnimation"
      title.startAnimation(TranslateAnimation(0,0,0,-80).setDuration(100).setFillAfter(true))
     else
      text.startAnimation(ScaleAnimation(1.0,0.0,1.0,1.0,1,0.5,1,0.5).setDuration(200))
      text.setVisibility(View.INVISIBLE)
      title.startAnimation(TranslateAnimation(0,0,-80,0).setDuration(100).setFillAfter(true))
    end
  end}
--默认关闭焦点
text.setVisibility(View.INVISIBLE)

appp=activity.getWidth()
local kuan=appp/3
huadong.setOnPageChangeListener(PageView.OnPageChangeListener{
  onPageScrolled=function(a,b,c)
    --huat.setX(kuan*(b+a))--滑条
    if a==0 then
      a1.setTextColor(0xFF539680)--选中
      a2.setTextColor(0x9f000000)--未选
      a3.setTextColor(0x9f000000)--未选
      img1.setImageBitmap(loadbitmap("res/page1.png"))--选中
      img2.setImageBitmap(loadbitmap("res/page2model.png"))--未选
      img3.setImageBitmap(loadbitmap("res/page3model.png"))--未选
      toolbar_one.setVisibility(View.VISIBLE)
     elseif a==1 then--分类
      a1.setTextColor(0x9f000000)--未选
      a2.setTextColor(0xFF539680)--选中
      a3.setTextColor(0x9f000000)--未选
      img1.setImageBitmap(loadbitmap("res/page1model.png"))--未选
      img2.setImageBitmap(loadbitmap("res/page2.png"))--选中
      img3.setImageBitmap(loadbitmap("res/page3model.png"))--未选
      toolbar_one.setVisibility(View.VISIBLE)
     elseif a==2 then--精选
      a1.setTextColor(0x9f000000)--未选
      a2.setTextColor(0x9f000000)--未选
      a3.setTextColor(0xFF539680)--选中
      img1.setImageBitmap(loadbitmap("res/page1model.png"))--未选
      img2.setImageBitmap(loadbitmap("res/page2model.png"))--未选
      img3.setImageBitmap(loadbitmap("res/page3.png"))--选中
      toolbar_one.setVisibility(View.INVISIBLE)
    end
  end})

import "android.content.res.ColorStateList"
local attrsArray = {android.R.attr.selectableItemBackgroundBorderless}
local typedArray =activity.obtainStyledAttributes(attrsArray)
ripple=typedArray.getResourceId(0,0)
aoos=activity.Resources.getDrawable(ripple)
c1.onClick=function()
  缩放_大(c1)
  huadong.showPage(0)
end

c2.onClick=function()
  缩放_大(c2)
  huadong.showPage(1)
end

c3.onClick=function()
  缩放_大(c3)
  huadong.showPage(2)
end

平移(bs,-800,1000)
平移(ly,-1000,1200)
平移(third,-1200,1500)
--[[点按背诵--bug过多
平移(Fourth,-1400,1900)
--]]
设置字体加粗(start)

--菜单按钮
function btn.onClick()
  mDrawer.openDrawer(3)
end

function btn3.onClick()
  if edit.text=="" then
    title.startAnimation(TranslateAnimation(0,0,-20,0).setDuration(100).setFillAfter(true))
   else
    activity.newActivity("note/main2")
    io.open("/sdcard/小贼单词/data/link","w"):write(edit.Text):close()
  end
end

--主页1按钮
bs.onClick=function()
  判断单词是否存在("Recite/main2")
  缩放(bs)
end
tj.onClick=function()
  添加()
end
sc.onClick=function()
  缩放(sc)
  判断单词是否存在("Recite/order")
end
dictionary.onClick=function()
  缩放(dictionary)
  activity.newActivity("wab/html")
end
notebook.onClick=function()
  缩放(notebook)
  activity.newActivity("note/main")
end
--[[点按背诵
butRecite.onClick=function()
  缩放(butRecite)
  activity.newActivity("Recite/ButtonRecite")
end
]]

http()
file_all()
read_news()
read_usermeg()
isno()
--[[
awe=unicode_to_utf8("")
toa(awe,"res/ic_memory_black_24dp.png",0xFFFF555A)
]]

--侧栏按钮
nichen.onClick=function()
  缩放(nichen)
  read_usermeg()
end
qianname.onClick=function()
  缩放(qianname)
  read_usermeg()
end
circle_img.onClick=function()
  缩放(circle_img)
  img()
end

--用户界面
an1.onClick=function()
  缩放(an1)
  list_words()
end
an2.onClick=function()
  缩放(an2)
  Sign()
end
an3.onClick=function()
  缩放(an3)
  sogood()
end
an4.onClick=function()
  缩放(an4)
  activity.newActivity("wab/html")
end

nihao={
  FrameLayout;
  id="fu";
  layout_width="fill";
  {
    LinearLayout;
    orientation="vertical";
    backgroundColor="#";
    layout_margin="6dp";
    layout_width="fill";
    {
      TextView;
      layout_margin="7";
      layout_width="fill";
      id="lt";
      textColor="#f";
      text="hello AndroLua+";
      TextSize="6sp";
    };
    {
      TextView;
      textColor="#7F8280";
      layout_width="fill";
      id="ts";
      TextSize="4sp";
    };
  };
};

adp=LuaAdapter(activity,nihao)
adp.add{lt="公告",ts="开发者发送的消息"}
adp.add{lt="签到",ts="记录背诵天数"}
adp.add{lt="阅读",ts="每日一篇英语短文"}
adp.add{lt="新建",ts="至多4个单词本"}
adp.add{lt="选择",ts="选择背诵单词本"}
adp.add{lt="删除",ts="删除不要的单词本"}
list_main.setAdapter(adp)

list_main.onItemClick=function(p,v,i,s)
  a=v.Tag.lt.Text g="新建" h="选择" i="删除"
  if a==g then
    create_wordbooks()
   elseif a==h then
    choosewordsbook()
   elseif a==i then
    deletewordsbook()
   elseif a=="签到" then
    Sign()
   elseif a=="公告" then
    公告()
   elseif a=="阅读" then
    --阅读()
    阅读通知()
  end
end


adpd={
  {
    img={
      src="drawable/d.png",
    },
    title={
      text="每日阅读",
    },
    content={
      text=("点击获取最新章节"),
    },
  },
  {
    img={
      src="drawable/a.png",
    },
    title={
      text="个性签名",
    },
    content={
      text="点击设置个性签名",
    },
  },
  {
    img={
      src="drawable/e.png",
    },
    title={
      text="设置",
    },
    content={
      text="关于软件设置",
    },
  },
  {
    img={
      src="drawable/g.png",
    },
    title={
      text="公告",
    },
    content={
      text="开发者发送的消息",
    },
  },
  {
    img={
      src="drawable/f.png",
    },
    title={
      text="分享",
    },
    content={
      text="也许你是最先发现新大陆的人",
    },
  },
  {
    img={
      src="drawable/b.png",
    },
    title={
      text="联系开发者",
    },
    content={
      text="点击跳转",
    },
  },
  {
    img={
      src="drawable/c.png",
    },
    title={
      text="检查更新",
    },
    content={
      text="检查软件是否是最新",
    },
  },
}

items={
  LinearLayout,
  layout_width="fill",
  orientation="horizontal",
  gravity="center|left",
  background="#ffffff";
  {
    ImageView,
    id="img",
    layout_width="30dp",
    layout_height="30dp",
    layout_marginTop="25dp",
    layout_marginBottom="25dp",
    layout_marginLeft="20dp",
    -- layout_marginRight="20dp",
  },
  {
    LinearLayout,
    layout_width="fill",
    --[
    layout_marginLeft="10dp",
    layout_marginTop="25dp",
    layout_marginBottom="25dp",
    layout_marginRight="10dp",
    orientation="vertical",
    layout_height="fill",
    {
      TextView,
      id="title",
      textSize="14sp",
      textColor="#33605A",
    },
    {
      TextView,
      id="content",
      textSize="11sp",
      textColor="#33605A",
    },
  },
}
adapter=LuaAdapter(this,adpd,items)
list.Adapter=adapter
list.onItemClick=function(adp,view,pos,id)
  ({
    function()--阅读
      --阅读()
      阅读通知()
    end,
    function()--个性签名
      Signature()
    end,
    function()--设置
      activity.newActivity("ts/menu")
    end,
    function()--公告
      公告()
    end,
    function()--分享
      Sharing()
    end,
    function()--联系开发者
      MD提示("即将跳转到QQ",0xFF219695,0xFFFFFFFF,4,25)
      Developers()
    end,
    function()--检查更新
      new_app_ways()
    end,
  })[id]()
end
