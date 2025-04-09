250403: 后面又-I和普通的是不一样的，所以没有问题
在时间序列预测模型中，后缀"-I"通常表示模型采用独立参数化（Independent Parameterization）​设计。具体来说：

​Linear-I
基础版Linear对所有输入通道（如多变量时间序列中的不同传感器）共享同一组线性变换参数
-I版本则为每个输入通道建立独立线性层，允许不同通道拥有专属的权重矩阵和偏置项
优势：能更好捕捉多变量时间序列中不同通道的异质性特征
代价：参数量随通道数线性增长，可能增加过拟合风险
​NLinear-I
在NLinear的"减最新值归一化"基础上，对每个通道进行独立参数化：
每个通道单独执行：输入序列减去最后一个观测值
通过通道专属的线性层处理
独立加回被减去的值完成逆变换
相比标准NLinear，能更精细化处理多变量序列的局部波动特性
​DLinear-I
将DLinear的趋势-季节性分解架构升级为通道独立模式：
对每个通道单独进行移动平均分解，得到专属趋势分量
每个通道的季节性分量使用独立线性层处理
最终预测值为各通道独立预测结果的加权组合
特别适合存在显著跨通道趋势差异的场景（如同时预测股价和天气）

++++++++++++++++++++ Test MSE output: ++++++++++++++++++++
{'eval_loss': 0.3812119662761688, 'eval_model_preparation_time': 0.0013, 'eval_runtime': 0.5251, 'eval_samples_per_second': 5303.624, 'eval_steps_per_second': 83.792}
比较多0.00x个点
但是48to24，epoch100就多点
48to24, epoch10, linear/dlinear 0.315 nlinear0.318 我的0.308

{'eval_loss': 0.38099077343940735, 'eval_model_preparation_time': 0.0012, 'eval_runtime': 0.4708, 'eval_samples_per_second': 5914.883, 'eval_steps_per_second': 93.449}
这是没bsa的336-96
{'eval_loss': 0.3812119662761688, 'eval_model_preparation_time': 0.0016, 'eval_runtime': 0.5156, 'eval_samples_per_second': 5401.367, 'eval_steps_per_second': 85.336}
这是有bsa的336-96

{'eval_loss': 0.308412104845047, 'eval_model_preparation_time': 0.0013, 'eval_runtime': 0.4376, 'eval_samples_per_second': 6528.119, 'eval_steps_per_second': 102.823}
这是没bsa的48-24
{'eval_loss': 0.30807560682296753, 'eval_model_preparation_time': 0.0012, 'eval_runtime': 0.4618, 'eval_samples_per_second': 6186.637, 'eval_steps_per_second': 97.444}
这是有bsa的48-24

### 250407
这里将etth1抛30
各个Linear直接不能训练，出来的loss都是nan
ttmb则是
++++++++++++++++++++ Test MSE output: ++++++++++++++++++++
{'eval_loss': 0.4589395821094513, 'eval_model_preparation_time': 0.0012, 'eval_runtime': 0.4989, 'eval_samples_per_second': 5582.799, 'eval_steps_per_second': 88.202}
ttm是
++++++++++++++++++++ Test MSE output: ++++++++++++++++++++
{'eval_loss': 0.4548966586589813, 'eval_model_preparation_time': 0.0012, 'eval_runtime': 0.4864, 'eval_samples_per_second': 5726.025, 'eval_steps_per_second': 90.465}
上面是336-96

ttmb
{'eval_loss': 0.4028620719909668, 'eval_model_preparation_time': 0.0012, 'eval_runtime': 0.4936, 'eval_samples_per_second': 5788.43, 'eval_steps_per_second': 91.172}
ttm
{'eval_loss': 0.3833741545677185, 'eval_model_preparation_time': 0.0013, 'eval_runtime': 0.4615, 'eval_samples_per_second': 6191.15, 'eval_steps_per_second': 97.515}

1 加长程依赖
2 因为缺失值影响对模块影响大，所以缺失值填补重要

### 250409...
或许缺一个列的部分更好补也更现实。。。