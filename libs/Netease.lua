
return {
  search = function(keyword)
     local keyWord = HttpService:UrlEncode(keyword)

  local res = game:HttpGet("https://neteaseapi.imloadinguuu.repl.co/search?keywords=" .. keyWord)
  local json = HttpService:JSONDecode(res)
   return json.result.songs
   end,
  getLyrics = function(id) 
     Flux:Notification("Finding Lyrics", "OK")
   local res = game:HttpGet("https://neteaseapi.imloadinguuu.repl.co/lyric?id=" .. id) 
   local json = HttpService:JSONDecode(res)
   if json.uncollected then
    Flux:Notification("Lyrics Not Found", "OK")
     return false
   end
   local lrcs = {}
   local lyricsSplited = string.split(json.lrc.lyric,"\n")
   for i,v in pairs(lyricsSplited) do
     local time = string.match(v,"%[(%d+:%d+%.%d+)%]")
     table.insert(lrcs,{text = string.gsub(v,"%[%d+:%d+%.%d+%]",""),time = time})
   end
   Flux:Notification("Start Playing", "OK")
  print(res)
  return lrcs
    end
  }
