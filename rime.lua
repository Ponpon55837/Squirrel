-- Usage:
--  engine:
--    ...
--    translators:
--      ...
--      - lua_translator@lua_function3
--      - lua_translator@lua_function4
--      ...
--    filters:
--      ...
--      - lua_filter@lua_function1
--      - lua_filter@lua_function2
--      ...


--- date/t translator
function t_translator(input, seg)
  if (string.match(input, "`")~=nil) then
      -- Candidate(type, start, end, text, comment)
  if (input == "`t") then
    yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), " 現在時間 (時:分:秒)"))
    yield(Candidate("time", seg.start, seg._end, os.date("%H:%M"), " 現在時間 (時:分) ~m"))
    return
  end

  if (input == "`tm") then
    yield(Candidate("time", seg.start, seg._end, os.date("%H:%M"), " 現在時間 (時:分)"))
    return
  end

  if (input == "`n") then
    yield(Candidate("time", seg.start, seg._end, os.date("%H:%M"), " 現在時間 (時:分)"))
    yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), " 現在時間 (時:分:秒) ~s"))
    return
  end

  if (input == "`ns") then
    yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), " 現在時間 (時:分:秒)"))
    return
  end

  if (input == "`d") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), " 現在日期 (年月日) ~c"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y%m%d"), " 現在日期 (年月日) ~d"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d"), " 現在日期 (年月日) ~s"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), " 現在日期 (年月日) ~m"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y_%m_%d"), " 現在日期 (年月日) ~u"))
    return
  end

  if (input == "`dc") then
    yield(Candidate("date", seg.start, seg._end, os.date(" %Y 年 %m 月 %d 日"), " 現在日期 (年月日)"))
    yield(Candidate("date", seg.start, seg._end, os.date(" %d 日 %m 月 %Y 年"), " 現在日期 (日月年)"))
    yield(Candidate("date", seg.start, seg._end, os.date(" %m 月 %d 日 %Y 年"), " 現在日期 (月日年)"))
    return
  end

  if (input == "`dd") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y%m%d"), " 現在日期 (年月日)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d%m%Y"), " 現在日期 (日月年)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m%d%Y"), " 現在日期 (月日年)"))
    return
  end

  if (input == "`dm") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), " 現在日期 (年月日)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d-%m-%Y"), " 現在日期 (日月年)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m-%d-%Y"), " 現在日期 (月日年)"))
    return
  end

  if (input == "`ds") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d"), " 現在日期 (年月日)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d/%m/%Y"), " 現在日期 (日月年)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m/%d/%Y"), " 現在日期 (月日年)"))
    return
  end

  if (input == "`du") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y_%m_%d"), " 現在日期 (年月日)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d_%m_%Y"), " 現在日期 (日月年)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m_%d_%Y"), " 現在日期 (月日年)"))
    return
  end

  if (input == "`dn") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日 %H:%M"), " 現在日期時間 (年月日 時:分) ~c"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y%m%d %H:%M"), " 現在日期時間 (年月日 時:分) ~d"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d %H:%M"), " 現在日期時間 (年月日 時:分) ~s"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d %H:%M"), " 現在日期時間 (年月日 時:分) ~m"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y_%m_%d %H:%M"), " 現在日期時間 (年月日 時:分) ~u"))
    return
  end

  if (input == "`dnc") then
    yield(Candidate("date", seg.start, seg._end, os.date(" %Y 年 %m 月 %d 日  %H : %M"), " 現在日期時間 (年月日 時:分)"))
    yield(Candidate("date", seg.start, seg._end, os.date(" %d 日 %m 月 %Y 年  %H : %M"), " 現在日期時間 (日月年 時:分)"))
    yield(Candidate("date", seg.start, seg._end, os.date(" %m 月 %d 日 %Y 年  %H : %M"), " 現在日期時間 (月日年 時:分)"))
    return
  end

  if (input == "`dnd") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y%m%d %H:%M"), " 現在日期時間 (年月日 時:分)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d%m%Y %H:%M"), " 現在日期時間 (日月年 時:分)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m%d%Y %H:%M"), " 現在日期時間 (月日年 時:分)"))
    return
  end

  if (input == "`dns") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d %H:%M"), " 現在日期時間 (年月日 時:分)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d/%m/%Y %H:%M"), " 現在日期時間 (日月年 時:分)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m/%d/%Y %H:%M"), " 現在日期時間 (月日年 時:分)"))
    return
  end

  if (input == "`dnm") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d %H:%M"), " 現在日期時間 (年月日 時:分)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d-%m-%Y %H:%M"), " 現在日期時間 (日月年 時:分)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m-%d-%Y %H:%M"), " 現在日期時間 (月日年 時:分)"))
    return
  end

  if (input == "`dnu") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y_%m_%d %H:%M"), " 現在日期時間 (年月日 時:分)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d_%m_%Y %H:%M"), " 現在日期時間 (日月年 時:分)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m_%d_%Y %H:%M"), " 現在日期時間 (月日年 時:分)"))
    return
  end

  if (input == "`dt") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日 %H:%M:%S"), " 現在日期時間 (年月日 時:分:秒) ~c"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y%m%d %H:%M:%S"), " 現在日期時間 (年月日 時:分:秒) ~d"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d %H:%M:%S"), " 現在日期時間 (年月日 時:分:秒) ~s"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d %H:%M:%S"), " 現在日期時間 (年月日 時:分:秒) ~m"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y_%m_%d %H:%M:%S"), " 現在日期時間 (年月日 時:分:秒) ~u"))
    return
  end

  if (input == "`dtc") then
    yield(Candidate("date", seg.start, seg._end, os.date(" %Y 年 %m 月 %d 日  %H : %M : %S"), " 現在日期時間 (年月日 時:分:秒)"))
    yield(Candidate("date", seg.start, seg._end, os.date(" %d 日 %m 月 %Y 年  %H : %M : %S"), " 現在日期時間 (日月年 時:分:秒)"))
    yield(Candidate("date", seg.start, seg._end, os.date(" %m 月 %d 日 %Y 年  %H : %M : %S"), " 現在日期時間 (月日年 時:分:秒)"))
    return
  end

  if (input == "`dtd") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y%m%d %H:%M:%S"), " 現在日期時間 (年月日 時:分:秒)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d%m%Y %H:%M:%S"), " 現在日期時間 (日月年 時:分:秒)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m%d%Y %H:%M:%S"), " 現在日期時間 (月日年 時:分:秒)"))
    return
  end

  if (input == "`dts") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d %H:%M:%S"), " 現在日期時間 (年月日 時:分:秒)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d/%m/%Y %H:%M:%S"), " 現在日期時間 (日月年 時:分:秒)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m/%d/%Y %H:%M:%S"), " 現在日期時間 (月日年 時:分:秒)"))
    return
  end

  if (input == "`dtm") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d %H:%M:%S"), " 現在日期時間 (年月日 時:分:秒)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d-%m-%Y %H:%M:%S"), " 現在日期時間 (日月年 時:分:秒)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m-%d-%Y %H:%M:%S"), " 現在日期時間 (月日年 時:分:秒)"))
    return
  end

  if (input == "`dtu") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y_%m_%d %H:%M:%S"), " 現在日期時間 (年月日 時:分:秒)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d_%m_%Y %H:%M:%S"), " 現在日期時間 (日月年 時:分:秒)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m_%d_%Y %H:%M:%S"), " 現在日期時間 (月日年 時:分:秒)"))
    return
  end

  if (input == "`y") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y年"), " 現在日期 (年)"))
    yield(Candidate("date", seg.start, seg._end, os.date(" %Y 年"), " 現在日期 (年)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y"), " 現在日期 (年)"))
    return
  end

  if (input == "`m") then
    yield(Candidate("date", seg.start, seg._end, os.date("%m月"), " 現在日期 (月)"))
    yield(Candidate("date", seg.start, seg._end, os.date(" %m 月"), " 現在日期 (月)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m"), " 現在日期 (月)"))
    return
  end

  if (input == "`dy") then
    yield(Candidate("date", seg.start, seg._end, os.date("%d日"), " 現在日期 (日)"))
    yield(Candidate("date", seg.start, seg._end, os.date(" %d 日"), " 現在日期 (日)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d"), " 現在日期 (日)"))
    return
  end

  if (input == "`md") then
    yield(Candidate("date", seg.start, seg._end, os.date("%m月%d日"), " 現在日期 (月日) ~c"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m%d"), " 現在日期 (月日) ~d"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m/%d"), " 現在日期 (月日) ~s"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m-%d"), " 現在日期 (月日) ~m"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m_%d"), " 現在日期 (月日) ~u"))
    return
  end

  if (input == "`mdc") then
    yield(Candidate("date", seg.start, seg._end, os.date(" %m 月 %d 日"), " 現在日期 (月日)"))
    yield(Candidate("date", seg.start, seg._end, os.date(" %d 日 %m 月"), " 現在日期 (日月)"))
    return
  end

  if (input == "`mdd") then
    yield(Candidate("date", seg.start, seg._end, os.date("%m%d"), " 現在日期 (月日)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d%m"), " 現在日期 (日月)"))
    return
  end

  if (input == "`mds") then
    yield(Candidate("date", seg.start, seg._end, os.date("%m/%d"), " 現在日期 (月日)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d/%m"), " 現在日期 (日月)"))
    return
  end

  if (input == "`mdm") then
    yield(Candidate("date", seg.start, seg._end, os.date("%m-%d"), " 現在日期 (月日)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d-%m"), " 現在日期 (日月)"))
    return
  end

  if (input == "`mdu") then
    yield(Candidate("date", seg.start, seg._end, os.date("%m_%d"), " 現在日期 (月日)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d_%m"), " 現在日期 (日月)"))
    return
  end

  if (input == "`ym") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月"), " 現在日期 (年月) ~c"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y%m"), " 現在日期 (年月) ~d"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m"), " 現在日期 (年月) ~s"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m"), " 現在日期 (年月) ~m"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y_%m"), " 現在日期 (年月) ~u"))
    return
  end

  if (input == "`ymc") then
    yield(Candidate("date", seg.start, seg._end, os.date(" %Y 年 %m 月"), " 現在日期 (年月)"))
    yield(Candidate("date", seg.start, seg._end, os.date(" %m 月 %Y 年"), " 現在日期 (月年)"))
    return
  end

  if (input == "`ymd") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y%m"), " 現在日期 (年月)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m%Y"), " 現在日期 (月年)"))
    return
  end

  if (input == "`yms") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m"), " 現在日期 (年月)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m/%Y"), " 現在日期 (月年)"))
    return
  end

  if (input == "`ymm") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m"), " 現在日期 (年月)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m-%Y"), " 現在日期 (月年)"))
    return
  end

  if (input == "`ymu") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y_%m"), " 現在日期 (年月)"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m_%Y"), " 現在日期 (月年)"))
    return
  end

  if(input=="`") then
    yield(Candidate("date", seg.start, seg._end, "" , "擴充模式"))
    return
  end

  y, m, d = string.match(input, "`(%d+)/(%d?%d)/(%d?%d)$")
  if(y~=nil) then
    yield(Candidate("date", seg.start, seg._end, y.."年"..m.."月"..d.."日" , " 日期"))
    return
  end

  m, d = string.match(input, "`(%d?%d)/(%d?%d)$")
  if(m~=nil) then
    yield(Candidate("date", seg.start, seg._end, m.."月"..d.."日" , " 日期"))
    return
  end

  end
