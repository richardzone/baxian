FROM caddy:2-builder AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-l4 \
    --with github.com/mastercactapus/caddy2-proxyprotocol \
    --with github.com/mholt/caddy-webdav \
    --with github.com/imgk/caddy-trojan \
    --with github.com/caddyserver/forwardproxy@caddy2=github.com/klzgrad/forwardproxy@naive \
    --with github.com/caddy-dns/namecheap \
    --with github.com/caddy-dns/route53 \
    --with github.com/caddy-dns/digitalocean \
    --with github.com/caddy-dns/vultr \
    --with github.com/caddy-dns/dnspod \
    --with clevergo.tech/caddy-dnspodcn \
    --with github.com/caddy-dns/alidns \
    --with github.com/caddy-dns/googleclouddns \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddy-dns/azure \
    --with github.com/caddy-dns/duckdns


FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
