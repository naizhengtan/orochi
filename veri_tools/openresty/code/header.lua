-- this is resp: "ip:port,rid,resp;"
local log = io.open("/tmp/trace_seq.log", "a") 
local rid = ngx.resp.get_headers()['x-rid']
ngx.ctx.rid = rid
log:write(ngx.var.remote_addr .. ":" .. ngx.var.remote_port .. "," .. tostring(rid) .. ",resp;");
log:close()

-- prepare the output string
ngx.ctx.resp_body = ""