end


--- date/t2 translator
function t2_translator(input, seg)
  if (string.match(input, "'/")~=nil) then
      -- Candidate(type, start, end, text, comment)
  if (input == "'/t") then
    yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), "〔時:分:秒〕"))
    yield(Candidate("time", seg.start, seg._end, os.date("%H:%M"), "〔時:分〕 ~m"))
    return
  end

  if (input == "'/tm") then
    yield(Candidate("time", seg.start, seg._end, os.date("%H:%M"), "〔時:分〕"))
    return
  end

  if (input == "'/n") then
    yield(Candidate("time", seg.start, seg._end, os.date("%H:%M"), "〔時:分〕"))
    yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), "〔時:分:秒〕 ~s"))
    return
  end

  if (input == "'/ns") then
    yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), "〔時:分:秒〕"))
    return
  end

  if (input == "'/d") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), "〔年月日〕 ~c"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y%m%d"), "〔年月日〕 ~d"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d"), "〔年月日〕 ~s"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), "〔年月日〕 ~m"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y_%m_%d"), "〔年月日〕 ~u"))
    return
  end

  if (input == "'/dc") then
    yield(Candidate("date", seg.start, seg._end, os.date(" %Y 年 %m 月 %d 日"), "〔年月日〕"))
    yield(Candidate("date", seg.start, seg._end, os.date(" %d 日 %m 月 %Y 年"), "〔日月年〕"))
    yield(Candidate("date", seg.start, seg._end, os.date(" %m 月 %d 日 %Y 年"), "〔月日年〕"))
    return
  end

  if (input == "'/dd") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y%m%d"), "〔年月日〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d%m%Y"), "〔日月年〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m%d%Y"), "〔月日年〕"))
    return
  end

  if (input == "'/dm") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), "〔年月日〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d-%m-%Y"), "〔日月年〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m-%d-%Y"), "〔月日年〕"))
    return
  end

  if (input == "'/ds") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d"), "〔年月日〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d/%m/%Y"), "〔日月年〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m/%d/%Y"), "〔月日年〕"))
    return
  end

  if (input == "'/du") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y_%m_%d"), "〔年月日〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d_%m_%Y"), "〔日月年〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m_%d_%Y"), "〔月日年〕"))
    return
  end

  if (input == "'/dn") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日 %H:%M"), "〔年月日 時:分〕 ~c"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y%m%d %H:%M"), "〔年月日 時:分〕 ~d"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d %H:%M"), "〔年月日 時:分〕 ~s"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d %H:%M"), "〔年月日 時:分〕 ~m"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y_%m_%d %H:%M"), "〔年月日 時:分〕 ~u"))
    return
  end

  if (input == "'/dnc") then
    yield(Candidate("date", seg.start, seg._end, os.date(" %Y 年 %m 月 %d 日  %H : %M"), "〔年月日 時:分〕"))
    yield(Candidate("date", seg.start, seg._end, os.date(" %d 日 %m 月 %Y 年  %H : %M"), "〔日月年 時:分〕"))
    yield(Candidate("date", seg.start, seg._end, os.date(" %m 月 %d 日 %Y 年  %H : %M"), "〔月日年 時:分〕"))
    return
  end

  if (input == "'/dnd") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y%m%d %H:%M"), "〔年月日 時:分〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d%m%Y %H:%M"), "〔日月年 時:分〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m%d%Y %H:%M"), "〔月日年 時:分〕"))
    return
  end

  if (input == "'/dns") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d %H:%M"), "〔年月日 時:分〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d/%m/%Y %H:%M"), "〔日月年 時:分〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m/%d/%Y %H:%M"), "〔月日年 時:分〕"))
    return
  end

  if (input == "'/dnm") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d %H:%M"), "〔年月日 時:分〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d-%m-%Y %H:%M"), "〔日月年 時:分〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m-%d-%Y %H:%M"), "〔月日年 時:分〕"))
    return
  end

  if (input == "'/dnu") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y_%m_%d %H:%M"), "〔年月日 時:分〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d_%m_%Y %H:%M"), "〔日月年 時:分〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m_%d_%Y %H:%M"), "〔月日年 時:分〕"))
    return
  end

  if (input == "'/dt") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日 %H:%M:%S"), "〔年月日 時:分:秒〕 ~c"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y%m%d %H:%M:%S"), "〔年月日 時:分:秒〕 ~d"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d %H:%M:%S"), "〔年月日 時:分:秒〕 ~s"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d %H:%M:%S"), "〔年月日 時:分:秒〕 ~m"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y_%m_%d %H:%M:%S"), "〔年月日 時:分:秒〕 ~u"))
    return
  end

  if (input == "'/dtc") then
    yield(Candidate("date", seg.start, seg._end, os.date(" %Y 年 %m 月 %d 日  %H : %M : %S"), "〔年月日 時:分:秒〕"))
    yield(Candidate("date", seg.start, seg._end, os.date(" %d 日 %m 月 %Y 年  %H : %M : %S"), "〔日月年 時:分:秒〕"))
    yield(Candidate("date", seg.start, seg._end, os.date(" %m 月 %d 日 %Y 年  %H : %M : %S"), "〔月日年 時:分:秒〕"))
    return
  end

  if (input == "'/dtd") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y%m%d %H:%M:%S"), "〔年月日 時:分:秒〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d%m%Y %H:%M:%S"), "〔日月年 時:分:秒〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m%d%Y %H:%M:%S"), "〔月日年 時:分:秒〕"))
    return
  end

  if (input == "'/dts") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d %H:%M:%S"), "〔年月日 時:分:秒〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d/%m/%Y %H:%M:%S"), "〔日月年 時:分:秒〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m/%d/%Y %H:%M:%S"), "〔月日年 時:分:秒〕"))
    return
  end

  if (input == "'/dtm") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d %H:%M:%S"), "〔年月日 時:分:秒〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d-%m-%Y %H:%M:%S"), "〔日月年 時:分:秒〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m-%d-%Y %H:%M:%S"), "〔月日年 時:分:秒〕"))
    return
  end

  if (input == "'/dtu") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y_%m_%d %H:%M:%S"), "〔年月日 時:分:秒〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d_%m_%Y %H:%M:%S"), "〔日月年 時:分:秒〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m_%d_%Y %H:%M:%S"), "〔月日年 時:分:秒〕"))
    return
  end

  if (input == "'/y") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y年"), "〔年〕"))
    yield(Candidate("date", seg.start, seg._end, os.date(" %Y 年"), "〔年〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y"), "〔年〕"))
    return
  end

  if (input == "'/m") then
    yield(Candidate("date", seg.start, seg._end, os.date("%m月"), "〔月〕"))
    yield(Candidate("date", seg.start, seg._end, os.date(" %m 月"), "〔月〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m"), "〔月〕"))
    return
  end

  if (input == "'/dy") then
    yield(Candidate("date", seg.start, seg._end, os.date("%d日"), "〔日〕"))
    yield(Candidate("date", seg.start, seg._end, os.date(" %d 日"), "〔日〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d"), "〔日〕"))
    return
  end

  if (input == "'/md") then
    yield(Candidate("date", seg.start, seg._end, os.date("%m月%d日"), "〔月日〕 ~c"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m%d"), "〔月日〕 ~d"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m/%d"), "〔月日〕 ~s"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m-%d"), "〔月日〕 ~m"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m_%d"), "〔月日〕 ~u"))
    return
  end

  if (input == "'/mdc") then
    yield(Candidate("date", seg.start, seg._end, os.date(" %m 月 %d 日"), "〔月日〕"))
    yield(Candidate("date", seg.start, seg._end, os.date(" %d 日 %m 月"), "〔日月〕"))
    return
  end

  if (input == "'/mdd") then
    yield(Candidate("date", seg.start, seg._end, os.date("%m%d"), "〔月日〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d%m"), "〔日月〕"))
    return
  end

  if (input == "'/mds") then
    yield(Candidate("date", seg.start, seg._end, os.date("%m/%d"), "〔月日〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d/%m"), "〔日月〕"))
    return
  end

  if (input == "'/mdm") then
    yield(Candidate("date", seg.start, seg._end, os.date("%m-%d"), "〔月日〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d-%m"), "〔日月〕"))
    return
  end

  if (input == "'/mdu") then
    yield(Candidate("date", seg.start, seg._end, os.date("%m_%d"), "〔月日〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%d_%m"), "〔日月〕"))
    return
  end

  if (input == "'/ym") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月"), "〔年月〕 ~c"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y%m"), "〔年月〕 ~d"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m"), "〔年月〕 ~s"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m"), "〔年月〕 ~m"))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y_%m"), "〔年月〕 ~u"))
    return
  end

  if (input == "'/ymc") then
    yield(Candidate("date", seg.start, seg._end, os.date(" %Y 年 %m 月"), "〔年月〕"))
    yield(Candidate("date", seg.start, seg._end, os.date(" %m 月 %Y 年"), "〔月年〕"))
    return
  end

  if (input == "'/ymd") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y%m"), "〔年月〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m%Y"), "〔月年〕"))
    return
  end

  if (input == "'/yms") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m"), "〔年月〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m/%Y"), "〔月年〕"))
    return
  end

  if (input == "'/ymm") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m"), "〔年月〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m-%Y"), "〔月年〕"))
    return
  end

  if (input == "'/ymu") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y_%m"), "〔年月〕"))
    yield(Candidate("date", seg.start, seg._end, os.date("%m_%Y"), "〔月年〕"))
    return
  end
