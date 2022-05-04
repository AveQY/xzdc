function Drawable_round(id,back,up,down)
  import "android.graphics.Color"
  import "android.graphics.drawable.GradientDrawable"
  import "android.text.SpannableString"
  import "android.text.style.ForegroundColorSpan"
  import "android.text.Spannable"

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

function 阅读()
  Download_layout={
    LinearLayout;
    orientation="vertical";
    id="Download_father_layout",
    {
      LuaWebView;
      layout_width="match_parent";
      layout_height="match_parent";
      id="mWebView1";
    };
  };

  url="https://m.kekenet.com/read/news/entertainment/"
  Http.get(url,nil,nil,nil,function(code,content)
    if code==200 then
      news_link=content:match([[</div>
<div class="listItem">
<a href="(.-)"]])
      main_link="https://m.kekenet.com"
      link=main_link..news_link
      Http.get(link,nil,nil,nil,function(code,content)
        title=content:match([[<div class="f-title"><b>(.-)</b></div>]])
        dialog=AlertDialog.Builder(this)
        .setTitle(title)
        .setView(loadlayout(Download_layout))
        .setPositiveButton("好看",function()

        end)
        .setNegativeButton("一般",nil)
        .setNeutralButton("不知道",nil)
        .show();
        mWebView1.loadUrl("file:///sdcard/小贼单词/data/wab")
        dialog.create()
        Drawable_round(dialog.getWindow(),0xFFFFFFFF)
      end)
     else
      toa("请检查网络设置","res/ic_perm_scan_wifi_black_24dp.png",0xFFFF555A)
    end
  end)
end

function 沉浸()
  if Build.VERSION.SDK_INT >= 21 then
    activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xff4285f4);
  end
  if Build.VERSION.SDK_INT >= 19 then
    activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
  end
end

function Developers()
  import "android.net.Uri"
  import "android.content.Intent"
  url="mqqwpa://im/chat?chat_type=wpa&uin=2049898109"
  activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
end

function About()
  dialog=AlertDialog.Builder(this)
  .setTitle("关于")
  .setMessage([[开发者：AveQY

QQ:2049898109
邮箱：2049898109@qq.com

喜欢软件的可以给个好评&捐赠，您的支持是我最大的动力！

软件使用说明：
//点击单词可查看中文
//发现单词错误「长按单词」纠错
//点击阅读放大
//写完笔记记得保存
//点击标题栏输入网址
//顺序背诵中点击数字查看全部自定义的单词

V1.1(当前版本)
自定义背诵单词工具
-动画效果
-单词计数器
-随机&顺序背诵
-英译中(可无视)
-阅读英语新闻
-接入第三方翻译
-记录笔记
-背诵计时器

发现Bug请及时联系开发者
后续修复与添加模块
如有侵权请联系开发者]])
  .setNegativeButton("知道了",nil)
  .show()
  dialog.create()
  Drawable_round(dialog.getWindow(),0xFFFFFFFF)
end

function update()
  import "http"
  url="https://share.weiyun.com/bdcigmzz"
  Http.get(url,nil,"utf8",nil,function(code,content)
    if code==200 then
      包名="com.AveQY.xzdc"
      当前版本=tonumber(activity.getPackageManager().getPackageInfo(包名, 0).versionName)
      更新版本=tonumber(content:match("<p>版本【(.-)】"))
      if 更新版本 > 当前版本 then
        更新说明=content:match("更新说明【(.-)】")
        更新链接=content:match("更新链接【(.-)】")
        dialog=AlertDialog.Builder(this)
        .setTitle("发现新版本")
        .setMessage(更新说明)
        .setCancelable(false)--禁用返回键
        .setPositiveButton("更新",{onClick=function(v)
            import "android.content.Intent"
            import "android.net.Uri"
            url=更新链接
            viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
            activity.startActivity(viewIntent)
          end})
        .setNegativeButton("暂不更新",nil)
        .show()
        dialog.create()
        dialog.getButton(dialog.BUTTON_NEGATIVE).setTextColor(0xFFFF5855)
        Drawable_round(dialog.getWindow(),0xFFFFFFFF)
       elseif 更新版本 < 当前版本 then
        更新链接=content:match("<p>更新链接【(.-)】")
        更新说明=content:match("<p>更新说明【(.-)】")
        dialog=AlertDialog.Builder(this)
        .setTitle("发现新版本")
        .setCancelable(false)
        .setMessage(更新说明)
        .setPositiveButton("升级",{onClick=function(v)
            import "android.content.Intent"
            import "android.net.Uri"
            url=更新链接
            viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
            activity.startActivity(viewIntent)
          end})
        .show()
        dialog.create()
        Drawable_round(dialog.getWindow(),0xFFFFFFFF)
       else
        if 更新版本==当前版本 then
          toa("您己经是最新版本了！","res/ic_memory_black_24dp.png",0xFF4CAD95)
         else
        end
      end
     else
      toa("服务器炸了？！","res/ic_perm_scan_wifi_black_24dp.png",0xFFFF555A)
    end
  end)
