#!/usr/bin/env bash

# نروح لمجلد المشروع
cd ~/11 || exit

# إضافة كل الملفات الجديدة أو المعدلة
git add .

# عمل commit برسالة تحتوي على التاريخ والوقت
git commit -m "Auto update $(date '+%Y-%m-%d %H:%M')"

# دفع التغييرات للمستودع البعيد
git push origin main
