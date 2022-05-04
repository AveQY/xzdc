function new_start_update()
  import "android.content.Context"
  local wl=activity.getApplicationContext().getSystemService(Context.CONNECTIVITY_SERVICE).getActiveNetworkInfo();
  if wl== nil then
    toa("请检查网络！","res/ic_perm_scan_wifi_black_24dp.png",0xFFFF5547)
  end
  远程链接="https://share.weiyun.com/bdcigmzz"
  Http.get(远程链接,nil,nil,nil,function(code,content)
    if code==200 then
      --content=content:gsub("。","\n") or content;
      更新开关=content:match("更新开关【(.-)】")
      软件大小=content:match("软件大小【(.-)】")
      更新内容=content:match("更新说明【(.-)】")
      最新版本=content:match("版本【(.-)】")
      下载链接=content:match("更新链接【(.-)】")
      文件名=content:match("文件名【(.-)】")

      包名="com.AveQY.xzdc"
      当前版本=tonumber(activity.getPackageManager().getPackageInfo(包名, 0).versionName)
      if 更新开关=="开" then
        layout=
        {
          LinearLayout,--线性布局
          orientation="vertical",--布局方向
          layout_width="fill",--布局宽度
          layout_height="fill",--布局高度
          gravity="center",--重力居中
          {
            CardView,--卡片框控件
            layout_width="88%w",--布局宽度
            layout_height="45%h",--布局高度
            cardBackgroundColor="#ffffff",--卡片背景色
            cardElevation="2dp",--卡片提升
            radius="10dp",--圆角半径

            {
              LinearLayout,--线性布局
              orientation="vertical",--布局方向
              layout_width="fill",--布局宽度
              layout_height="fill",--布局高度
              --开始
              {
                TextView,--文本框控件
                layout_gravity="center",--重力居中
                layout_marginTop="18dp",--布局顶距
                text="发现新版本",--文本内容
                Typeface=Bold;
                textSize="18sp",--文本大小
                textColor="0xFFFF5A66",--文本颜色
              },
              {
                TextView,--文本框控件
                paddingTop="1%h",--布局内顶距
                paddingLeft="8dp",--布局内左距
                text="当前版本:"..当前版本.." \n最新版本:"..最新版本,--文本内容
                textSize="15sp",--文本大小
                textColor="0xFF5AA495",--文本颜色
              },
              {
                TextView,--文本框控件
                paddingTop="1%h",--布局内顶距
                paddingLeft="8dp",--布局内左距
                text="软件大小:"..软件大小.."M",--文本内容
                textSize="15sp",--文本大小
                textColor="0xFF5AA495",--文本颜色
              },
              {
                TextView,--文本框控件
                paddingTop="1%h",--布局内顶距
                paddingLeft="8dp",--布局内左距
                text="更新内容:",--文本内容
                textSize="15sp",--文本大小
                textColor="0xFF5AA495",--文本颜色
              },
              {
                ScrollView,--纵向滑动控件
                layout_width="fill",--布局宽度
                layout_height="28%h",--布局高度
                paddingBottom="2%h",--布局内底距
                overScrollMode=View.OVER_SCROLL_NEVER,--隐藏圆弧阴影
                verticalScrollBarEnabled=true,--隐藏纵向滑条
                {
                  LinearLayout,--线性布局
                  orientation="vertical",--布局方向
                  layout_width="fill",--布局宽度
                  layout_height="fill",--布局高度
                  {
                    TextView,--文本框控件
                    id="gxnr",
                    paddingTop="1%h",--布局内顶距
                    paddingLeft="15dp",--布局内左距
                    paddingRight="5dp",--布局内右距
                    text=""..更新内容,--文本内容
                    textSize="13sp",--文本大小
                    textColor="#000000",--文本颜色
                  },
                },--线性布局 结束
              },--纵向滑动控件 结束
            },--线性布局 结束
            {
              LinearLayout,--线性布局
              paddingTop="3%h",--布局内顶距
              orientation="horizontal",--布局方向
              layout_width="fill",--布局宽度
              layout_height="fill",--布局高
              gravity="bottom|right",--重力居中
              {
                TextView,--文本框控件
                id="qx";
                layout_gravity="bottom|right",--重力居中
                paddingBottom="2%h",--布局内底距
                paddingRight="5%w",--布局内左距
                text="取消",--文本内容
                textSize="15sp",--文本大小
                textColor="0xFF000000",--文本颜色
                onClick=function()--单击事件
                  dkl.dismiss()--关闭
                end
              },
              {
                TextView,--文本框控件
                id="gx";
                layout_gravity="bottom|right",--重力居中
                paddingBottom="2%h",--布局内底距
                paddingRight="4%w",--布局内左距
                text="立即升级",--文本内容
                textSize="15sp",--文本大小
                textColor="0xFF000000",--文本颜色
                onClick=function()--单击事件
                  qx.Text="正在下载"
                  local url=""..下载链接..""
                  local path="/storage/emulated/0/小贼单词/download/"..文件名--下载到xx路径
                  下载进度(url,path)
                end
              },
            },--线性布局 结束
          },--卡片框控件 结束
        }--线性布局 结束
        dkl=AlertDialog.Builder(this)
        dkl.setView(loadlayout(layout))
        dkl.setCancelable(true)--禁用返回键
        dkl=dkl.show()
        --背景透明
        import "android.graphics.drawable.ColorDrawable"
        dkl.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000))

       else
        toa("您己经是最新版本了！","res/ic_memory_black_24dp.png",0xFF4CAD95)
      end
    end
  end)
end
--检查软件是否有更新
function 安装(path)
  import "android.content.Intent"
  import "android.net.Uri"
  import "android.content.*"
  activity.installApk("/storage/emulated/0/小贼单词/download/"..文件名)
end
function 下载(url,path)
  local tt=Ticker()
  tt.start()
  Http.download(url,path,function(code,data,cookie,header)
    tt.stop()
    qx.Text="正在下载"
    gx.Text="100%"
    安装(path)--安装
    dkl.dismiss()
  end)

  function tt.onTick()
    local f=io.open(path,"r")
    if f~=nil then
      local len=f:read("a")
      local s=#len/lens
      --local w=activity.Width*s
      --jdv.Width=w
      gx.Text=math.ceil(s*100).."%"
    end
  end
end

function 下载进度(url,path)
  import "java.net.URL"
  realUrl = URL(url)
  con = realUrl.openConnection();
  con.setRequestProperty("accept", "/storage/emulated/0/小贼单词/download/"..文件名);
  con.setRequestProperty("connection", "Keep-Alive");
  con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
  lens=con.getContentLength()
  下载(url,path)
end