end

function Donation()
  activity.newActivity("ts/Juan")
end

function Empty()
  dialog=AlertDialog.Builder(this)
  .setTitle("确定")
  .setMessage("你确定清楚数据？")
  .setPositiveButton("确定",{onClick=function(v)
      os.execute("rm -r ".."/sdcard/小贼单词")
      os.exit()
      toa("成功清除！","res/ic_memory_black_24dp.png",0xFFFF555A)
    end})
  .show()
  dialog.create()
  dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(0xFFFF7272)
  Drawable_round(dialog.getWindow(),0xFFFFFFFF)
end

function Sharing()
  import "android.content.*"
  url="https://share.weiyun.com/bdcigmzz"
  Http.get(url,nil,"utf8",nil,function(code,content)
    地址=content:match("<p>更新链接【(.-)】")
  end)
  当前版本=tonumber(activity.getPackageManager().getPackageInfo("com.AveQY.xzdc", 0).versionName)
  text="软件名称：小贼单词".."\n".."软件版本："..当前版本.."\n".."软件大小：".."不足10MB".."\n".."软件介绍：这是一款不错的背诵单词软件，完全自定义单词背诵！再也不用拘束于课本上的单词了！".."\n".."下载地址:"..地址
  intent=Intent(Intent.ACTION_SEND);
  intent.setType("text/plain");
  intent.putExtra(Intent.EXTRA_SUBJECT, "分享");
  intent.putExtra(Intent.EXTRA_TEXT, text);
  intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
  activity.startActivity(Intent.createChooser(intent,"分享到:"));
end

function file_all()
  import "java.io.File"--导入File类-
  File("/storage/emulated/0/小贼单词/单词/").mkdirs()
  File("/sdcard/小贼单词/wordsbook/").mkdirs()
  File("/sdcard/小贼单词/wordsbook/booksname/").mkdirs()
  File("/sdcard/小贼单词/Backup/").mkdirs()
  File("/sdcard/小贼单词/data/").mkdirs()
  File("/sdcard/小贼单词/Backup/默认/").mkdirs()
  a=io.open("/storage/emulated/0/小贼单词/data/math")
  b=io.open("/storage/emulated/0/小贼单词/wordsbook/booksname/1")
  c=io.open("/sdcard/小贼单词/wordsbook/number")
  d=io.open("/sdcard/小贼单词/path")
  e=io.open("/sdcard/小贼单词/wordsbook/booknames")
  f=io.open("/sdcard/小贼单词/data/wab")
  g=io.open("/sdcard/小贼单词/zip")
  h=io.open("/storage/emulated/0/小贼单词/data/order")
  i=io.open("/sdcard/小贼单词/data/day")
  j=io.open("/sdcard/小贼单词/data/link")
  k=io.open("/sdcard/小贼单词/data/butRecite")

  if a==nil then
    io.open("/storage/emulated/0/小贼单词/data/math", 'w')
    io.open("/sdcard/小贼单词/data/random", 'w')
    io.open("/storage/emulated/0/小贼单词/data/math","w"):write("1"):close()
  end
  if b==nil then
    io.open("/sdcard/小贼单词/wordsbook/booksname/1", 'w')
    io.open("/sdcard/小贼单词/wordsbook/booksname/2", 'w')
    io.open("/sdcard/小贼单词/wordsbook/booksname/3", 'w')
  end
  if c==nil then
    io.open("/sdcard/小贼单词/wordsbook/number", 'w')
    io.open("/storage/emulated/0/小贼单词/wordsbook/number","w"):write("1"):close()
  end
  if d==nil then
    io.open("/sdcard/小贼单词/path", 'w')
    io.open("/storage/emulated/0/小贼单词/path","w"):write("单词"):close()
  end
  if e==nil then
    io.open("/sdcard/小贼单词/wordsbook/booknames", 'w')
  end
  if f==nil then
    io.open("/sdcard/小贼单词/data/wab", 'w')
  end
  if g==nil then
    io.open("/sdcard/小贼单词/zip", 'w')
    io.open("/storage/emulated/0/小贼单词/zip","w"):write("默认"):close()
  end
  if h==nil then
    io.open("/storage/emulated/0/小贼单词/data/order","w")
  end
  if i==nil then
    io.open("/sdcard/小贼单词/data/day","w"):write("0【0】"):close()
  end
  if j==nil then
    dialog=AlertDialog.Builder(this)
    .setTitle("软件使用说明")
    .setMessage([[隐藏的功能：
//标题栏竟然可以搜索？！
----目前只支持输入网址

//点击单词直接查看意思
----这么方便？！

//不小心输入错误单词怎么办？
----找到错误单词[长按]

//这个阅读模块令我不爽？
----点击[阅读]

//我想要看我添加的单词？
----顺序背诵>计数器

//笔记不会自动保存？
----抱歉这是我的错，请手动

建议先点击下次提醒，好好体验一把软件后，再点击不再提醒

部分功能不是十分完善！后续更新
喜欢软件的可以给点鼓励]])
    .setPositiveButton("不再提示",{onClick=function(v)
        io.open("/sdcard/小贼单词/data/link",'w')
      end})
    .setNeutralButton("下次提醒",nil)
    .show()
    dialog.create()
    Drawable_round(dialog.getWindow(),0xFFFFFFFF)
  end
  if k==nil then
    io.open("/sdcard/小贼单词/data/butRecite","w"):write("英文"):close()
  end
