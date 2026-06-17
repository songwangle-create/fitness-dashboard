# Warm Minimal 设计系统

> 从 fitness-dashboard 提炼的设计语言 · 暖灰底色 + 陶土强调色

## 文件结构

```
warm-minimal/
├── design-tokens.json   ← 机读数据，AI 生成代码时的硬约束
├── reference.html       ← 可视化参考页，浏览器打开即看
└── README.md            ← 本文件
```

## 使用方式

### 1. 在项目中声明

在项目的 `MEMORY.md` 或对话开头指定：

```
Design System: ~/.workbuddy/design-systems/warm-minimal/
```

AI 会在写代码前读取 `design-tokens.json`，确保所有颜色、间距、圆角从 token 取值。

### 2. 校验视觉效果

浏览器打开 `reference.html`，对比新页面与参考页的一致性。

### 3. CSS 变量映射

所有 token 应通过 CSS 变量引用，避免硬编码 hex 值：

```css
:root {
  --bg: #f5f4ef;
  --surface: #ffffff;
  --accent: #c96442;
  /* ... 完整变量见 design-tokens.json */
}

.my-card {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius);  /* 12px */
  box-shadow: var(--shadow);
}
```

## 设计理念

| 原则 | 说明 |
|------|------|
| **暖色中性底** | `#f5f4ef` 替代纯白，传递温暖而非科技感 |
| **单一强调色** | 陶土橙 `#c96442`，克制使用 |
| **极浅阴影** | 靠边框 + 底色差异建立层级 |
| **半粗体 650** | 匹配 SF Pro Semi-bold，比 700 更均衡 |
| **移动端减信息不减触摸** | 隐藏次要列，不缩小点击热区 |
| **底部浮层 > 弹窗** | 移动端弹窗一律转为 sheet |

## 适用场景

- 个人工具类 dashboard
- 运动/健康/生活记录类应用
- 轻量级数据展示页面
- 偏温暖、克制、注重可读性的 UI

## 版本

- **v1.0** (2026-04-07) — 从 fitness-dashboard 首次提炼
