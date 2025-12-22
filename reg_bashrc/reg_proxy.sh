
open_proxy(){
  export http_proxy="http://127.0.0.1:7890/"
  export https_proxy="http://127.0.0.1:7890/"
  export HTTP_PROXY="http://127.0.0.1:7890/"
  export HTTPS_PROXY="http://127.0.0.1:7890/"
  # export NODE_USE_ENV_PROXY=1
}

close_proxy(){
  export http_proxy=""
  export https_proxy=""
  export HTTP_PROXY=""
  export HTTPS_PROXY=""
  export NODE_USE_ENV_PROXY=0
}

open_proxy