end

function 增加数值()
  toa("添加成功！","res/ic_border_color_black_24dp.png",0xFF63A57E)
  val=io.open("/storage/emulated/0/小贼单词/data/math"):read("*a")
  new=val+1
  io.open("/storage/emulated/0/小贼单词/data/math","w"):write(new):close()
end

function 判断单词是否存在(act)
  Garbled=io.open("/storage/emulated/0/小贼单词/path"):read("*a")
  passio=io.open("/storage/emulated/0/小贼单词/"..Garbled.."/".."1")
  if passio==nil then
    toa("请先添加单词！","res/ic_info_outline_black_24dp.png",0xFFFF615D)
   else
    activity.newActivity(act)
  end
end

function 添加()
  InputLayout={
    LinearLayout;
    orientation="vertical";
    Focusable=true,
    FocusableInTouchMode=true,
    {
      TextView;
      id="linkhint",
      layout_marginTop="10dp";
      text="英文：",
      layout_width="80%w";
      textColor="#25897F",
      layout_gravity="center";
    };
    {
      EditText;
      id="edit1",
      singleLine=true;--设置单行输入
      layout_width="80%w";
      layout_gravity="center";
    };
    {
      TextView;
      id="pathhint",
      text="中文：",
      layout_width="80%w";
      textColor="#25897F",
      layout_marginTop="10dp";
      layout_gravity="center";
    };
    {
      EditText;
      id="edit2",
      singleLine=true;--设置单行输入
      layout_width="80%w";
      layout_gravity="center";
    };
  };

  word2=io.open("/storage/emulated/0/小贼单词/data/math"):read("*a")
  word3=word2-1
  word=tointeger(word3)
  dialog=AlertDialog.Builder(this)
  .setTitle("添加单词".."(已添加"..word.."个单词)")
  .setView(loadlayout(InputLayout))
  .setCancelable(false)
  .setPositiveButton("确定",{onClick=function(v)
      English=edit1.Text
      China=edit2.Text
      if English=="" then
        toa("请输入！","res/ic_info_outline_black_24dp.png",0xFFFF615D)
       elseif China=="" then
        toa("请输入！","res/ic_info_outline_black_24dp.png",0xFFFF615D)
       else
        Garbled=io.open("/storage/emulated/0/小贼单词/path"):read("*a")
        value=io.open("/storage/emulated/0/小贼单词/data/math"):read("*a")
        io.open("/storage/emulated/0/小贼单词/"..Garbled.."/"..value, 'w')
        io.open("/sdcard/小贼单词/"..Garbled.."/"..value,"a+"):write(English.."【"..China.."】\n"):close()
        增加数值()
      end
    end})
  .setNegativeButton("取消",nil)
  .show()
  dialog.create()
  Drawable_round(dialog.getWindow(),0xFFFFFFFF)
end

