# -*- coding: utf-8 -*-
# @Time    : 2023/7/27 15:13
# @Author  : Zhuohui Zhang
# @File    : __init__.py
# @Software: PyCharm
# @mail    : zhangzh.grey@gmail.com
from .tgc_learner import TGCLearner
from .maic_learner import MAICLearner
from .cacom_learner import CACOM_Learner

REGISTRY = {"tgc_learner": TGCLearner,
            "maic_learner": MAICLearner,
            "cacom_learner": CACOM_Learner}

