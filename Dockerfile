# 使用 Node.js 20 官方镜像（基于 Debian Bookworm，含 Python 3.11+ 和 GLIBC 2.36+）
FROM node:20-bookworm

# 设置工作目录
WORKDIR /app

# 安装 @agentscope/studio（全局安装）
RUN npm install -g @agentscope/studio

# 暴露端口（根据实际需要调整）
EXPOSE 3000

# 启动命令
CMD ["as_studio"]