function CircleButton(view,InsideColor,radiu)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setColor(InsideColor)
  drawable.setCornerRadii({radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu});
  view.setBackgroundDrawable(drawable)
end

function 随机单词()
  max2=io.open("/storage/emulated/0/小贼单词/data/math"):read("*a")
  max=max2-1
  ma=math.random(1,max)
  Garbled=io.open("/storage/emulated/0/小贼单词/path"):read("*a")
  io.open("/sdcard/小贼单词/data/random","w"):write(ma):close()
  a=io.open("/storage/emulated/0/小贼单词/"..Garbled.."/"..ma):read("*a")
  b=string.match(a,"(.-)【")
  设置文本(hq,b)
end

function 判断单词()
  shu=edit3.Text
  Garbled=io.open("/storage/emulated/0/小贼单词/path"):read("*a")
  maa=io.open("/sdcard/小贼单词/data/random"):read("*a")
  aaa=io.open("/storage/emulated/0/小贼单词/"..Garbled.."/"..maa):read("*a")
  bbb=string.match(aaa,"【(.-)】")
  if shu==bbb then
    随机单词()
    设置文本(edit3,"")
   else
    振动(hq)
    设置文本(edit3,"")
  end
end

function 查看中文()
  Garbled=io.open("/storage/emulated/0/小贼单词/path"):read("*a")
  maa=io.open("/sdcard/小贼单词/data/random"):read("*a")
  aaa=io.open("/storage/emulated/0/小贼单词/"..Garbled.."/"..maa):read("*a")
  bbb=string.match(aaa,"【(.-)】")
  设置文本(hq,bbb)
end

function 修改单词()
  InputLayout={
    LinearLayout;
    orientation="vertical";
    Focusable=true,
    FocusableInTouchMode=true,
    {
      TextView;
      id="linkhint",
      layout_marginTop="10dp";
      text="英文：",
      layout_width="80%w";
      textColor="#25897F",
      layout_gravity="center";
    };
    {
      EditText;
      id="edit1",
      singleLine=true;--设置单行输入
      layout_width="80%w";
      layout_gravity="center";
    };
    {
      TextView;
      id="pathhint",
      text="中文：",
      layout_width="80%w";
      textColor="#25897F",
      layout_marginTop="10dp";
      layout_gravity="center";
    };
    {
      EditText;
      id="edit2",
      layout_width="80%w";
      singleLine=true;--设置单行输入
      layout_gravity="center";
    };
  };

  word=io.open("/sdcard/小贼单词/data/random"):read("*a")
  Garbled=io.open("/storage/emulated/0/小贼单词/path"):read("*a")
  word_turn=io.open("/sdcard/小贼单词/"..Garbled.."/"..word):read("*a")
  English_word=string.match(word_turn,"(.-)【")
  China_word=string.match(word_turn,"【(.-)】")

  dialog=AlertDialog.Builder(this)
  .setTitle("修改单词".."(修改第"..word.."个单词)")
  .setView(loadlayout(InputLayout))
  .setCancelable(false)
  .setPositiveButton("确定",{onClick=function(v)
      English=edit1.Text
      China=edit2.Text
      if English=="" then
        toa("请输入","res/ic_border_color_black_24dp.png",0xFF63A57E)
       else if China=="" then
          toa("请输入","res/ic_border_color_black_24dp.png",0xFF63A57E)
         else
          Garbled=io.open("/storage/emulated/0/小贼单词/path"):read("*a")
          io.open("/sdcard/小贼单词/"..Garbled.."/"..word,"w"):write(English.."【"..China.."】\n"):close()
          toa("修改成功！","res/ic_border_color_black_24dp.png",0xFF63A57E)
        end
      end
    end})
  .setNegativeButton("取消",nil)
  .show()
  edit1.setText(English_word)
  edit2.setText(China_word)
  dialog.create()
  Drawable_round(dialog.getWindow(),0xFFFFFFFF)
end

function start_word()
  Garbled=io.open("/storage/emulated/0/小贼单词/path"):read("*a")
  mi=io.open("/storage/emulated/0/小贼单词/data/random"):read("*a")
  a=io.open("/storage/emulated/0/小贼单词/"..Garbled.."/"..mi):read("*a")
  b=string.match(a,"(.-)【")
  设置文本(hq,b)
end

