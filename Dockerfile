# 使用 Node.js 官方镜像作为基础镜像
FROM node:14

# 设置环境变量
ENV NVM_DIR=/root/.nvm

# 安装 nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

# 加载 nvm
RUN [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# 安装 LTS 版本的 Node.js
RUN nvm install --lts
RUN nvm use --lts
RUN nvm alias default lts/*

# 安装 @agentscope/studio
RUN npm install -g @agentscope/studio

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json
COPY package*.json ./

# 安装依赖
RUN npm install

# 暴露端口（如果需要）
EXPOSE 3000

# 启动应用
CMD ["as_studio"]