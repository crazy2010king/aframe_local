# A-Frame 示例程序使用文档

## 1. A-Frame 简介
A-Frame 是 Mozilla 开发的开源 WebVR 框架，基于 Three.js，允许开发者使用 HTML 标签轻松创建 3D 和 VR/AR 体验。它具有以下特点：
- 无需安装复杂的开发环境，仅需浏览器即可运行
- 声明式 HTML 语法，简单易学
- 跨平台支持：桌面浏览器、移动设备、VR 头显、AR 设备
- 丰富的组件生态系统
- 高性能 WebGL 渲染

## 2. 快速入门
### 2.1 运行示例集合
1. 进入项目根目录
2. 运行启动脚本：
   ```bash
   ./local/scripts/start-server.sh [端口号]
   ```
   默认端口为 8000
3. 在浏览器中访问：`http://localhost:8000/examples/`
4. 点击任意示例卡片即可运行

### 2.2 基础场景结构
一个最简单的 A-Frame 场景：
```html
<html>
  <head>
    <script src="../dist/aframe-master.min.js"></script>
  </head>
  <body>
    <a-scene>
      <a-box position="-1 0.5 -3" rotation="0 45 0" color="#4CC3D9"></a-box>
      <a-sphere position="0 1.25 -5" radius="1.25" color="#EF2D5E"></a-sphere>
      <a-cylinder position="1 0.75 -3" radius="0.5" height="1.5" color="#FFC65D"></a-cylinder>
      <a-plane position="0 0 -4" rotation="-90 0 0" width="4" height="4" color="#7BC8A4"></a-plane>
      <a-sky color="#ECECEC"></a-sky>
    </a-scene>
  </body>
</html>
```

## 3. 示例分类详解

### 3.1 Boilerplate (入门示例)
**功能**：提供最基础的 A-Frame 使用场景，适合初学者学习
**包含示例**：
- Hello World：基础场景，包含盒子、球体、圆柱体等基础图元
- 360° Image：全景图片查看器，支持 360 度环视
- 360° Video：全景视频播放器
- Embedded：嵌入到普通网页中的 A-Frame 场景
- 3D Model：3D 模型加载和展示示例
- Arm Model：VR 控制器手臂模型演示

**核心知识点**：
- `<a-scene>` 标签：所有 A-Frame 内容的容器
- 基础图元标签的使用
- position/rotation/scale 变换属性
- 资源加载方法

### 3.2 Primitives (基础图元)
**功能**：展示 A-Frame 内置的所有基础 3D 图元及其属性配置
**包含示例**：
- Box：立方体，支持宽高深、颜色、纹理等配置
- Sphere：球体，支持半径、分段数等
- Cylinder：圆柱体，支持半径、高度、顶面/底面配置
- Plane：平面，可用于地面、墙面等
- Cone：圆锥体
- Torus：圆环体
- Light：光源系统，包括环境光、平行光、点光源、聚光灯
- Sky：天空盒，用于设置场景背景

**核心知识点**：
- 各种几何体的参数配置
- 材质和纹理的使用
- 光照和阴影系统
- 坐标系统（右手坐标系，Y轴向上）

### 3.3 Animation (动画效果)
**功能**：展示 A-Frame 强大的动画系统
**包含示例**：
- Basic Animation：基础的位置、旋转、缩放动画
- Animation Chain：顺序执行的链式动画
- Event-based Animation：由事件触发的动画（点击、悬停等）
- Loop Animation：循环动画
- Keyframes：多关键帧复杂动画
- Bezier Curve：沿贝塞尔曲线运动的动画

**核心知识点**：
- `<a-animation>` 标签的使用
- 动画属性配置：dur（时长）、delay（延迟）、easing（缓动函数）
- 动画事件系统
- 路径动画实现

### 3.4 Showcase (高级展示)
**功能**：复杂的综合应用示例，展示 A-Frame 的高级特性
**包含示例**：
- Anime UI：动画用户界面元素
- Comic Book：交互式漫画书体验
- Composite：高级渲染合成效果
- Curved Mockups：曲面屏幕展示
- Dynamic Lights：动态光照效果
- Model Viewer：交互式 3D 模型查看器
- 3D Painter：VR 绘画应用
- Post Processing：后期处理视觉效果（ bloom、景深等）
- Shopping Experience：交互式电商演示
- Spatial UI：3D 空间用户界面
- Spheres & Fog：大气雾和粒子效果
- WebGPU：WebGPU 渲染示例
- Wikipedia VR：维基百科 VR 体验