function 顺序背诵(symbol)
  maxn=io.open("/storage/emulated/0/小贼单词/data/math"):read("*a")
  max=tointeger(maxn)
  minn=io.open("/storage/emulated/0/小贼单词/data/random"):read("*a")
  min=minn+1
  if min==max then
    toa("到底了～","res/ic_info_outline_black_24dp.png",0xFFFF6664)
   else
    Garbled=io.open("/storage/emulated/0/小贼单词/path"):read("*a")
    io.open("/sdcard/小贼单词/data/random","w"):write(min):close()
    mi=io.open("/storage/emulated/0/小贼单词/data/random"):read("*a")
    a=io.open("/storage/emulated/0/小贼单词/"..Garbled.."/"..mi):read("*a")
    b=string.match(a,"(.-)【")
    io.open("/sdcard/小贼单词/data/order","w"):write(minn):close()
    设置文本(hq,b)
  end
end

function 至多至少()
  minn=io.open("/storage/emulated/0/小贼单词/data/random"):read("*a")
  min=minn-1

  if min==0 then
    toa("上面没有了！","res/ic_info_outline_black_24dp.png",0xFFFF6664)
   else
    io.open("/sdcard/小贼单词/data/random","w"):write(min):close()
    Garbled=io.open("/storage/emulated/0/小贼单词/path"):read("*a")
    mi=io.open("/storage/emulated/0/小贼单词/data/random"):read("*a")
    a=io.open("/storage/emulated/0/小贼单词/"..Garbled.."/"..mi):read("*a")
    b=string.match(a,"(.-)【")
    io.open("/sdcard/小贼单词/data/order","w"):write(minn):close()
    设置文本(hq,b)
  end
end

function 增加单词()
  shu=edit3.Text
  Garbled=io.open("/storage/emulated/0/小贼单词/path"):read("*a")
  maa=io.open("/sdcard/小贼单词/data/random"):read("*a")
  aaa=io.open("/storage/emulated/0/小贼单词/"..Garbled.."/"..maa):read("*a")
  bbb=string.match(aaa,"【(.-)】")
  if shu==bbb then
    顺序背诵()
    设置文本(edit3,"")
   else
    振动(hq)
    设置文本(edit3,"")
  end
end

function 继续(id)
  a=io.open("/sdcard/小贼单词/data/order"):read("*a")
  io.open("/sdcard/小贼单词/data/random","w"):write(a):close()
  b=io.open("/sdcard/小贼单词/data/random"):read("*a")
  c=io.open("/sdcard/小贼单词/"..Garbled.."/"..b):read("*a")
  d=string.match(c,"(.-)【")
  设置文本(id,d)
end

function 进度(id)
  plm=io.open("/storage/emulated/0/小贼单词/data/math"):read("*a")
  okn=io.open("/sdcard/小贼单词/data/random"):read("*a")
  pl=plm-1
  lm=tointeger(pl)
  设置文本(id,okn.."/"..lm)
end

function create_wordbooks()
  InputLayout={
    LinearLayout;
    orientation="vertical";
    Focusable=true,
    FocusableInTouchMode=true,
    {
      EditText;
      id="edit_create",
      layout_width="80%w";
      singleLine=true;--设置单行输入
      layout_gravity="center";
    };
  };

  dialog=AlertDialog.Builder(this)
  .setTitle("新建单词本")
  .setMessage("单词本名称：")
  .setView(loadlayout(InputLayout))
  .setCancelable(false)
  .setPositiveButton("确定",{onClick=function(v)
      number=io.open("/sdcard/小贼单词/wordsbook/number"):read("*a")
      number2=tointeger(number)
      if number2==4 then
        MD提示("至多添加三个单词本！",0xFFF18C90,0xFFFFFFFF,4,25)
       else
        wordsbook=edit_create.Text
        b=io.open("/sdcard/小贼单词/wordsbook/number"):read("*a")
        value=b+1
        io.open("/sdcard/小贼单词/wordsbook/booksname/"..b,"w"):write(wordsbook):close()
        File("/sdcard/小贼单词/wordsbook/"..wordsbook).mkdirs()
        io.open("/sdcard/小贼单词/wordsbook/number","w"):write(value):close()
        toa("创建成功！","res/ic_memory_black_24dp.png",0xFF1E8780)
        value3=value-1 value2=tointeger(value3)
        io.open("/sdcard/小贼单词/wordsbook/booknames","a+"):write(wordsbook.."【"..value2.."】\n"):close()
        LuaUtil.copyDir(activity.getLuaDir().."/ts/data.zip","/sdcard/小贼单词/Backup/"..wordsbook.."/data.zip")
      end
    end})
  .setNegativeButton("取消",nil)
  .show()
  dialog.create()
  Drawable_round(dialog.getWindow(),0xFFFFFFFF)
