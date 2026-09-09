# -*- coding: utf-8 -*-
"""把 fanruan-components 的素材/演示页融合进 vista-dashboard-components（统一 9999 入口）。"""
import json, os, re, shutil

ROOT = r'C:\Users\Administrator\ZCodeProject'
FR = os.path.join(ROOT, 'fanruan-components')
VISTA = os.path.join(ROOT, 'vista-dashboard-components')
DEST = os.path.join(VISTA, '帆软组件')

CATS = [
    ('fr-bg',      '帆软·大屏背景', '大屏背景',   '帆软 大屏背景'),
    ('fr-longbg',  '帆软·长屏背景', '长屏背景',   '帆软 长屏背景'),
    ('fr-title',   '帆软·大标题',   '大标题',     '帆软 大标题'),
    ('fr-ctitle',  '帆软·组件标题', '组件标题',   '帆软 组件标题'),
    ('fr-panel',   '帆软·组件面板', '组件面板',   '帆软 组件面板'),
    ('fr-divider', '帆软·分割线',   '分割线',     '帆软 分割线'),
    ('fr-icon',    '帆软·图标',     '图标',       '帆软 图标'),
]

# ---------- 1) 搬移素材 ----------
if os.path.isdir(DEST):
    shutil.rmtree(DEST)
os.makedirs(DEST)
entries = []  # (category_id, name, path, family)

for cid, cname, folder, family in CATS:
    src = os.path.join(FR, 'assets', folder)
    dst = os.path.join(DEST, folder)
    shutil.copytree(src, dst)
    for fn in sorted(os.listdir(dst)):
        if os.path.splitext(fn)[1].lower() not in ('.png', '.jpg', '.jpeg'):
            continue
        entries.append((cid, os.path.splitext(fn)[0], '帆软组件/%s/%s' % (folder, fn), family))

# 市场参考图
mk_src = os.path.join(FR, 'market-previews')
mk_dst = os.path.join(DEST, '市场参考')
os.makedirs(mk_dst)
manifest = json.load(open(os.path.join(mk_src, 'manifest.json'), encoding='utf-8'))
for it in manifest:
    fn = os.path.basename(it['file'])
    shutil.copy2(os.path.join(mk_src, fn), os.path.join(mk_dst, fn))
    entries.append(('fr-market', it['name'][:18], '帆软组件/市场参考/' + fn, '帆软市场参考'))

print('files moved:', len(entries))

# ---------- 2) 注入 app.js ----------
app = open(os.path.join(VISTA, 'app.js'), encoding='utf-8').read()

cat_js = ',\n'.join(
    '  {\n    "id": "%s",\n    "name": "%s"\n  }' % (cid, cname)
    for cid, cname, _, _ in CATS
) + ',\n  {\n    "id": "fr-market",\n    "name": "帆软·市场参考"\n  }'

app = app.replace('''  {
    "id": "layout",
    "name": "通用面板"
  }
];''', '''  {
    "id": "layout",
    "name": "通用面板"
  },
''' + cat_js + '\n];', 1)

comp_js = ',\n'.join(
    '  {\n    "category": "%s",\n    "name": %s,\n    "path": %s,\n    "family": %s\n  }' % (
        cid, json.dumps(name, ensure_ascii=False), json.dumps(path, ensure_ascii=False),
        json.dumps(family, ensure_ascii=False))
    for cid, name, path, family in entries
)
anchor = '].map((item, index) => ({ ...item, id: index + 1 }));'
assert anchor in app, 'components anchor missing'
app = app.replace(anchor, comp_js + '\n' + anchor, 1)
open(os.path.join(VISTA, 'app.js'), 'w', encoding='utf-8').write(app)
print('app.js updated, total entries +=', len(entries))

# ---------- 3) 演示页搬移 + 路径改写 ----------
for page in ('demo-report.html', 'demo-dashboard.html'):
    html = open(os.path.join(FR, page), encoding='utf-8').read()
    html = html.replace('assets/', '帆软组件/')
    open(os.path.join(VISTA, page), 'w', encoding='utf-8').write(html)
    os.remove(os.path.join(FR, page))
print('demo pages moved')

# ---------- 4) index.html 顶部加入口 ----------
idx_path = os.path.join(VISTA, 'index.html')
idx = open(idx_path, encoding='utf-8').read()
btns = ('<a class="ghost-button" href="demo-report.html" target="_blank">帆软驾驶舱复刻</a>\n'
        '            <a class="ghost-button" href="demo-dashboard.html" target="_blank">医疗监测大屏拼装</a>')
anchor2 = '<div class="topbar-actions">'
if anchor2 in idx and 'demo-report.html' not in idx:
    idx = idx.replace(anchor2, anchor2 + '\n            ' + btns, 1)
    open(idx_path, 'w', encoding='utf-8').write(idx)
    print('index.html buttons added')

# ---------- 5) 收尾：fanruan-components 只留 templates/文档 ----------
shutil.rmtree(os.path.join(FR, 'assets'), ignore_errors=True)
shutil.rmtree(os.path.join(FR, 'market-previews'), ignore_errors=True)
print('done')
