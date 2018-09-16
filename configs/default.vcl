vcl 4.0;

backend default {
       .host = "nginx";
       .port = "9090";
}

# extending caching time

sub vcl_backend_response {

  if (beresp.ttl == 120s) {

    set beresp.ttl = 240s;

  }
}

#hit or miss
sub vcl_deliver {
        if (obj.hits > 0) {
                set resp.http.X-Cache = "HIT";
        } else {
                set resp.http.X-Cache = "MISS";
        }
}