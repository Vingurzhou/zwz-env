FROM ubuntu:20.04

#设置环境变量###################
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
ENV PATH=$PATH:/usr/local/go/bin
ENV GO111MODULE="on"
ENV ZSH=/root/.oh-my-zsh
ENV GOPRIVATE="github.com/astra-x/*,github.com/yuhu-tech/*,go.etcd.io/*,chainmaker.org"

#安装工具######################
RUN apt-get update
# RUN apt-get install -y npm
# RUN apt-get install -y libvips libvips-dev
RUN apt-get install -y git
RUN apt-get install -y curl
RUN apt-get install -y make
RUN apt-get install -y vim
RUN apt-get install -y jq
RUN apt-get install -y zsh
RUN apt-get install -y wget
RUN apt-get install -y tzdata

#安装npm插件#####################
# RUN npm install pm2 -g

#安装go插件########################
RUN wget https://go.dev/dl/go1.18.linux-arm64.tar.gz
RUN tar -C /usr/local -xzf go1.18.linux-arm64.tar.gz
RUN go install -v golang.org/x/tools/gopls@latest
RUN go install github.com/go-delve/delve/cmd/dlv@v1.9.0
RUN go install honnef.co/go/tools/cmd/staticcheck@v0.3.3
RUN go install -v github.com/cweill/gotests/gotests@latest

#安装zsh插件##########################
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/plugins/zsh-syntax-highlighting
RUN sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc

CMD tail -f /dev/null