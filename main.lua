require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "AndLua"
import "toast/toa"

activity.setTheme(R.Theme_Black)
activity.setTitle('笔记')

layout5={
  LinearLayout;
  layout_width="fill";
  layout_height="fill";
  orientation="vertical";
  {
    LinearLayout;
    layout_height="fill";
    layout_width="fill";
    {
      ScrollView;
      layout_height="fill";
      layout_width="fill";
      {
        LinearLayout;
        layout_width="fill";
        layout_height="fill";
        orientation="vertical";
        {
          AutoCompleteTextView;
          layout_width="fill";
          layout_height="fill";
          id="title";
          layout_marginTop="10dp";
          singleLine="true";
          hint="标题";
          text="";
        };
        {
          EditText;
          layout_width="fill";
          layout_marginTop="10dp";
          id="txt";
          hint="内容";
          layout_height="fill";
        };
        {
          TextView;
          textColor="#0";
          textIsSelectable=true;
          id="txt2";
          layout_width="fill";
          layout_height="fill";
          textSize="18dp";
        };
      };
    };
  };
};

activity.setContentView(loadlayout(layout5))

activity.ActionBar.setDisplayHomeAsUpEnabled(true)
activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)


function 保存文章()
  b=title.Text
  file2=io.open("/sdcard/小贼单词/文章.txt")
  if file2==nil then
    创建文件("/sdcard/小贼单词/文章.txt")
    toa("请点击重新保存！","res/ic_info_outline_black_24dp.png",0xFFFF615D)
   else
    a=txt.Text
    写入文件("/sdcard/小贼单词/文章.txt","标题："..b.."\n".."内容："..a)
    toa("保存成功！","res/ic_border_color_black_24dp.png",0xFF63A57E)
  end
end

function Sharing(path)
  import "android.webkit.MimeTypeMap"
  import "android.content.Intent"
  import "android.net.Uri"
  import "java.io.File"
  FileName=tostring(File(path).Name)
  ExtensionName=FileName:match("%.(.+)")
  Mime=MimeTypeMap.getSingleton().getMimeTypeFromExtension(ExtensionName)
  intent = Intent()
  intent.setAction(Intent.ACTION_SEND)
  intent.setType(Mime)
  file = File(path)
  uri = Uri.fromFile(file)
  intent.putExtra(Intent.EXTRA_STREAM,uri)
  intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
  activity.startActivity(Intent.createChooser(intent, "txt文档，笔记"))
end

function 查看()
  a=io.open("/sdcard/小贼单词/文章.txt"):read("*a")
  设置文本(txt2,a)
end

function onCreateOptionsMenu(menu)
  menu.add("本地保存")
  menu.add("分享笔记")
  menu.add("查看笔记")
end
function onOptionsItemSelected(item)
  b=item.Title
  c="本地保存"
  d="分享笔记"
  e="查看笔记"
  if b==c then
    保存文章()
   else
    if b==d then
      Sharing("/sdcard/小贼单词/文章.txt")
     else
      if b==e then
        查看()
       else
      end
    end
  end
  if item.Title==nil then
    activity.finish()
  end
end

--适配
arr={"今日一事","新鲜的事"}
arrayAdapter=LuaArrayAdapter(activity,{TextView,padding="10dp",textSize="18sp",layout_width="fill",textColor="#ff000000"}, String(arr))
title.setAdapter(arrayAdapter)


