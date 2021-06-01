local compe = require("compe")
local Job = require("plenary.job")
local Source = {}
Source.new = function()
  local self = setmetatable({}, {__index = Source})
  return self
end
Source.get_metadata = function(self)
  return {dup = 0, menu = "[nextword]", priority = 100}
end
Source.determine = function(self, context)
  return compe.helper.determine(context)
end
Source.complete = function(self, context)
  return self:collect(context.context.before_line, context.callback)
end
Source.collect = function(self, input, callback)
  local results = {}
  do
    local job
    local function _0_(_, data)
      do
        local pieces = vim.split(data, " ", true)
        for _0, v in ipairs(pieces) do
          table.insert(results, {word = v})
        end
      end
      return callback({incomplete = true, items = results})
    end
    job = Job:new({command = "nextword", cwd = vim.fn.getcwd(), on_stdout = _0_})
    job:start()
    job:send((input .. "\n"))
  end
  return results
end
return compe.register_source("nextword", Source)
