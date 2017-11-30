-- dump the req text
local req_log = io.open("/tmp/branch/requests/r" .. tostring(ngx.ctx.rid) .. ".raw", "w")
req_log:write(tostring(ngx.ctx.req_header)) -- in case is nil
req_log:write("\n#&#\n")
req_log:write(tostring(ngx.ctx.req_body)) -- in case is nil
req_log:close()

-- unzip
--[[
local zlib = require("zlib")
local stream = zlib.inflate()
local unzip_body = stream(ngx.ctx.resp_body)
]]--

-- dump the response text
local resp_log = io.open("/tmp/branch/proxy_output/r" .. tostring(ngx.ctx.rid) .. ".html", "w")
resp_log:write(tostring(ngx.ctx.resp_body)) -- in case is nil
resp_log:close()
