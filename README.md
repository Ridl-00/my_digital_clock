# my_digital_clock

本项目实现了一个基于FPGA的**多功能数字钟**，在quartus软件中利用Verilog设计文件和模块化设计文件搭建而成。使用ModelSim仿真。

## 项目功能

- **时间显示**：时-分-秒自动计时及显示
- **手动校时**：支持时/分/秒分别手动校时，且校时所用加减按键实现复用，位选按键控制循环选中秒、分、时，被选中位闪烁显示
- **秒表和数据记录**：计时模式下，计时位数为分-秒-分秒，通过按键实现启动/暂停、数据记录（最多记录五组）、清零；读取记录模式下，通过1个按键可以循环查看五组数据
- **简易电子琴**：8个按键分别对应8个音符，按下时蜂鸣器发声
- **音乐播放**
- **流水灯**

- **按键去抖动处理**

## 硬件平台

- FPGA 开发板：
- 主时钟频率：50 MHz

## 项目结构

```
my_digital_clock/
├── clock_57.qpf           # Quartus 主工程文件
├── clock_57.qsf           # 引脚分配、器件设置
├── clock_57.sdc           # 时序约束（最重要的文件之一）
├── *.v                    # Verilog 源文件（分频、计数、消抖、蜂鸣器等）
├── *.bdf                  # 顶层原理图（Block Design File）
├── *.bsf                  # 符号文件（自动生成，用于原理图）
├── db/                    # Quartus 数据库（自动生成，勿提交）
├── incremental_db/        # 增量编译数据库（自动生成）
├── output_files/          # 编译输出 .sof/.pof（自动生成）
├── simulation/            # ModelSim 仿真文件
└── README.md              # 本文件
```

```
my_digital_clock/                  
│
├── .gitattributes                  # Git 属性文件（控制换行符等）
│
├── README.md                       # 项目说明文档（你正在维护的）
│
├── clock_57.qpf                    # Quartus 主工程文件（双击打开项目）
├── clock_57.qsf                    # Quartus 设置文件（器件型号、引脚分配等）
├── clock_57.sdc                    # 时序约束文件（最重要，手写或修改的）
│
├── clock_top_57_inst.v             # 顶层模块实例化模板（通常自动生成）
├── toppdf.pdf                      # 顶层原理图的 PDF 导出（用于报告）
│
├── fre_div_57.bsf                  # 分频器符号文件（自动生成，用于原理图）
├── bell_sound_57.bsf               # 铃声模块符号文件（自动生成）
├── time_clock_correct_57.bsf       # 校时模块符号文件（自动生成）
├── time_stopwatch_run.bsf          # 秒表运行模块符号文件（自动生成）
│
├── design_sources_57/              # Verilog 源文件存放目录（你手动创建的）
│   ├── clock_top_57.v              # 顶层 Verilog 模块（可能为空或仅实例化）
│   ├── fre_div_57.v                # 分频器（产生 1Hz、扫描频率等使能）
│   ├── deshake1_57.v               # 按键消抖模块（debounce）
│   ├── display_57.v                # 数码管显示驱动与扫描模块
│   ├── bell_sound_57.v             # 蜂鸣器驱动（有源：简单高低电平；无源：方波）
│   ├── bell_led_ctrl_57.v          # 铃声 + LED 联动控制（可能控制指示灯）
│   ├── led_light_57.v              # LED 指示灯控制模块
│   ├── register_57.v               # 寄存器模块（可能是存储闹钟时间等）
│   ├── time_clock_correct_57.v     # 校时 / 调时逻辑模块
│   ├── time_alarm_set_57.v         # 闹钟设定模块
│   ├── time_stopwatch_run.v        # 秒表运行控制模块（注意：文件名无 _57 后缀）
│   ├── time_stopwatch_record_57.v  # 秒表计次 / 记录模块（可能支持多组计时）
│   └── week_ctrl_57.v              # 星期控制模块（可能显示星期几）
│
├── db/                             # Quartus 编译数据库（自动生成，勿提交）
├── incremental_db/                 # 增量编译数据库（自动生成，勿提交）
├── output_files/                   # 编译输出（.sof / .pof / .rpt 等，自动生成，勿提交）
└── simulation/                     # ModelSim 仿真相关（可能有 .do 脚本、波形等）
```



## 现存BUG

- 时钟域处理问题：错误地先将时钟分频再输入至目标模块
  - 全局统一时钟域，传输至目标模块后分频
- 整点报时、闹钟功能未调试成功：原因可能同上
- 音乐播放有声音但与预期节拍和音调不符：原因可能同上

## 更多文档

详细的模块功能和设计思路见报告文档

功能演示视频见哔哩哔哩：

工程代码仓库：本仓库