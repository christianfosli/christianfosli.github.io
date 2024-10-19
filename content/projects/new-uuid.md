+++
title = "new-uuid.com"
description = "Simple web api to generate uuid's"
weight = 3
+++

Simple web api to generate random uuid's,
using rust, wasm/wasi and cloudflare's serverless platform "Cloudflare workers".

## Usage from the terminal

```sh
# print to stdout
curl https://new-uuid.com
# store in a variable
my_uuid="$(curl https://new-uuid.com)"
# copy to clipboard on Linux+Wayland
curl https://new-uuid.com | wl-copy
```

## Links

* Generate uuid [https://new-uuid.com](https://new-uuid.com)

* Source code: [github.com/christianfosli/new-uuid.com](https://github.com/christianfosli/new-uuid.com)
