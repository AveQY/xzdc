require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "AndLua"
import "fun"
import "function"
import "toast/toa"
import "Animation/cartoon"
import "ts/MD5"

activity.setTheme(R.Theme_Black)

order_layout={
  LinearLayout;
  layout_height="fill";
  layout_width="fill";
  gravity="center";
  orientation="vertical";
  {
    FrameLayout,
    layout_width="fill",
    layout_weight="1",
    {
      LuaWebView,
      layout_width="fill",
      layout_height="fill",
      id="myWebView",
    },
    {
      LinearLayout,
      layout_width="fill",
      layout_height="fill",
      background="#FFFFFFFF",
      Gravity="center|top",
      orientation="vertical",
      clickable="true",
      id="SearchViewLayout",

      {
        ImageView,
        layout_marginTop="5%h",
        layout_width="100%w",
        layout_height="20%h",
        src="icon.png",
        id="img",
      },
      {
        CardView,
        layout_marginTop="20dp",
        layout_width="85%w",
        layout_height="44dp",
        radius="22dp",
        cardElevation="0",
        background="#FFEAEAEA",
        {
          LinearLayout,
          layout_width="fill",
          layout_height="44dp",
          {
            EditText,
            layout_weight="1",
            layout_height="44dp",
            background="#00000000",
            paddingLeft="20dp",
            textColor="#FF808080",
            singleLine="true",
            id="SearchViewEditText",
          },
          {
            ImageView,
            layout_width="44dp",
            layout_height="44dp",
            padding="12dp",
            colorFilter="#80808080",
            src="res/ic_search_black_24dp.png",
            id="MyViewGo",
          },
        },
      },
    },
  },
};

activity.setContentView(loadlayout(order_layout))

activity.ActionBar.hide()
activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)


MyViewGo.onClick=function()
  import "android.content.Context"
  import "android.view.inputmethod.InputMethodManager"
  if SearchViewEditText.Text~="" then
    SearchViewLayout.setVisibility(View.INVISIBLE)
    myWebView.loadUrl("https://fanyi.so.com/#"..SearchViewEditText.Text)
    imm = activity.getSystemService(Context.INPUT_METHOD_SERVICE)
    imm.toggleSoftInput(0,InputMethodManager.HIDE_NOT_ALWAYS)
   else
    MD提示("请输入",0xFF6F9D8A,0xFFFFFFFF,4,25)
  end
end

img.onClick=function()
  振动(img)
end

