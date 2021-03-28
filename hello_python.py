"""
  Python 小例子
  主要功能：
   - 输出 hello python
   - 创建文件 demo_slurm_python_output.txt 并保存数据
   - 休眠30秒
   - 输出 bye python
"""
import time
from os.path import expanduser

print("hello python!")
with open(expanduser("~") + "/shared/demo_slurm_python_output.txt", mode="a", encoding="utf8") as f:
    f.write("I am experiment result. I save it to a file.")
time.sleep(30)
print("bye python!")
