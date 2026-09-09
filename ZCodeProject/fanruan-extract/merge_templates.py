# -*- coding: utf-8 -*-
"""Merge FineReport template packages into fanruan-components (templates/ + assets/)."""
import zipfile, os, shutil, hashlib

ROOT = r'C:\Users\Administrator\ZCodeProject'
LIB = os.path.join(ROOT, 'fanruan-components')
DL = os.path.join(ROOT, 'fanruan-extract', 'downloads')
RAR_DIR = os.path.join(ROOT, 'fanruan-extract', '大屏模板示例一')


def fix(n):
    try:
        return n.encode('cp437').decode('gbk')
    except Exception:
        return n


tpl = os.path.join(LIB, 'templates')
shutil.rmtree(tpl, ignore_errors=True)
os.makedirs(os.path.join(tpl, '大屏模板示例一'), exist_ok=True)
os.makedirs(os.path.join(tpl, '费用预算系统'), exist_ok=True)

# frm 目录整体拷入
for f in os.listdir(RAR_DIR):
    src = os.path.join(RAR_DIR, f)
    dst = os.path.join(tpl, '大屏模板示例一', f)
    if os.path.isfile(src):
        shutil.copy2(src, dst)
    else:
        shutil.copytree(src, dst, dirs_exist_ok=True)

# 费用预算系统 zip：子目录拍平成 子目录__文件名，避免嵌套
z = zipfile.ZipFile(os.path.join(DL, '费用预算系统.zip'))
seen = set()
for info in z.infolist():
    if info.is_dir():
        continue
    raw = fix(info.filename).replace('\\', '/')
    rel = raw.replace('/', '__')
    if rel in seen:
        continue
    seen.add(rel)
    with open(os.path.join(tpl, '费用预算系统', rel), 'wb') as f:
        f.write(z.read(info))


def md5(p):
    return hashlib.md5(open(p, 'rb').read()).hexdigest()


existing = set()
for cat in os.listdir(os.path.join(LIB, 'assets')):
    d = os.path.join(LIB, 'assets', cat)
    if os.path.isdir(d):
        for fn in os.listdir(d):
            existing.add(md5(os.path.join(d, fn)))

adds = [
    ('图片素材/标题侧边背景框左.png', '大标题', '保险大屏-标题侧框左.png'),
    ('图片素材/标题侧边背景框右.png', '大标题', '保险大屏-标题侧框右.png'),
    ('图片素材/标题背景带渐变框.png', '大标题', '保险大屏-标题渐变框.png'),
    ('图片素材/边框元素.png', '组件面板', '保险大屏-边框元素.png'),
    ('图片素材/主体背景.jpg', '大屏背景', '保险大屏-主体背景.jpg'),
]
n = 0
for rel, cat, name in adds:
    src = os.path.join(RAR_DIR, rel)
    if not os.path.isfile(src):
        print('missing', src)
        continue
    if md5(src) in existing:
        print('dup skip', name)
        continue
    shutil.copy2(src, os.path.join(LIB, 'assets', cat, name))
    n += 1
print('assets added:', n)
print('templates files:', sum(len(fs) for _, _, fs in os.walk(tpl)))
