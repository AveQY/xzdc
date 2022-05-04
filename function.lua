function Drawable_round(id,back,up,down)
  import "android.graphics.Color"
  import "android.graphics.drawable.GradientDrawable"

  if not up then
    up=25
  end
  if not down then
    down=up
  end
  id.setBackgroundDrawable(GradientDrawable()
  .setShape(GradientDrawable.RECTANGLE)
  .setColor(back)
  .setCornerRadii({up,up,up,up,down,down,down,down}))
end

function edit_Dialog(title,hint,AveQY)
  InputLayout={
    LinearLayout;
    orientation="vertical";
    Focusable=true,
    FocusableInTouchMode=true,
    {
      EditText;
      id="edit_create",
      layout_width="80%w";
      layout_gravity="center";
    };
  };

  dialog=AlertDialog.Builder(this)
  .setTitle(title)
  .setMessage("请输入")
  .setView(loadlayout(InputLayout))
  .setCancelable(false)
  .setPositiveButton("确定",{onClick=function(v)
      Content=edit_create.Text
      if Content=="" then
        toa("请输入","res/ic_extension_black_24dp.png",0xFFFF7B78)
       else
        io.open("/sdcard/小贼单词/data/"..AveQY,"w"):write(Content):close()
        toa("设置成功！","res/ic_memory_black_24dp.png",0xFF1E8780)
      end
    end})
  .setNegativeButton("取消",nil)
  .show()
  dialog.create()
  --dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(0xFF4D8F8F)
  Drawable_round(dialog.getWindow(),0xFFFFFFFF)
end

function Nickname()
  edit_Dialog("设置用户名","用户名","Nickname")
end

function Signature()
  edit_Dialog("设置个性签名","个性签名","Signature")
end

function read_usermeg()
  c=io.open("/sdcard/小贼单词/data/Nickname")
  d=io.open("/sdcard/小贼单词/data/Signature")
  if c==nil then
   else
    atext=io.open("/sdcard/小贼单词/data/Nickname"):read("*a")
    nichen.setText(atext)
  end
  if d==nil then
    qianname.setText([[保持热爱，奔赴山海！]])
   else
    b=io.open("/sdcard/小贼单词/data/Signature"):read("*a")
    qianname.setText(b)
  end
end

function readbook(txt)
  url = "https://m.kekenet.com/read/news/"--网络路径
  Http.get(url,nil,nil,nil,function(code,content)
    if code==200 then
      io.open("/sdcard/小贼单词/data/wab","w"):write("<html><title></title><body><h4>"..txt.."</h4></body></html>"):close()
      mLuaWebView1.loadUrl("file:///storage/emulated/0/小贼单词/data/wab")--加载本地文件
     else
      mLuaWebView1.loadUrl("file://"..activity.getLuaDir().."/wab/index.html")--加载本地文件
    end
  end)
end

function read_news()
  --url= "https://m.kekenet.com/read/news/"
  url="https://m.kekenet.com/read/news/entertainment/"
  Http.get(url,nil,nil,nil,function(code,content)
    news_link=content:match([[<div class="listMain">
<div class="listItem">
<a href="(.-)"]])
    if code==200 then
      main_link="https://m.kekenet.com"
      link=main_link..news_link
      Http.get(link,nil,nil,nil,function(code,content)
        news=content:match([[</span> <p>(.-)</span></p>
</div>]])
        readbook(news)
      end)
     else
      readbook(news)
    end
  end)
end

function isno()
  url = "https://share.weiyun.com/bdcigmzz"--网络路径
  Http.get(url,nil,nil,nil,function(code,content)
    if code==200 then
      公告内容=content:match("公告【(.-)】")
      if 公告内容=="无" then
       else
        btn.setImageBitmap(loadbitmap("icon/nav.png"))
      end
    end
  end)
end

function 公告()
  layout_ads=
  {
    LinearLayout;
    orientation="vertical";
    layout_height="24%h";
    layout_width="match_parent";
    background="icon/orange2.png";
    {
      TextView;
      layout_height="4%h";
      layout_width="match_parent";
      text="公告";
      textColor="#E1D7D4";
      textSize="20sp";
      gravity="center";
      id="mytext_title";
      layout_marginTop="5dp";
    };
    {
      LinearLayout,
      orientation="vertical",
      layout_width="fill",
      layout_height="fill",
      layout_marginTop="3dp";
      layout_marginLeft="10dp";
      layout_marginBottom="12dp";
      layout_marginRight="10dp";
      {
        ScrollView,--纵向滑动控件
        layout_width="fill",--布局宽度
        layout_height="fill",
        overScrollMode=View.OVER_SCROLL_NEVER,
        verticalScrollBarEnabled=true,
        {
          LinearLayout,
          orientation="vertical",
          layout_width="fill",
          layout_height="fill",
          {
            TextView;
            layout_height="match_parent";
            layout_width="match_parent";
            text="";
            textColor="#E1D7D4";
            gravity="center";
            id="mytext_nei";
          };
        },
      },
    },
  };


  url = "https://share.weiyun.com/bdcigmzz"--网络路径
  Http.get(url,nil,nil,nil,function(code,content)
    公告内容=content:match("公告【(.-)】")
    公告标题=content:match("公告标题【(.-)】")
    if 公告内容=="无" then
      toa("开发者还没有发布消息","res/ic_help_black_24dp.png",0xFF4CA49B)
     else
      AlertDialog.Builder(this)
      .setView(loadlayout(layout_ads))
      .show()

      mytext_nei.setText(公告内容)
      mytext_title.setText(公告标题)
      btn.setImageBitmap(loadbitmap("http://upan.beatone.cn/uploads%2F2021%2F10%2F21%2FM8E8xXEg_nav.png"))--消息图片链接
    end
  end)
