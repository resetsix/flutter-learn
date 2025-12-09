## Hello Flutter

Flutter AI App MVP 实战开发计划

---

**目标**：在 3-4 周内构建一款支持 iOS/Android 的生产级 AI 应用。
**核心功能**：流式对话、多媒体生成、内购订阅、原生支付。

---

## 1. 技术栈清单 (Tech Stack)

| 模块 | 推荐库 (Package) | 作用 | React 对应概念 |
| --- | --- | --- | --- |
| **语言** | Dart | 强类型语言 | TypeScript |
| **核心框架** | Flutter | UI 框架 | React |
| **状态管理** | **flutter_riverpod** + **riverpod_annotation** | 全局状态管理 | Recoil / Jotai / Redux Toolkit |
| **网络请求** | **dio/Retrofit** | HTTP 请求（支持拦截器） | Axios |
| **路由管理** | **go_router** | 页面跳转与深链接 | React Router |
| **Markdown** | **flutter_markdown** | 渲染 AI 返回的文本 | `react-markdown` |
| **本地存储** | shared_preferences | 存 Token/配置 | `localStorage` |
| **图片选择** | image_picker | 调用相册/相机 | HTML Input file |
| **图片压缩** | **flutter_image_compress** | **必选**：压缩与格式转换 | (Canvas 压缩库) |
| **图片缓存** | cached_network_image | 网络图片缓存显示 | `<img>` loading="lazy" |
| **视频播放** | video_player + chewie | 视频预览 | `<video>` |
| **内购订阅** | **purchases_flutter (RevenueCat)** | 处理 Apple/Google 订阅 | Stripe (类似) |
| **支付** | pay | Apple Pay / Google Pay | Payment Request API |
| **设备信息** | device_info_plus | 获取唯一标识 | `navigator.userAgent` |
| **权限管理** | permission_handler | 请求相册/麦克风权限 | (Web 浏览器自动弹窗) |
| **图标启动** | flutter_launcher_icons / flutter_native_splash | 生成图标与启动页 | Webpack PWA 插件 |

补充：

- 解决静态资源硬编码问题：flutter_gen
- 代码生成器：json_serializable + freezed

---

## 2. 项目目录结构 (Feature-First 架构)

不要按层级分（pages/widgets），要按**业务功能**分。这是大型 Flutter 项目的标准。

```
lib/
├── main.dart                  # 应用入口 (ProviderScope)
├── app.dart                   # MaterialApp, Theme, GoRouter 配置
├── core/                      # 全局通用模块
│   ├── constants/             # API Key, URL, Enum
│   ├── theme/                 # AppTheme (颜色, 字体)
│   ├── network/               # Dio Client 封装 (拦截器, Token注入)
│   ├── utils/                 # 通用工具 (DateFormatter, ImageCompressor)
│   └── router/                # 路由定义 (GoRouter)
├── features/                  # 业务模块 (Feature-First)
│   ├── chat/                  # AI 对话模块
│   │   ├── models/            # ChatMessage (含 role, isStreaming)
│   │   ├── providers/         # ChatController (Riverpod, SSE逻辑)
│   │   ├── repositories/      # API 调用层 (Dio 请求)
│   │   └── ui/                # ChatScreen, ChatBubble, MarkdownWidget
│   ├── creation/              # 图片/视频生成模块
│   │   ├── providers/
│   │   └── ui/
│   └── settings/              # 设置与内购模块
│       ├── providers/         # RevenueCat 逻辑
│       └── ui/                # Paywall (付费墙), Profile
└── l10n/                      # (可选) 国际化文件

```

---

## 3. 开发任务清单 (Checklist)

### 第一阶段：地基与架构 (Foundation) - 第 1 周

- [ ]  **Dart 速通**：熟悉 `Null Safety` (`?`, `!`, `late`) 和 `async/await`。
- [ ]  **项目初始化**：`flutter create`，配置 `analysis_options.yaml` (Linter)。
- [ ]  **依赖安装**：将上述 Tech Stack 加入 `pubspec.yaml`。
- [ ]  **主题配置**：在 `app.dart` 设置 `ThemeData` (字体使用 Google Fonts, 颜色种子)。
- [ ]  **路由搭建**：配置 `GoRouter`，建立 Login, Home, Chat, Settings 页面空壳。
- [ ]  **状态管理配置**：在 `main.dart` 根部包裹 `ProviderScope`。

