# A-Frame 本地示例集合

## 目录结构
```
local/
├── README.md              # 本说明文件
├── docs/
│   └── examples.md        # 详细的示例使用文档
├── examples/
│   ├── index.html         # 示例总览页面
│   ├── animation/         # 动画示例
│   ├── boilerplate/       # 入门示例
│   ├── primitives/        # 基础图元示例
│   ├── showcase/          # 高级展示示例
│   ├── performance/       # 性能测试示例
│   ├── assets/            # 共用资源文件
│   └── js/                # 共用脚本文件
├── dist/
│   └── aframe-master.min.js # A-Frame 构建文件
└── scripts/
    ├── start-server.sh    # 启动 HTTP 服务脚本
    └── run-all-examples.sh # 批量测试脚本
```

## 使用方法
1. 启动服务：
   ```bash
   ./scripts/start-server.sh [端口号]
   ```
   默认端口 8000

2. 在浏览器中访问：`http://localhost:8000/examples/`

3. 运行测试：
   ```bash
   ./scripts/run-all-examples.sh
   ```

## 文档
详细的使用说明和开发指南请查看 [docs/examples.md](docs/examples.md)
