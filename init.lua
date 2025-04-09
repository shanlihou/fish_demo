local plugin_dir = dart_utils.plugin_dir()
local debug = require "tf_api.debug"

package.path = package.path
    .. ';'
    .. './' .. plugin_dir .. '/dmzj/?.lua;'
    .. './' .. plugin_dir .. '/dmzj/?/init.lua'

local http = require "tf_api.http"
local debug = require "tf_api.debug"

local M = {}


---@class SearchPayload
---@field keyword string
---@field page number

---@class SearchAction
---@field payload SearchPayload

---@class SearchResultData
---@field title string
---@field cover string
---@field extra table
---@field comic_id string

---@class SearchResult
---@field success boolean
---@field data SearchResultData[]

---@param act SearchAction
---@return SearchResult
function M.search(act)
    dart_utils.log('im in fish demo search')

    return {
        success = true,
        data = {
            {
                title = "test",
                cover = "https://github.com/shanlihou/fish_demo/blob/master/res/cover.png?raw=true",
                extra = {},
                comic_id = "1",
            }
        }
    }
end

---@class DownloadImagePayload
---@field url string
---@field downloadPath string

---@class DownloadImageAction
---@field payload DownloadImagePayload

---@class DownloadImageResult
---@field code number

---@param act DownloadImageAction
---@return DownloadImageResult
function M.download_image(act)
    local url = act.payload.url
    local path = act.payload.downloadPath
    local response = http.download(url, path)

    return {
        code = response.code,
    }
end


---@class GetDetailPayload
---@field comic_id string

---@class GetDetailAction
---@field payload GetDetailPayload

---@class GetDetailResult
---@field title string
---@field cover string
---@field chapters GetDetailResultChapter[]
---@field id string
---@field extra table

---@class GetDetailResultChapter
---@field id string
---@field title string

---@param act GetDetailAction
---@return GetDetailResult
function M.get_detail(act)
    return {
        title = 'fish_demo',
        cover = 'https://github.com/shanlihou/fish_demo/blob/master/res/cover.png?raw=true',
        chapters = {
            {
                id = '101',
                title = 'first',
            }
        },
        id = '1',
        extra = {},
    }
end


---@class ChapterDetailPayload
---@field chapter_id string
---@field comic_id string
---@field extra table

---@class ChapterDetailAction
---@field payload ChapterDetailPayload

---@class ChapterDetailResult
---@field images string[]
---@field extra table

---@param act ChapterDetailAction
---@return ChapterDetailResult
function M.chapter_detail(act)
    return {
        images = {
            'https://github.com/shanlihou/fish_demo/blob/master/res/s1_01.png?raw=true',
            'https://github.com/shanlihou/fish_demo/blob/master/res/s1_02.png?raw=true',
            'https://github.com/shanlihou/fish_demo/blob/master/res/s1_03.png?raw=true',
            'https://github.com/shanlihou/fish_demo/blob/master/res/s1_04.png?raw=true',
        },
        extra = {},
    }
end

return M