--- 擴充模式 \r\n      日期 (年月日) ~d \r\n      年 ~y    月 ~m    日 ~day \r\n      年月 ~ym    月日 ~md \r\n      時間 (時分) ~n   (時分秒) ~t \r\n      日期時間 (年月日時分) ~dn\r\n      日期時間 (年月日時分秒) ~dt
  if(input=="'/") then
---    yield(Candidate("date", seg.start, seg._end, "" , "擴充模式"))
    yield(Candidate("date", seg.start, seg._end, "d〔年月日〕┆ ym〔年月〕┆ md〔月日〕" , ""))
    yield(Candidate("date", seg.start, seg._end, "y〔年〕 ┆ m〔月〕 ┆ dy〔日〕" , ""))
    yield(Candidate("date", seg.start, seg._end, "n〔時:分〕 ┆ t〔時:分:秒〕" , ""))
    yield(Candidate("date", seg.start, seg._end, "dn〔年月日 時:分〕┆ dt〔年月日 時:分:秒〕" , ""))
    yield(Candidate("date", seg.start, seg._end, "*/*/*〔 * 年 * 月 * 日〕┆ *-*-*〔*年*月*日〕" , ""))
    yield(Candidate("date", seg.start, seg._end, "*/*〔 * 月 * 日〕┆ *-*〔*月*日〕" , ""))
    return
  end

  y, m, d = string.match(input, "'/(%d+)/(%d?%d)/(%d?%d)$")
  if(y~=nil) then
    yield(Candidate("date", seg.start, seg._end, " "..y.." 年 "..m.." 月 "..d.." 日" , "〔日期〕"))
    return
  end

  m, d = string.match(input, "'/(%d?%d)/(%d?%d)$")
  if(m~=nil) then
    yield(Candidate("date", seg.start, seg._end, " "..m.." 月 "..d.." 日" , "〔日期〕"))
    return
  end

  y, m, d = string.match(input, "'/(%d+)-(%d?%d)-(%d?%d)$")
  if(y~=nil) then
    yield(Candidate("date", seg.start, seg._end, y.."年"..m.."月"..d.."日" , "〔日期〕"))
    return
  end

  m, d = string.match(input, "'/(%d?%d)-(%d?%d)$")
  if(m~=nil) then
    yield(Candidate("date", seg.start, seg._end, m.."月"..d.."日" , "〔日期〕"))
    return
  end

  end
