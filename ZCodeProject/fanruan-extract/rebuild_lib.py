# -*- coding: utf-8 -*-
"""Re-extract FanRuan material zips into fanruan-components/assets with GBK-fixed names."""
import zipfile, os, re, shutil

ROOT = r'C:\Users\Administrator\ZCodeProject'
DL = os.path.join(ROOT, 'fanruan-extract', 'downloads')
DST = os.path.join(ROOT, 'fanruan-components', 'assets')

mapping = {
    '大屏背景图': '大屏背景', '大屏背景图2': '大屏背景', '长屏背景': '长屏背景',
    '大标题背景': '大标题', '组件标题背景': '组件标题', '组件背景': '组件面板',
    '分割线': '分割线', '图标': '图标',
}
BAD = re.compile(r'[\\/:*?"<>|\x00-\x1f]')


def fix_name(n):
    # zips store GBK names without the UTF-8 flag; python decodes them as cp437 -> re-decode as GBK
    try:
        return n.encode('cp437').decode('gbk')
    except Exception:
        return n


def clean(s):
    s = BAD.sub('_', s).strip('. ')
    s = re.sub(r'_+', '_', s)
    return s[:80] or 'unnamed'


if os.path.isdir(DST):
    shutil.rmtree(DST)

count = {}
for zname, cat in mapping.items():
    zp = os.path.join(DL, zname + '.zip')
    out = os.path.join(DST, cat)
    os.makedirs(out, exist_ok=True)
    n = 0
    seen = set()
    with zipfile.ZipFile(zp) as z:
        for info in z.infolist():
            if info.is_dir():
                continue
            raw = fix_name(info.filename).replace('\\', '/')
            base = os.path.basename(raw)
            if not base or os.path.splitext(base)[1].lower() not in ('.png', '.jpg', '.jpeg'):
                continue
            flat = clean(base)
            while flat in seen:
                flat = 'dup_' + flat
            seen.add(flat)
            try:
                data = z.read(info)
                with open(os.path.join(out, flat), 'wb') as f:
                    f.write(data)
                n += 1
            except Exception as e:
                print('SKIP', repr(base)[:50], repr(e)[:50])
    count[cat] = n
print(count, 'total:', sum(count.values()))
