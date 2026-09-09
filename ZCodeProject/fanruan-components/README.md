# 帆软组件库（本地提取版）

> 2026-09-09 已并入统一演示中心：素材、市场参考图与两张演示大屏全部移入
> `../vista-dashboard-components/`（9999 端口，分类以「帆软·」前缀区分）。
> 本目录只保留 **FineReport 模板文件** 与文档。

## 本目录内容

```
templates/
├── 大屏模板示例一/     官方销售驾驶舱 .frm 模板 + 图片素材 + 10 个建表 SQL
└── 费用预算系统/       9 张 .cpt 报表（填报/审批/审核/进度分析）双份配置 + SQL
```

`.frm` / `.cpt` 可直接用本机 FineReport 打开继续编辑。

## 统一入口（9999）

```bash
cd ../vista-dashboard-components && python server.py
```

- 演示中心 http://127.0.0.1:9999 —— VISTA 自有组件 + 帆软·8 个分类（大屏背景/长屏背景/
  大标题/组件标题/组件面板/分割线/图标/市场参考），共 456 项
- 帆软驾驶舱复刻 http://127.0.0.1:9999/demo-report.html
- 医疗监测大屏拼装 http://127.0.0.1:9999/demo-dashboard.html

## 来源

- 素材：帆软官方帮助文档《数据可视化指南》公开素材包，逐包下载解压（GBK 文件名已修正），
  原始 zip 在 `../fanruan-extract/downloads/`
- 市场参考图：帆软市场组件复用（market.fanruan.com/reuse）热度 TOP 59 预览图，版权归帆软，仅作参考
- 帆软市场 `.reu/.reus` 组件包下载需登录帆软账号，未纳入；若在设计器「组件复用」下载过，
  文件位于工程 `webroot/WEB-INF/components/`，可解包后再并入 9999 中心