end


--- date/time translator
function date_translator(input, seg)
  if (string.match(input, "``")~=nil) then
      -- Candidate(type, start, end, text, comment)
  if (input == "``time") then
    yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), " 現在時間"))
    return
  end

  if (input == "``now") then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), " 現在日期"))
    return
  end

  if(input=="``") then
    yield(Candidate("date", seg.start, seg._end, "" , "擴充模式"))
    return
  end

  y, m, d = string.match(input, "``(%d+)/(%d?%d)/(%d?%d)$")
  if(y~=nil) then
    yield(Candidate("date", seg.start, seg._end, y.."年"..m.."月"..d.."日" , " 日期"))
    return
  end

  m, d = string.match(input, "``(%d?%d)/(%d?%d)$")
  if(m~=nil) then
    yield(Candidate("date", seg.start, seg._end, m.."月"..d.."日" , " 日期"))
    return
  end

  end
end


--- charset filter
charset = {
   ["CJK"] = { first = 0x4E00, last = 0x9FFF },
   ["ExtA"] = { first = 0x3400, last = 0x4DBF },
   ["ExtB"] = { first = 0x20000, last = 0x2A6DF },
   ["ExtC"] = { first = 0x2A700, last = 0x2B73F },
   ["ExtD"] = { first = 0x2B740, last = 0x2B81F },
   ["ExtE"] = { first = 0x2B820, last = 0x2CEAF },
   ["ExtF"] = { first = 0x2CEB0, last = 0x2EBEF },
   ["Compat"] = { first = 0x2F800, last = 0x2FA1F } }

