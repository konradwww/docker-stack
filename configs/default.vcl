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