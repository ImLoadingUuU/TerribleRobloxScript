local HttpService = game:GetService("HttpService")
return {
  search = function(keyword)
     local keyWord = HttpService:UrlEncode(keyword)

  local res = game:HttpGet("https://neteaseapi.imloadinguuu.repl.co/search?keywords=" .. keyWord)
  local json = HttpService:JSONDecode(res)
   print(#json)
   print(res)
    print(#json.result)
     print(#json.result.songs)
   return json.result.songs
   
   end,
  getLyrics = function(id) 
     
   local res = game:HttpGet("https://neteaseapi.imloadinguuu.repl.co/lyric?id=" .. id) 
   local json = HttpService:JSONDecode(res)
   if json.uncollected then
      
     return false
   end
   local lrcs = {}
   local lyricsSplited = string.split(json.lrc.lyric,"\n")
   for i,v in pairs(lyricsSplited) do
     local time = string.match(v,"%[(%d+:%d+%.%d+)%]")
     table.insert(lrcs,{text = string.gsub(v,"%[%d+:%d+%.%d+%]",""),time = time})
   end
  print(res)
  return lrcs
    end
  }
