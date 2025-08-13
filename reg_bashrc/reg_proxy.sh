
export http_proxy="http://127.0.0.1:7890/"
export https_proxy="http://127.0.0.1:7890/"

close_proxy(){
  export http_proxy=""
  export https_proxy=""
}