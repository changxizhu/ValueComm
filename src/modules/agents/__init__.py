# -*- coding: utf-8 -*-
# @Time    : 2023/7/27 21:49
# @Author  : Zhuohui Zhang
# @File    : __init__.py
# @Software: PyCharm
# @mail    : zhangzh.grey@gmail.com
from .tgcnet import TGCNet
from .maic import MAIC
from .cacom_agent import CACOM_Agent


REGISTRY = {"tgcnet": TGCNet,
            "maic": MAIC,
            "cacom": CACOM_Agent}
