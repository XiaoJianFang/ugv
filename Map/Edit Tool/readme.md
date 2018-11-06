地图编辑软件使用说明 1.0

功能：
1 加载高精度地图（车道线、点云、路口、红路灯、停车位）
2 加载SlamPosMap.txt,显示全局轨迹(支持显示多路径)
3 分段编辑路径的flag
4 添加路径。通过选择控制点，插值生成曲线
5 删除/添加 地图元素
6 拼接路径
7 保存路径图片
8 测量两点间距离

功能键：（字母分大小写）
mouse left  :平移地图地图
mouse wheel :缩放地图
mouse right :获取鼠标点坐标
Space       :插入数据(保存选择控制点生成的数据)
Backspace   :撤销上一个控制点
P           :保存当前可视化界面图片
L           :测量两点间距离
Enter       :保存数据
T           :编辑路径模式（Edit path flag）/退出编辑模式（Exit edit mode）
K           :编辑单个现有路径（Edit single path）/生成路径（Create new path）

Q           :添加点云
A           :删除点云

W           :添加车道线离散点
S           :删除车道线离散点

E           :添加车道线序列点
D           :删除车道线序列点
C           :编辑车道线序列点属性

R           :添加路口
F           :删除路口

注意事项：
生成曲线时，选择控制点，插值生成，控制点间的间距要近似相等


一 测距使用说明
使用步骤：
1 L  Measure Distance
2 mouse right 选择起点
3 移动鼠标过程中，显示起点与鼠标点间的距离(单位cm)
4 mouse right 选择终点
5 重复测量，需重复按下 L

二 编辑路径flag使用说明

处理思路：通过选择控制点，编辑两个控制点间的flag,实现编辑flag的功能。
选择控制点的时候，需要输入flag的值(此falg 表示该点到下一个点间的flag值)

使用步骤：
1 加载高精度地图
2 加载编辑路径
3 按下T，模式 Edit path flag
4 按下K，

处于 Edit single path 模式， 可以编辑现有的路径flag
mouse right，获取鼠标点坐标，并在命令行输入flag
如果下一段路径是生成的新路径，需要按空格保存已编辑的flag,否则不需要
如果选完所有控制点，需要按下空格键，保存编辑的路径flag

处于 Create new path  模式， 可以生成新路径
mouse right，获取控制点坐标（并显示），控制点最少三个
控制点选择完后，按下空格键，保存生成的曲线

5 按下Enter,保存编辑的路径,生成SlamPosMapNew.txt 文件
注意事项：
模式 Edit path flag 下， 选择第一个点时，需要距离上一个点1米左右(距离上一个点适当有些距离)
如果控制点选择的不好，可以按Backspace 撤销。