end

function http()
  a=io.open("/sdcard/小贼单词/data/1_2.bin")
  if a==nil then
   else
    circle_img.setImageBitmap(loadbitmap("/sdcard/小贼单词/data/1_2.bin"))
  end
end

function img()
  Download_layout={
    LinearLayout;
    orientation="vertical";
    id="Download_father_layout",
    {
      EditText;
      id="linkedit",
      layout_width="80%w";
      layout_gravity="center";
    };
  };

  dialog=AlertDialog.Builder(this)
  .setTitle("设置头像")
  .setMessage("请输入网址")
  .setView(loadlayout(Download_layout))
  .setPositiveButton("确定",{onClick=function(v)
      link=linkedit.Text
      if link=="" then
       else
        import "http"
        http.download(link,"/sdcard/小贼单词/data/1_2.bin")
        activity.recreate()--重构activity
      end
    end})
  .show()
  dialog.create()
  --dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(0xFF4D8F8F)
  Drawable_round(dialog.getWindow(),0xFFFFFFFF)
end

function set_time()
  dialog=AlertDialog.Builder(this)
  .setTitle("提示")
  .setMessage("是否沉浸状态栏？")
  .setPositiveButton("是",{onClick=function(v)
      io.open("/sdcard/小贼单词/data/time_set", 'w')
    end})
  .setNeutralButton("否",{onClick=function(v)
      a=io.open("/sdcard/小贼单词/data/time_set")
      if a==nil then
       else
        os.execute("rm -r ".."/sdcard/小贼单词/data/time_set")
      end
    end})
  .show()
  dialog.create()
  Drawable_round(dialog.getWindow(),0xFFffffff)
end

function time_set()
  a=io.open("/sdcard/小贼单词/data/time_set")
  if a==nil then
   else
    沉浸()
  end
end

function set_toast()
  dialog=AlertDialog.Builder(this)
  .setTitle("提示")
  .setMessage("是否在背诵退出时提示？")
  .setNeutralButton("否",{onClick=function(v)
      io.open("/sdcard/小贼单词/data/set_toast", 'w')
    end})
  .setPositiveButton("是",{onClick=function(v)
      a=io.open("/sdcard/小贼单词/data/set_toast")
      if a==nil then
       else
        os.execute("rm -r ".."/sdcard/小贼单词/data/set_toast")
      end
    end})
  .show()
  dialog.create()
  Drawable_round(dialog.getWindow(),0xFFffffff)
end

function toast_set()
  a=io.open("/sdcard/小贼单词/data/set_toast")
  if a==nil then
    dialog=AlertDialog.Builder(this)
    .setTitle("提示")
    .setMessage("您背诵时长不超过5分钟，确定退出？")
    .setPositiveButton("确定",{onClick=function(v)
        activity.finish()
        ti.stop()
      end})
    .setNegativeButton("取消",nil)
    .show()
    dialog.create()
    Drawable_round(dialog.getWindow(),0xFFffffff)
   else
    activity.finish()
  end
end

function background_Recite()
  a=io.open("/storage/emulated/0/小贼单词/data/1_1.bin")
  if a==nil then
    CircleButton(first,0x7CFFFFFF,20)
    CircleButton(second,0x7CFFFFFF,20)
    CircleButton(third,0x7CFFFFFF,20)
    CircleButton(fourth,0x7CFFFFFF,20)
   else
    CircleButton(first,0x2FFFFFFF,50)
    CircleButton(second,0x2FFFFFFF,50)
    CircleButton(third,0x2FFFFFFF,50)
    CircleButton(fourth,0x2FFFFFFF,50)
  end
end

function png_show()
  Http.get(url,nil,nil,nil,function(code,content)
    if code==200 then
      Download_layout={
        LinearLayout;
        orientation="vertical";
        id="Download_father_layout",
        {
          ImageView;
          layout_height="256.5dp";
          layout_width="fill";
          src="https://wx2.sinaimg.cn/orj360/008oDExnly8gw6ncc039qj30u00mi76n.jpg";
          --src="http://upan.beatone.cn/uploads%2F2021%2F10%2F21%2FF1xcEmJO_background-1.png";
          layout_gravity="center";
        };
      };

      dialog=AlertDialog.Builder(this)
      .setView(loadlayout(Download_layout))
      .show()
      dialog.create()
      Drawable_round(dialog.getWindow(),0xFFffffff)
    end
  end)
end

function new_app_ways()
  items={}
  table.insert(items,"本地更新")
  table.insert(items,"浏览器更新")
  dialog=AlertDialog.Builder(this)
  .setItems(items,{onClick=function(l,v)
      a=items[v+1]
      if a=="本地更新" then
        new_start_update()
       elseif a=="浏览器更新" then
        update()
      end
    end})
  .show()
  dialog.create()
  --dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(0xFF4D8F8F)
  Drawable_round(dialog.getWindow(),0xFFFFFFFF)
end

function 阅读通知()
  Download_layout={
    LinearLayout;
    orientation="vertical";
    id="Download_father_layout",
  };

  dialog=AlertDialog.Builder(this)
  .setTitle("提示")
  .setMessage("站源被和谐了~")
  .setView(loadlayout(Download_layout))
  .setPositiveButton("确定",{onClick=function(v)

    end})
  .show()
  dialog.create()
  --dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(0xFF4D8F8F)
  Drawable_round(dialog.getWindow(),0xFFFFFFFF)
end