function exists(single_filter, text)
  for i in utf8.codes(text) do
     local c = utf8.codepoint(text, i)
     if (not single_filter(c)) then
  return false
     end
  end
  return true
end

function is_charset(s)
   return function (c)
      return c >= charset[s].first and c <= charset[s].last
   end
end

function is_cjk_ext(c)
   return is_charset("ExtA")(c) or is_charset("ExtB")(c) or
      is_charset("ExtC")(c) or is_charset("ExtD")(c) or
      is_charset("ExtE")(c) or is_charset("ExtF")(c) or
      is_charset("Compat")(c)
end

function charset_filter(input)
   for cand in input:iter() do
      if (not exists(is_cjk_ext, cand.text))
      then
   yield(cand)
      end
   end
end


--- charset comment filter
function charset_comment_filter(input)
   for cand in input:iter() do
      for s, r in pairs(charset) do
   if (exists(is_charset(s), cand.text)) then
      cand:get_genuine().comment = cand.comment .. " " .. s
      break
   end
      end
      yield(cand)
   end
end


--- single_char_filter
function single_char_filter(input)
   local l = {}
   for cand in input:iter() do
      if (utf8.len(cand.text) == 1) then
   yield(cand)
      else
   table.insert(l, cand)
      end
   end
   for i, cand in ipairs(l) do
      yield(cand)
   end