end

function choosewordsbook()
  a=io.open("/sdcard/小贼单词/wordsbook/number"):read("*a")
  d=a-1 b=tointeger(d)
  c=io.open("/sdcard/小贼单词/wordsbook/booksname/1"):read("*a")

  items={"默认"}
  if b==1 then
    table.insert(items,c)
   else if b==2 then
      e=io.open("/sdcard/小贼单词/wordsbook/booksname/2"):read("*a")
      table.insert(items,c)
      table.insert(items,e)
     else if b==3 then
        e=io.open("/sdcard/小贼单词/wordsbook/booksname/2"):read("*a")
        f=io.open("/sdcard/小贼单词/wordsbook/booksname/3"):read("*a")
        table.insert(items,c)
        table.insert(items,e)
        table.insert(items,f)
      end
    end
  end

  amz=io.open("/storage/emulated/0/小贼单词/zip"):read("*a")
  dialog=AlertDialog.Builder(this)
  .setTitle("选择单词本".."(当前:"..amz..")")
  .setItems(items,{onClick=function(l,v)
      name=items[v+1]
      a=io.open("/storage/emulated/0/小贼单词/zip"):read("*a")
      if name=="默认" then
        io.open("/sdcard/小贼单词/path","w"):write("单词"):close()
        io.open("/storage/emulated/0/小贼单词/zip","w"):write("默认"):close()
        ZipUtil.unzip("/storage/emulated/0/小贼单词/Backup/默认/data.zip","/sdcard/小贼单词/data")
       else
        io.open("/sdcard/小贼单词/path","w"):write("wordsbook/"..name):close()
        ZipUtil.zip("/sdcard/小贼单词/data","/sdcard/小贼单词/Backup/"..a.."/")
        io.open("/storage/emulated/0/小贼单词/zip","w"):write(name):close()
        am=io.open("/storage/emulated/0/小贼单词/zip"):read("*a")
        ZipUtil.unzip("/storage/emulated/0/小贼单词/Backup/"..am.."/data.zip","/sdcard/小贼单词/data")
      end
    end})
  .show()
  dialog.create()
  Drawable_round(dialog.getWindow(),0xFFFFFFFF)
end

function deletewordsbook()
  a=io.open("/sdcard/小贼单词/wordsbook/number"):read("*a")
  d=a-1 b=tointeger(d)
  c=io.open("/sdcard/小贼单词/wordsbook/booksname/1"):read("*a")

  items={"默认"}
  if b==1 then
    table.insert(items,c)
   else if b==2 then
      e=io.open("/sdcard/小贼单词/wordsbook/booksname/2"):read("*a")
      table.insert(items,c)
      table.insert(items,e)
     else if b==3 then
        e=io.open("/sdcard/小贼单词/wordsbook/booksname/2"):read("*a")
        f=io.open("/sdcard/小贼单词/wordsbook/booksname/3"):read("*a")
        table.insert(items,c)
        table.insert(items,e)
        table.insert(items,f)
      end
    end
  end

  amz=io.open("/storage/emulated/0/小贼单词/zip"):read("*a")
  dialog=AlertDialog.Builder(this)
  .setTitle("删除单词本".."(当前:"..amz..")")
  .setItems(items,{onClick=function(l,v)
      name=items[v+1]
      dialog=AlertDialog.Builder(this)
      .setTitle("确定删除"..name.."?")
      .setMessage("此操作不可恢复！")
      .setPositiveButton("确定",{onClick=function(v)
          if name=="默认" then
            MD提示("无法删除！",0xFFF18C90,0xFFFFFFFF,4,25)
           else
            aa=io.open("/sdcard/小贼单词/wordsbook/number"):read("*a")
            a=tointeger(aa)
            b=io.open("/sdcard/小贼单词/wordsbook/booknames"):read("*a")
            c=string.match(b,name.."【(.-)】") d=tointeger(c)
            if a==2 then
             else if a==3 then
                if d==1 then
                  word=io.open("/sdcard/小贼单词/wordsbook/booksname/2"):read("*a")
                  io.open("/sdcard/小贼单词/wordsbook/booksname/1","w"):write(word):close()
                end
               else if a==4 then
                  if d==1 then
                    word2=io.open("/sdcard/小贼单词/wordsbook/booksname/2"):read("*a")
                    io.open("/sdcard/小贼单词/wordsbook/booksname/1","w"):write(word2):close()
                    word4=io.open("/sdcard/小贼单词/wordsbook/booksname/3"):read("*a")
                    io.open("/sdcard/小贼单词/wordsbook/booksname/2","w"):write(word4):close()
                   else if d==2 then
                      word3=io.open("/sdcard/小贼单词/wordsbook/booksname/3"):read("*a")
                      io.open("/sdcard/小贼单词/wordsbook/booksname/2","w"):write(word3):close()
                    end
                  end
                end
              end
            end
            os.execute("rm -r ".."/sdcard/小贼单词/wordsbook/"..name)
            os.execute("rm -r ".."/sdcard/小贼单词/Backup/"..name.."/")
            aaa=aa-1
            io.open("/sdcard/小贼单词/wordsbook/number","w"):write(aaa):close()
            toa("删除成功！","res/ic_memory_black_24dp.png",0xFF1E8780)
            bbb=io.open("/sdcard/小贼单词/wordsbook/booknames"):read("*a")
            io.open("/sdcard/小贼单词/wordsbook/booknames","w"):write(string.gsub(bbb,name.."【"..d.."】","")):close()
            if name==amz then
              io.open("/storage/emulated/0/小贼单词/zip","w"):write("默认"):close()
              io.open("/storage/emulated/0/小贼单词/path","w"):write("单词"):close()
            end
          end
        end})
      .setNegativeButton("取消",nil)
      .show()
      dialog.create()
      Drawable_round(dialog.getWindow(),0xFFFFFFFF)
    end})
  .show()
  dialog.create()
  Drawable_round(dialog.getWindow(),0xFFFFFFFF)
