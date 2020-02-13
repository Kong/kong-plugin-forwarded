local var = ngx.var


local ForwardedHandler = {
  PRIORITY = 0,
  VERSION  = "0.0.1",
}


function ForwardedHandler:access(conf)
  if conf.host  then var.upstream_x_forwarded_host  = conf.host  end
  if conf.port  then var.upstream_x_forwarded_port  = conf.port  end
  if conf.proto then var.upstream_x_forwarded_proto = conf.proto end
end


return ForwardedHandler