end


--- reverse_lookup_filter
pydb = ReverseDb("build/terra_pinyin.reverse.bin")

function xform_py(inp)
   if inp == "" then return "" end
   inp = string.gsub(inp, "([aeiou])(ng?)([1234])", "%1%3%2")
   inp = string.gsub(inp, "([aeiou])(r)([1234])", "%1%3%2")
   inp = string.gsub(inp, "([aeo])([iuo])([1234])", "%1%3%2")
   inp = string.gsub(inp, "a1", "ā")
   inp = string.gsub(inp, "a2", "á")
   inp = string.gsub(inp, "a3", "ǎ")
   inp = string.gsub(inp, "a4", "à")
   inp = string.gsub(inp, "e1", "ē")
   inp = string.gsub(inp, "e2", "é")
   inp = string.gsub(inp, "e3", "ě")
   inp = string.gsub(inp, "e4", "è")
   inp = string.gsub(inp, "o1", "ō")
   inp = string.gsub(inp, "o2", "ó")
   inp = string.gsub(inp, "o3", "ǒ")
   inp = string.gsub(inp, "o4", "ò")
   inp = string.gsub(inp, "i1", "ī")
   inp = string.gsub(inp, "i2", "í")
   inp = string.gsub(inp, "i3", "ǐ")
   inp = string.gsub(inp, "i4", "ì")
   inp = string.gsub(inp, "u1", "ū")
   inp = string.gsub(inp, "u2", "ú")
   inp = string.gsub(inp, "u3", "ǔ")
   inp = string.gsub(inp, "u4", "ù")
   inp = string.gsub(inp, "v1", "ǖ")
   inp = string.gsub(inp, "v2", "ǘ")
   inp = string.gsub(inp, "v3", "ǚ")
   inp = string.gsub(inp, "v4", "ǜ")
   inp = string.gsub(inp, "([nljqxy])v", "%1ü")
   inp = string.gsub(inp, "eh[0-5]?", "ê")
   return "(" .. inp .. ")"
end

function reverse_lookup_filter(input)
   for cand in input:iter() do
      cand:get_genuine().comment = cand.comment .. " " .. xform_py(pydb:lookup(cand.text))
      yield(cand)
   end
end


--- composition
function myfilter(input)
   local input2 = Translation(charset_comment_filter, input)
   reverse_lookup_filter(input2)
end

function mytranslator(input, seg)
   date_translator(input, seg)
   time_translator(input, seg)
end
