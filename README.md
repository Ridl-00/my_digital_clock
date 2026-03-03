# my_digital_clock

本项目实现了一个基于FPGA的**多功能数字钟**，在quartus软件中利用Verilog设计文件和模块化设计文件搭建而成。使用ModelSim仿真。

## 项目功能

- **时间显示**：时-分-秒自动计时及显示；星期显示
- **手动校时**：支持时/分/秒分别手动校时，且校时所用加减按键实现复用，位选按键控制循环选中秒、分、时，被选中位闪烁显示；星期控制
- **秒表和数据记录**：计时模式下，计时位数为分-秒-分秒，通过按键实现启动/暂停、数据记录（最多记录五组）、清零；读取记录模式下，通过1个按键可以循环查看五组数据
- **简易电子琴**：8个按键分别对应8个音符，按下时蜂鸣器发声
- **音乐播放**
- **流水灯**

- **按键去抖动处理**

## 硬件平台

- FPGA 开发板：Cyclone III EP3C16Q240C8 实验开发板
- 主时钟频率：50 MHz

## 项目结构

```
my_digital_clock/                  
│
├── .gitattributes                  
├── .gitignore                  	
│
├── README.md                       # 项目说明文档
│
├── clock_57.qpf                    # Quartus 主工程文件
├── clock_57.qsf                    # Quartus 设置文件
├── clock_57.sdc                    # 时序约束文件
│
├── clock_top_57_inst.v             # 顶层模块实例化模板（自动生成）
├── toppdf.pdf                      # 顶层原理图的 PDF 
├── 课程报告.docx                    
│
├── fre_div_57.bsf                  # 分频器符号文件（自动生成）
├── bell_sound_57.bsf               # 铃声模块符号文件（自动生成）
├── time_clock_correct_57.bsf       # 校时模块符号文件（自动生成）
├── time_stopwatch_run.bsf          # 秒表运行模块符号文件（自动生成）
│
├── design_sources_57/              # Verilog 源文件存放目录
│   ├── clock_top_57.v              # 顶层 Verilog 模块
│   ├── fre_div_57.v                # 分频器
│   ├── deshake1_57.v               # 按键消抖模块
│   ├── display_57.v                # 数码管显示驱动与扫描模块
│   ├── bell_sound_57.v             # 蜂鸣器驱动（无源）
│   ├── bell_led_ctrl_57.v          # 铃声 + LED 联动控制
│   ├── led_light_57.v              # LED 指示灯控制模块
│   ├── register_57.v               # 寄存器模块
│   ├── time_clock_correct_57.v     # 校时 / 调时逻辑模块
│   ├── time_alarm_set_57.v         # 闹钟设定模块
│   ├── time_stopwatch_run.v        # 秒表运行控制模块
│   ├── time_stopwatch_record_57.v  # 秒表记录模块
│   └── week_ctrl_57.v              # 星期控制模块
│
├── db/                             # Quartus 编译数据库（自动生成）
├── incremental_db/                 # 增量编译数据库（自动生成）
├── output_files/                   # 编译输出（.sof / .pof / .rpt 等，自动生成）
└── simulation/                     # ModelSim 仿真相关
```

## 现存BUG

- 时钟域处理问题：错误地先将时钟分频再输入至目标模块
  - 全局统一时钟域，传输至目标模块后分频
- 整点报时、闹钟功能未调试成功：原因可能同上
- 音乐播放有声音但与预期节拍和音调不符：原因可能同上

## 更多文档

详细的模块功能和设计思路见报告文档

功能演示视频见哔哩哔哩：【基于FPGA的数字时钟设计作业】https://www.bilibili.com/video/BV1Zm6uYAEdY/?share_source=copy_web&vd_source=465bfd87b90552447f7e3304bf03c26b

工程代码仓库：本仓库[Ridl-00/my_digital_clock](https://github.com/Ridl-00/my_digital_clock)