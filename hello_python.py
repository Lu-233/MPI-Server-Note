"""
  这是一个python示例文件，用于输出hello world, 并休眠20秒，以供用户从squeue查看任务情况
"""
import time

print("hello python!")
print "Start : %s" % time.ctime()
time.sleep(20)  # 等待20秒
print "End : %s" % time.ctime()