end

function sogood()
  items={}
  table.insert(items,"乘客a：")
  table.insert(items,"这趟公交车可真暖和。")
  table.insert(items,"乘客b：")
  table.insert(items,"是啊，尤其是外面那么冷，刚上车好像钻被窝了一样。")
  table.insert(items,"乘客a：")
  table.insert(items,"别扯了，你家被窝里有这么多人啊？")
  table.insert(items,"乘客b：")
  table.insert(items,"在某宝买东西，SF快递打电话说我地址敏感，到不了。 大哥，别这样歧视我们监狱上班的好不好？")
  table.insert(items,"乘客a：")
  table.insert(items,"这款软件真好用，我忍不住要捐赠了")
  table.insert(items,"乘客b：")
  table.insert(items,"现在有很多软件想方设法骗取个人信息。今天浏览了几个都问我：你有没有年满18周岁？")
  table.insert(items,"路人甲：")
  table.insert(items,"点我(路人甲)有惊喜！")
  dialog=AlertDialog.Builder(this)
  .setTitle("")
  .setItems(items,{onClick=function(l,v)
      mimi=items[v+1]
      if mimi=="路人甲：" then
        s=io.open("/storage/sdcard/Android/data/com.tencent.tmgp.sgame/files/Resources/Splash_move/splash_test.mp4")
        if s==nil then
          toa("您没有安装程序！","res/ic_local_mall_black_24dp.png",0xFFFF6064)
         else
          toa("自己慢慢体会…","res/ic_cloud_done_black_24dp.png",0xFFDEDF72)
          --LuaUtil.copyDir(activity.getLuaDir().."/ts/mp4.mp4","/sdcard/Android/data/com.tencent.tmgp.sgame/files/Resources/Splash_move/splash_test.mp4")
        end
      end
    end})
  .show()
  dialog.create()
  Drawable_round(dialog.getWindow(),0xFFFFFFFF)
end

function list_words()
  items={}
  a=io.open("/storage/emulated/0/小贼单词/data/math"):read("*a")
  b=a-1 n=tointeger(b)

  Garbled=io.open("/storage/emulated/0/小贼单词/path"):read("*a")
  c=io.open("/sdcard/小贼单词/data/random"):read("*a")
  for i=1,n do
    d=io.open("/sdcard/小贼单词/"..Garbled.."/"..i):read("*a")
    e=string.match(d,"【(.-)】") f=string.match(d,"(.-)【")
    table.insert(items,f.."  "..e)
  end
  dialog=AlertDialog.Builder(this)
  .setTitle("所有单词")
  .setItems(items,{onClick=function(l,v)
      print(items[v+1])
    end})
  .show()
  dialog.create()
  Drawable_round(dialog.getWindow(),0xFFFFFFFF)
end

