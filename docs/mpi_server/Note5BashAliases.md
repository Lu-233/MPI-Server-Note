# 使用技巧: Bash Aliases

![](https://visitor-badge.glitch.me/badge?page_id=lu.readthedocs.io.ServerNote.BashAliases)

作者：[Lisa]

[Lisa]: https://github.com/Lisa-MPI

**Bash别名拯救你的工作低效率！**

厌倦了一遍又一遍地输入相同的长命令？Bash别名可以为你创造一个与众不同的世界。

它是一种用新的命令补充或覆盖Bash命令的方法，说白了，就是把你记不住的命令重命名为你记得住的。

## 检查 .bash.aliases 文件权限

登录服务器后，复制以下命令，查看 .bash.aliases 文件权限。

.. code-block:: bash
```shell
ls -l ~/.bash_aliases
```

如果看到输出下文（没有 link 到其他文件），直接跳到操作 3

![](pics/N5_1.png)

如果看到 .bash.aliases 文件后有链接至 `/home/qiqig/mpi-servers/login/etc/skel/.bash_aliases` ，进行操作2。

## (可选)取消 .bash.aliases 文件链接

取消 .bash.aliases 文件链接，并保存文件内容至新的.bash.aliases文件。

如果将来 .bash_aliases 文件链接的地址有变化，请以新地址为准

```shell
unlink ~/.bash_aliases
cat /home/qiqig/mpi-servers/login/etc/skel/.bash_aliases > ~/.bash_aliases
```

## 添加自定义 Bash 别名

(1) 添加Bash别名之前需要确定重命名名称是否已存在。

直接输入重命名名称即可，不存在的名字会直接显示 `Command 'xxx' not found`

![](pics/N5_2.png)

(2) 用以下格式添加需要重命名的命令，直接在下方添加即可，不需要修改已存在的命令

注意替换文字部分

```shell
alias 重命名名称='原始命令'
```

```{admonition} 注意
:class: warning

等号前后不能有空格。
```

(3) 添加完重命名命令后，记得保存文件

![](pics/N5_3.png)

添加查看服务器状态的命令别名，运行下面的命令后，只需要简短的命令 `q` 就能按自定义格式查询服务器状态。

```shell
    alias q='squeue --Format "JobID:8,Partition:11,Name:10,UserName:10,StateCompact:4,TimeUsed:11,NumCPUs:5,tres-per-node:15,Nice:6,PriorityLong:12,ReasonList"'
```

## 测试命令是否重命名成功

修改的 .bash.aliases 文件将在下次登录生效。

我们需要重新登录服务器，然后输入简化的命令，最后查看结果是否符合预期。
