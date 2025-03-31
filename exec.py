import os
import sys

def configure_environment():
    """提前设置所有环境参数，必须在导入原始脚本前完成"""
    # 创建目录（如果需要）
    os.makedirs('./logs/LongForecasting', exist_ok=True)
    
    # 构造模拟命令行参数
    seq_len = 48
    model_name = 'DLinear'
    sys.argv = [
        'run_longExp.py',  # 模拟脚本名称
        '--is_training', '1',
        '--root_path', '/home/xiaofuqiang/repo/LTSF-Linear/dataset/',
        '--data_path', 'ETTh1.csv',
        '--model_id', f'ETTh1_{seq_len}_24',
        '--model', model_name,
        '--data', 'ETTh1',
        '--features', 'M',
        '--seq_len', str(seq_len),
        '--pred_len', '24',
        '--enc_in', '7',
        '--des', 'Exp',
        '--itr', '1',
        '--batch_size', '32',
        '--learning_rate', '0.005'
    ]

if __name__ == "__main__":
    # 先配置参数和环境
    configure_environment()
    
    # 延迟导入确保参数已正确设置
    from run_longExp import main  # 此时参数已生效
    
    # 执行主函数
    main()  # 现在可以正常断点调试