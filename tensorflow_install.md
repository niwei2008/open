//https://zhuanlan.zhihu.com/p/60713249

https://www.anaconda.com/products/individual

conda create -n tensorflow python=3.6.4

source activate tensorflow

pip install tensorflow -i http://pypi.douban.com/simple --trusted-host=pypi.douban.com

source activate tensorflow
```
import tensorflow as tf
// tf.compat.v1.disable_eager_execution() //https://zhuanlan.zhihu.com/p/277569990?utm_source=wechat_session
hello=tf.constant("hello tensorflow")
sess=tf.compat.v1.Session() //https://blog.csdn.net/sinat_36502563/article/details/102302392
print(sess.run(hello))
```