function Sign()
  c=io.open("/sdcard/小贼单词/data/day"):read("*a")
  a=os.date("%Y%m%d")
  d=string.match(c,"【(.-)】")
  e=string.match(c,"(.-)【") g=tointeger(e) f=g+1 b=tointeger(f)

  read=io.open("/sdcard/小贼单词/data/day"):read("*a")
  Intercept=string.match(read,"(.-)【")
  day=Intercept

  if a==d then
    dialog=AlertDialog.Builder(this)
    .setTitle("")
    .setMessage("累积背诵"..day.."天")
    .setPositiveButton("确定",{onClick=function(v)
      end})
    .show()
    dialog.create()
    Drawable_round(dialog.getWindow(),0xFFFFFFFF)
   else
    toa("签到成功！","res/ic_cloud_done_black_24dp.png",0xFF1E8780)
    io.open("/sdcard/小贼单词/data/day","w"):write(b.."【"..a.."】"):close()
  end
end

function set_background()
  InputLayout={
    LinearLayout;
    orientation="vertical";
    Focusable=true,
    FocusableInTouchMode=true,
    {
      EditText;
      id="edit_create",
      layout_width="80%w";
      singleLine=true;--设置单行输入
      layout_gravity="center";
    };
  };

  dialog=AlertDialog.Builder(this)
  .setTitle("设置背景")
  .setMessage("请输入网址")
  .setView(loadlayout(InputLayout))
  .setPositiveButton("确定",{onClick=function(v)
      place2=edit_create.Text
      if place2=="" then
        toa("请输入！","res/ic_highlight_remove_black_24dp.png",0xFFFF756F)
       else
        import "http"
        http.download(place2,"/sdcard/小贼单词/data/1_1.bin")
        toa("设置完成","res/ic_cloud_done_black_24dp.png",0xFFFF756F)
      end
    end})
  .setNegativeButton("获取链接",{onClick=function(v)
      items={}
      table.insert(items,"卡通男")
      table.insert(items,"卡通女")
      table.insert(items,"大吉")
      table.insert(items,"努力")
      table.insert(items,"平安")
      table.insert(items,"顺意")
      table.insert(items,"喜悦")
      table.insert(items,"伤感")
      dialog=AlertDialog.Builder(this)
      .setTitle("内置链接，点击复制")
      .setItems(items,{onClick=function(l,v)
          a=items[v+1]
          if a=="卡通男" then
            写入剪切板("https://wx3.sinaimg.cn/orj360/008oDExnly8gujk2lslbzj60u01hcmyl02.jpg")
           elseif a=="卡通女" then
            写入剪切板("https://wx1.sinaimg.cn/orj360/008oDExnly8gujk2siagqj60u01hc75v02.jpg")
           elseif a=="大吉" then
            写入剪切板("https://wx3.sinaimg.cn/orj360/008oDExnly8gujk3mpuwkj60u01hcq4402.jpg")
           elseif a=="努力" then
            写入剪切板("https://wx3.sinaimg.cn/orj360/008oDExnly8gujk3t2zovj60u01hc75e02.jpg")
           elseif a=="顺意" then
            写入剪切板("https://wx4.sinaimg.cn/orj360/008oDExnly8gujk4or8ebj60u01hct9z02.jpg")
           elseif a=="平安" then
            写入剪切板("https://wx3.sinaimg.cn/orj360/008oDExnly8gujk4li9t1j60u01hcq3z02.jpg")
           elseif a=="喜悦" then
            写入剪切板("https://wx3.sinaimg.cn/orj360/008oDExnly8gujk4t3q6zj60u01hcdh202.jpg")
           elseif a=="风景" then
            写入剪切板("https://wx2.sinaimg.cn/orj360/008oDExnly8gujk50zvlkj60u01hc1kx02.jpg")
           elseif a=="伤感" then
            写入剪切板("https://wx4.sinaimg.cn/orj360/008oDExnly8gv0uis4w6dj60jg0ykad602.jpg")
           else
          end
        end})
      .show()
      dialog.create()
      --dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(0xFF4D8F8F)
      Drawable_round(dialog.getWindow(),0xFFFFFFFF)
    end})
  .setNeutralButton("恢复默认",{onClick=function(v)
      os.execute("rm -r ".."/sdcard/小贼单词/data/1_1.bin")
      toa("已恢复","res/ic_extension_black_24dp.png",0xFF75A88B)
    end})
  .show()
  dialog.create()
  Drawable_round(dialog.getWindow(),0xFFFFFFFF)
end
