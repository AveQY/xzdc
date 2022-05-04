function now_math()
  plm=io.open("/storage/emulated/0/小贼单词/data/math"):read("*a")
  okn=io.open("/sdcard/小贼单词/data/butric/math"):read("*a")
  pl=plm-1
  lm=tointeger(pl)
  设置文本(mTextView2,okn.."/"..lm)
end

function file_butrecite()
  File("/sdcard/小贼单词/data/butric").mkdirs()
  a=io.open("/sdcard/小贼单词/data/butric/r1")
  b=io.open("/sdcard/小贼单词/data/butric/r2")
  c=io.open("/sdcard/小贼单词/data/butric/r3")
  d=io.open("/sdcard/小贼单词/data/butric/r4")
  e=io.open("/sdcard/小贼单词/data/butric/math")

  if e==nil then
    io.open("/sdcard/小贼单词/data/butric/r1",'w')
    io.open("/sdcard/小贼单词/data/butric/r2",'w')
    io.open("/sdcard/小贼单词/data/butric/r3",'w')
    io.open("/sdcard/小贼单词/data/butric/r4",'w')
    io.open("/sdcard/小贼单词/data/butric/button",'w')
    io.open("/sdcard/小贼单词/data/butric/math","w"):write("1"):close()
  end
end

function first_but()
  max2=io.open("/storage/emulated/0/小贼单词/data/math"):read("*a")
  max=max2-1
  ma=math.random(1,max)
  Garbled=io.open("/storage/emulated/0/小贼单词/path"):read("*a")
  io.open("/sdcard/小贼单词/data/butric/r1","w"):write(ma):close()
  a=io.open("/storage/emulated/0/小贼单词/"..Garbled.."/"..ma):read("*a")
  b=string.match(a,"(.-)【")
  c=string.match(a,"【(.-)】")
  d=io.open("/sdcard/小贼单词/data/butRecite"):read("*a")
  if d=="英文" then
    设置文本(Text1,c)
   else
    设置文本(Text1,b)
  end
end

function second_but()
  max2=io.open("/storage/emulated/0/小贼单词/data/math"):read("*a")
  max=max2-1
  ma=math.random(1,max)
  Garbled=io.open("/storage/emulated/0/小贼单词/path"):read("*a")
  io.open("/sdcard/小贼单词/data/butric/r2","w"):write(ma):close()
  a=io.open("/storage/emulated/0/小贼单词/"..Garbled.."/"..ma):read("*a")
  b=string.match(a,"(.-)【")
  c=string.match(a,"【(.-)】")
  d=io.open("/sdcard/小贼单词/data/butRecite"):read("*a")
  if d=="英文" then
    设置文本(Text2,c)
   else
    设置文本(Text2,b)
  end
end

function third_but()
  max2=io.open("/storage/emulated/0/小贼单词/data/math"):read("*a")
  max=max2-1
  ma=math.random(1,max)
  Garbled=io.open("/storage/emulated/0/小贼单词/path"):read("*a")
  io.open("/sdcard/小贼单词/data/butric/r3","w"):write(ma):close()
  a=io.open("/storage/emulated/0/小贼单词/"..Garbled.."/"..ma):read("*a")
  b=string.match(a,"(.-)【")
  c=string.match(a,"【(.-)】")
  d=io.open("/sdcard/小贼单词/data/butRecite"):read("*a")
  if d=="英文" then
    设置文本(Text3,c)
   else
    设置文本(Text3,b)
  end
end

function fourth_but()
  max2=io.open("/storage/emulated/0/小贼单词/data/math"):read("*a")
  max=max2-1
  ma=math.random(1,max)
  Garbled=io.open("/storage/emulated/0/小贼单词/path"):read("*a")
  io.open("/sdcard/小贼单词/data/butric/r4","w"):write(ma):close()
  a=io.open("/storage/emulated/0/小贼单词/"..Garbled.."/"..ma):read("*a")
  b=string.match(a,"(.-)【")
  c=string.match(a,"【(.-)】")
  d=io.open("/sdcard/小贼单词/data/butRecite"):read("*a")
  if d=="英文" then
    设置文本(Text4,c)
   else
    设置文本(Text4,b)
  end
end