### 第二阶段：网络与 AI 核心 (Core Logic) - 第 1.5 周

- [ ]  **Dio 封装**：实现单例 Dio，添加 `Interceptors` (请求头注入 Bearer Token，响应 401 自动登出)。
- [ ]  **数据模型 (Model)**：
    - [ ]  创建 `ChatMessage` 类。
    - [ ]  **关键字段**：必须包含 `role` (user/assistant/system)。
    - [ ]  **状态字段**：必须包含 `isStreaming` (用于 UI 显示 loading/光标)。
- [ ]  **流式请求 (SSE)**：
    - [ ]  在 Controller 中设置 Dio `responseType: ResponseType.stream`。
    - [ ]  **手动解析**：处理 `data: {...}` 格式，过滤 `[DONE]` 标记。
    - [ ]  **增量更新**：使用 `state = [...old, updatedLastMsg]` 策略，避免重绘整个列表。
- [ ]  **环境变量**：使用 `-dart-define` 或 `.env` 管理 API Key，**严禁上传 GitHub**。

### 第三阶段：UI 交互与体验 (UX) - 第 2 周

- [ ]  **聊天列表**：
    - [ ]  使用 `ListView.builder`。
    - [ ]  **自动滚动**：实现 `ScrollController`，在接收流式 chunk 时自动 `animateTo` 底部。
- [ ]  **Markdown 渲染**：集成 `flutter_markdown`，自定义代码块样式。
- [ ]  **输入框体验**：
    - [ ]  处理键盘遮挡 (`resizeToAvoidBottomInset: true`)。
    - [ ]  增加“发送中”禁用状态。
- [ ]  **安全区域**：所有页面 `Scaffold` `body` 包裹 `SafeArea` (适配 iPhone 灵动岛)。

### 第四阶段：多媒体与原生 (Media & Native) - 第 3 周

- [ ]  **图片选择**：集成 `image_picker`。
- [ ]  **图片压缩 (必做)**：
    - [ ]  使用 `flutter_image_compress`。
    - [ ]  **格式转换**：iOS HEIC -> JPEG (否则后端可能无法识别)。
- [ ]  **视频播放**：集成 `video_player` + `chewie`，注意页面销毁时 `dispose`。
- [ ]  **权限配置 (必做)**：
    - [ ]  iOS: `Info.plist` 添加 `NSPhotoLibraryUsageDescription` 等。
    - [ ]  Android: `AndroidManifest.xml` 添加权限。
- [ ]  **设备 ID**：集成 `device_info_plus` 获取 `identifierForVendor` / `androidId`。

### 第五阶段：商业化与发布 (Release) - 第 4 周

- [ ]  **内购 (IAP)**：
    - [ ]  配置 RevenueCat 后台 (Products, Entitlements)。
    - [ ]  实现代码：检查订阅状态、购买逻辑。
    - [ ]  **恢复购买**：必须实现 `Restore Purchase` 按钮 (Apple 审核必查)。
- [ ]  **App 图标**：使用 `flutter_launcher_icons` 生成所有尺寸图标。
- [ ]  **启动页**：使用 `flutter_native_splash` 生成。
- [ ]  **Release 打包**：
    - [ ]  iOS: Archive -> TestFlight。
    - [ ]  Android: Build App Bundle (`.aab`)。
- [ ]  **混淆检查**：确保 Release 包中 Dio 和 JSON 解析逻辑未被错误混淆 (ProGuard rules)。

---

## React 转 Flutter 思维自检 (Mental Check)

1. **别找 CSS 文件**：样式直接写在 Widget 的属性里 (`Container(color: Colors.red)`).
2. **Context 是关键**：`BuildContext` 类似于组件在 DOM 树中的位置句柄，跳转页面、弹窗、读 Theme 都需要它。
3. **不要滥用 setState**：尽可能将业务逻辑移入 **Riverpod Controller**，UI 只负责 `ref.watch`。
4. **嵌套是正常的**：Flutter 代码嵌套深是特性，善用 IDE 的 `Extract Widget` 将大组件拆分为小组件。
5. **真机调试**：Camera、IAP、Push Notification 必须用真机，模拟器测不准。
