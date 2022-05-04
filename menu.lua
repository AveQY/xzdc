require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "menu_layout"
import "AndLua"
import "ts/base64"
import "fun"
import "toast/toa"
import "Animation/cartoon"
import "function"
import "ts/new_app"

activity.setTheme(R.Theme_Teal)
activity.setTitle("设置")
activity.setContentView(loadlayout(menu_layout))
activity.ActionBar.setDisplayHomeAsUpEnabled(true)
activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)

function onOptionsItemSelected(item)
  if item.Title==nil then
    activity.finish()
  end
end
设置字体加粗(about)
设置字体加粗(set)

nihao={--第二个界面
  FrameLayout;
  id="fu";
  layout_width="fill";
  {
    LinearLayout;
    orientation="vertical";
    layout_margin="6dp";
    --backgroundColor="#ffffff";
    layout_width="fill";
    {
      TextView;
      layout_margin="7";
      layout_width="fill";
      id="lt";
      textColor="#FF2A2A2A";
      text="hello AndroLua+";
      TextSize="6dp";
    };
    {
      TextView;
      textColor="#FFA1A1A1";
      layout_width="fill";
      id="ts";
      TextSize="4sp";
    };
  };
  {
    LinearLayout;
    orientation="vertical";
    layout_width="fill";
    layout_gravity="center";
    {
      ImageView;
      layout_marginRight="4dp";
      layout_height="15dp";
      layout_width="15dp";
      id="icon";
      ColorFilter="#FF000000";
      layout_gravity="right";
    };
  };
};

adp=LuaAdapter(activity,nihao)
adp.add{lt="联系开发者",ts="反馈Bug与交流"}
adp.add{lt="分享软件",ts="也许你是最先发现新大陆的人"}
adp.add{lt="关于",ts="软件好用就给个好评"}
adp.add{lt="检查更新",ts="当前版本：V"..tonumber(activity.getPackageManager().getPackageInfo("com.AveQY.xzdc", 0).versionName)}
adp.add{lt="捐赠",ts="催更，给开发者一杯咖啡提提神～"}
list1.setAdapter(adp)


list1.onItemClick=function(p,v,i,s)
  a=v.Tag.lt.Text b="联系开发者" c="关于" d="检查更新"
  e="捐赠" g="分享软件"
  if a==b then
    Developers()
   elseif a==c then
    About()
   elseif a==d then
    new_app_ways()
   elseif a==e then
    Donation()
   elseif a==g then
    Sharing()
   else
  end
end

adp=LuaAdapter(activity,nihao)
adp.add{lt="设置背景",ts="在顺序背诵中设置背景"}
adp.add{lt="沉浸状态栏",ts="背诵时沉浸，忘记时间"}
adp.add{lt="用户名",ts="设置主页用户名"}
adp.add{lt="个性签名",ts="设置主页个性签名"}
adp.add{lt="退出提示",ts="背诵退出时5分钟提示"}
adp.add{lt="清除数据",ts="一键删除所有数据"}
list2.setAdapter(adp)

list2.onItemClick=function(p,v,i,s)
  a=v.Tag.lt.Text f="清除数据"
  if a==f then
    Empty()
   elseif a=="设置背景" then
    set_background()
   elseif a=="用户名" then
    Nickname()
   elseif a=="个性签名" then
    Signature()
   elseif a=="沉浸状态栏" then
    set_time()
   elseif a=="退出提示" then
    set_toast()
   else
  end
end