function now_word()
  math_cs=math.random(1,4)
  math_but=tointeger(math_cs)
  d=io.open("/sdcard/小贼单词/data/butRecite"):read("*a")
  a=io.open("/sdcard/小贼单词/data/butric/math"):read("*a") era=tointeger(a)
  Garbled=io.open("/storage/emulated/0/小贼单词/path"):read("*a")
  md=io.open("/storage/emulated/0/小贼单词/"..Garbled.."/"..era):read("*a")
  b=string.match(md,"(.-)【")
  c=string.match(md,"【(.-)】")
  if d=="英文" then
    if math_but==1 then
      设置文本(Text1,c)
     elseif math_but==2 then
      设置文本(Text2,c)
     elseif math_but==3 then
      设置文本(Text3,c)
     elseif math_but==4 then
      设置文本(Text4,c)
    end
   else
    if math_but==1 then
      设置文本(Text1,b)
     elseif math_but==2 then
      设置文本(Text2,b)
     elseif math_but==3 then
      设置文本(Text3,b)
     elseif math_but==4 then
      设置文本(Text4,b)
    end
  end
end

function now()
  first_but()
  second_but()
  third_but()
  fourth_but()
  now_word()
end

function now_eideword()
  a=io.open("/sdcard/小贼单词/data/butric/math"):read("*a")
  Garbled=io.open("/storage/emulated/0/小贼单词/path"):read("*a")
  md=io.open("/storage/emulated/0/小贼单词/"..Garbled.."/"..a):read("*a")
  b=string.match(md,"(.-)【")
  c=string.match(md,"【(.-)】")
  d=io.open("/sdcard/小贼单词/data/butRecite"):read("*a")
  if d=="英文" then
    hq.setText(b)
   else
    hq.setText(c)
  end
end

function t_f()

end

function raed_but()
  d=io.open("/sdcard/小贼单词/data/butRecite"):read("*a")
  if d=="英文" then
    awe=io.open("/sdcard/小贼单词/data/butric/math"):read("*a")
    Garbled=io.open("/storage/emulated/0/小贼单词/path"):read("*a")
    md=io.open("/storage/emulated/0/小贼单词/"..Garbled.."/"..awe):read("*a")
    b=string.match(md,"(.-)【")
    c=string.match(md,"【(.-)】")
    but=io.open("/sdcard/小贼单词/data/butric/button"):read("*a")
    if but==c then
      顺序背诵()
      now_math()
      now()
     else
      振动(hq)
    end
   else
    but=io.open("/sdcard/小贼单词/data/butric/button"):read("*a")
    if but==b then
      顺序背诵()
      now_math()
      now()
     else
      振动(hq)
    end
  end
end

function text1()
  a=Text1.Text
  io.open("/sdcard/小贼单词/data/butric/button","w"):write(a):close()
  raed_but()
end
function text2()
  a=Text2.Text
  io.open("/sdcard/小贼单词/data/butric/button","w"):write(a):close()
  raed_but()
end
function text3()
  a=Text3.Text
  io.open("/sdcard/小贼单词/data/butric/button","w"):write(a):close()
  raed_but()
end
function text4()
  a=Text4.Text
  io.open("/sdcard/小贼单词/data/butric/button","w"):write(a):close()
  raed_but()
end

function start()
  Garbled=io.open("/storage/emulated/0/小贼单词/path"):read("*a")
  md=io.open("/storage/emulated/0/小贼单词/"..Garbled.."/1"):read("*a")
  b=string.match(md,"(.-)【")
  c=string.match(md,"【(.-)】")
  d=io.open("/sdcard/小贼单词/data/butRecite"):read("*a")
  if d=="英文" then
    hq.setText(b)
   else
    hq.setText(c)
  end
end

function next_but()
  math1=io.open("/sdcard/小贼单词/data/butric/math"):read("*a")
  max=io.open("/storage/emulated/0/小贼单词/data/math"):read("*a")
  if max==math1 then
   else
    math2=tointeger(math1+1)
    io.open("/sdcard/小贼单词/data/butric/math","w"):write(math2):close()
    Garbled=io.open("/storage/emulated/0/小贼单词/path"):read("*a")
    a=io.open("/storage/emulated/0/小贼单词/"..Garbled.."/"..math2):read("*a")
    b=string.match(a,"(.-)【")
    c=string.match(a,"【(.-)】")
    d=io.open("/sdcard/小贼单词/data/butRecite"):read("*a")
    if d=="英文" then
      hq.setText(b)
     else
      hq.setText(c)
    end
  end
end

function Previous_but()
  math1=io.open("/sdcard/小贼单词/data/butric/math"):read("*a")
  if math1=="1" then
   else
    math2=tointeger(math1-1)
    io.open("/sdcard/小贼单词/data/butric/math","w"):write(math2):close()
    Garbled=io.open("/storage/emulated/0/小贼单词/path"):read("*a")
    a=io.open("/storage/emulated/0/小贼单词/"..Garbled.."/"..math2):read("*a")
    b=string.match(a,"(.-)【")
    c=string.match(a,"【(.-)】")
    d=io.open("/sdcard/小贼单词/data/butRecite"):read("*a")
    if d=="英文" then
      hq.setText(b)
     else
      hq.setText(c)
    end
  end
end
