require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "AndLua"
import "function"
import "ts.base64"
import 'android.view.animation.RotateAnimation'
import 'android.view.animation.Animation'
import 'android.view.animation.AccelerateDecelerateInterpolator'

activity.setTheme(R.Theme_Blue)

yyds="https://wx4.sinaimg.cn/orj360/008oDExnly8h1rlic4gvnj30e60hn0xb.jpg"
--yyds=base64decode("aHR0cHM6Ly93eDIuc2luYWltZy5jbi9vcmozNjAvMDA4b0RFeG5seThndjB1ajA4b215ajYwZTgwOGN3ZW8wMi5qcGc=")

res={
  LinearLayout;
  orientation="vertical";
  gravity="center";
  BackgroundColor="#FFFFFF";
  layout_width="match_parent";
  {
    LinearLayout;
    gravity="center";
    layout_height="300dp";
    layout_width="match_parent";
    {
      CardView;
      layout_width="172dp";
      layout_height="205dp";
      gravity="center";
      radius="20dp";
      BackgroundColor="#FFFFFF";
      {
        FrameLayout;--帧布局
        layout_width='match_parent';--布局宽度
        layout_height='match_parent';--布局高度
        id="card_d";
        {
          CardView;--卡片控件
          id="cd1";
          layout_width='fill';--卡片宽度
          layout_height='fill';--卡片高度
          Elevation='0';--阴影属性
          radius='50dp';--卡片圆角
          CardBackgroundColor='#00ffffff';--卡片背景颜色
          {
            CardView;--卡片控件
            layout_gravity='top|center';--子控件在父布局中的对齐方式
            CardElevation='0';--卡片阴影
            layout_width='20dp';--卡片宽度
            layout_height='20dp';--卡片高度
            radius='10dp';--卡片圆角
            CardBackgroundColor='#FF7268E9';--卡片背景颜色
          };
        };
        {
          CardView;--卡片控件
          id="cd2";
          layout_width='fill';--卡片宽度
          layout_height='fill';--卡片高度
          Elevation='0';--阴影属性
          radius='50dp';--卡片圆角
          CardBackgroundColor='#00ffffff';--卡片背景颜色
          {
            CardView;--卡片控件
            layout_gravity='top|center';--子控件在父布局中的对齐方式
            CardElevation='0';--卡片阴影
            layout_width='20dp';--卡片宽度
            layout_height='20dp';--卡片高度
            radius='10dp';--卡片圆角
            CardBackgroundColor='#FF7268E9';--卡片背景颜色
          };
        };
        {
          CardView;--卡片控件
          id="cd3";
          layout_width='fill';--卡片宽度
          layout_height='fill';--卡片高度
          Elevation='0';--阴影属性
          radius='50dp';--卡片圆角
          CardBackgroundColor='#00ffffff';--卡片背景颜色
          {
            CardView;--卡片控件
            layout_gravity='top|center';--子控件在父布局中的对齐方式
            CardElevation='0';--卡片阴影
            layout_width='20dp';--卡片宽度
            layout_height='20dp';--卡片高度
            radius='10dp';--卡片圆角
            CardBackgroundColor='#FF7268E9';--卡片背景颜色
          };
        };
      };
      {
        ImageView;
        layout_height="match_parent";
        layout_width="match_parent";
        src=yyds;
      };
    };
  };
  {
    LinearLayout;
    layout_height="68dp";
    gravity="center";
    layout_width="match_parent";
    {
      CardView;
      layout_height="51dp";
      radius="30dp";
      layout_width="300dp";
      {
        TextView;
        textSize="18sp";
        textColor="#ff0000";
        id="jzn";
        text="打开微信，扫一扫";
        BackgroundColor="#FFFFFF";
        gravity="center";
        layout_height="match_parent";
        layout_width="match_parent";
      };
    };
  };
  {
    LinearLayout;
    layout_height="73dp";
    gravity="center";
    layout_width="match_parent";
    {
      TextView;
      layout_marginRight="30dp";
      textSize="17sp";
      gravity="center";
      textColor="#0093FF";
      layout_marginLeft="30dp";
      layout_height="match_parent";
      text="请在本界面截图，然后打开微信扫一扫，感谢支持！";
      layout_width="match_parent";
    };
  };
};


activity.setContentView(loadlayout(res))
activity.setTheme(android.R.style.Theme_DeviceDefault_Light)
隐藏标题栏()
沉浸状态栏()
function bu()
  window = activity.getWindow();
  window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_FULLSCREEN|View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN);
  window.addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN)
  xpcall(function()
    lp = window.getAttributes();
    lp.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;
    window.setAttributes(lp);
  end,
  function(e)
  end)
end

bu()

--[[
buttontxt.onClick=function()
  LuaUtil.copyDir(activity.getLuaDir().."/res/jz4.png","/storage/emulated/0/DCIM/Screenshots/aveqy_zs.png")
  MD提示("已保存",0xFF589AA5,0xFFFFFFFF,4,25)
end]]

jzn.onClick=function()
  packageName="com.tencent.mm"
  import "android.content.Intent"
  import "android.content.pm.PackageManager"
  manager = activity.getPackageManager()
  open = manager.getLaunchIntentForPackage(packageName)
  this.startActivity(open)
  local dl=ProgressDialog.show(activity,nil,'跳转中，请稍候…')
  dl.show()
  dl.create()
  Drawable_round(dl.getWindow(),0xFFffffff)
  function onResume()
    dl.dismiss()
    activity.finish()
  end
end


function 动画(控件,时间)
  旋转动画=RotateAnimation(0, 360,
  Animation.RELATIVE_TO_SELF, 0.5,
  Animation.RELATIVE_TO_SELF, 0.5)
  旋转动画.setDuration(时间)--设置动画时间
  旋转动画.setInterpolator(AccelerateDecelerateInterpolator())
  旋转动画.setFillAfter(true)--设置动画结束后停留位置
  旋转动画.setRepeatCount(-1)--设置无限循环
  --绑定动画
  控件.startAnimation(旋转动画)
end

function startvv()
  url = "https://www.baidu.com"--网络路径
  Http.get(url,nil,nil,nil,function(code,content)
    if code==200 then
      card_d.setVisibility(View.GONE)
     else
      task(5,function()
        动画(cd1,1500)
        task(500,function()
          动画(cd2,1500)
          task(500,function()
            动画(cd3,1500)
            return true
          end)
          return true
        end)
        return true
      end)
    end
  end)
end
startvv()