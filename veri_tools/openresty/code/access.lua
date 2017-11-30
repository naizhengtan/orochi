-- this is req: "counter,ip:port,req;"
local log = io.open("/tmp/trace_seq.log", "a") 
log:write("0," .. ngx.var.remote_addr .. ":" .. ngx.var.remote_port .. ",req;");
log:close()

-- this is req context
ngx.ctx.req_header = ngx.req.raw_header()
ngx.req.read_body()
ngx.ctx.req_body = ngx.req.get_body_data()