**核心知识点**：
- 自定义组件开发
- 高级渲染技术
- 用户交互系统
- 复杂场景构建

### 3.5 Performance (性能测试)
**功能**：性能基准测试示例，帮助优化 A-Frame 应用性能
**包含示例**：
- Cubes Benchmark：数千个立方体的性能测试
- Entity Count：实体数量性能测试
- setAttribute Test：setAttribute 方法性能基准
- Raw Animation：底层动画性能测试

**核心知识点**：
- 性能优化方法
- 实体数量对帧率的影响
- 批量处理技术
- 性能调试工具

## 4. 核心技术原理
### 4.1 实体-组件-系统 (ECS) 架构
A-Frame 采用 ECS 架构：
- **实体（Entity）**：`<a-entity>` 标签，是场景中的基本对象，本身没有功能
- **组件（Component）**：附加到实体上的功能模块，如 position、geometry、material 等
- **系统（System）**：管理全局状态和组件逻辑

### 4.2 渲染管线
A-Frame 基于 Three.js 实现 WebGL 渲染：
1. 场景图构建
2. 视锥体剔除
3. 光照计算
4. 材质着色
5. 帧缓冲输出

### 4.3 交互系统
A-Frame 支持多种交互方式：
- 鼠标/触摸交互
- VR 控制器交互
- 凝视交互（Gaze）
- 手势识别

## 5. 性能优化建议
1. **减少实体数量**：合并几何体，使用实例化渲染
2. **优化纹理**：使用合适的分辨率，压缩纹理
3. **减少 draw call**：合并材质，使用纹理图集
4. **LOD 技术**：远距离物体使用简化模型
5. **优化动画**：避免在 tick 事件中执行复杂计算
6. **使用光照贴图**：预计算光照，减少实时光照计算
7. **资源懒加载**：按需加载资源，避免初始加载时间过长

## 6. 二次开发指南
### 6.1 创建自定义组件
```javascript
AFRAME.registerComponent('rotate-forever', {
  schema: {
    speed: {type: 'number', default: 1}
  },
  tick: function (time, timeDelta) {
    this.el.object3D.rotation.y += this.data.speed * timeDelta / 1000;
  }
});
```

使用：
```html
<a-box rotate-forever="speed: 2"></a-box>
```

### 6.2 加载自定义 3D 模型
支持的格式：glTF (推荐)、OBJ、FBX、Collada
```html
<a-entity gltf-model="#model" position="0 0 -5"></a-entity>
<a-assets>
  <a-asset-item id="model" src="path/to/model.gltf"></a-asset-item>
</a-assets>
```

### 6.3 添加交互
```javascript
AFRAME.registerComponent('click-handler', {
  init: function () {
    this.el.addEventListener('click', () => {
      console.log('Entity clicked!');
      this.el.setAttribute('color', 'red');
    });
  }
});
```

## 7. 常见问题与解决方案
### 7.1 场景加载缓慢
**原因**：资源过大或数量过多
**解决方案**：
- 压缩纹理和模型
- 使用 glTF 格式（比 OBJ/FBX 更小）
- 实现资源懒加载
- 使用 CDN 加速资源加载

### 7.2 帧率低、卡顿
**原因**：场景复杂度太高
**解决方案**：
- 减少实体数量
- 降低模型面数
- 减少实时光源数量
- 关闭不必要的后期效果

### 7.3 模型显示异常
**原因**：
- 模型格式不支持
- 纹理路径错误
- 坐标系统不匹配
**解决方案**：
- 使用 glTF 格式，推荐使用 glTF Transform 工具优化
- 检查纹理路径是否正确
- 导出模型时确保 Y 轴向上

### 7.4 VR 模式无法进入
**原因**：
- 浏览器不支持 WebXR
- 没有 HTTPS 环境（localhost 除外）
- VR 设备未正确连接
**解决方案**：
- 使用最新版本的 Chrome、Firefox 或 Edge 浏览器
- 部署到 HTTPS 服务器
- 确保 VR 设备驱动是最新版本

## 8. 参考资源
- 官方文档：https://aframe.io/docs/
- 组件仓库：https://www.npmjs.com/search?q=aframe-component
- 示例集合：https://aframe.io/examples/
- Three.js 文档：https://threejs.org/docs/
