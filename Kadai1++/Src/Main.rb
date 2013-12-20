# 添付資料1(1) #

# 文字コードの指定(UTF8)
#! ruby -Ku
# ロードパスの指定
$LOAD_PATH.unshift("F:/5I_kouki_Memory/SignalProcessing/Programming/");

# モジュールの読み込み
require "F:/5IKoukiMemory/SignalProcessing/Program/Kadai1++/Src/SamplingModule.rb";
require "F:/5IKoukiMemory/SignalProcessing/Program/Kadai1++/Src/QuantizeModule.rb";
require "F:/5IKoukiMemory/SignalProcessing/Program/Kadai1++/Src/EncodeModule.rb";
require "F:/5IKoukiMemory/SignalProcessing/Program/Kadai1++/Src/OutputModule.rb";

# sin波のパラメータ定数
SIN_V_MAX = 5.0; # sin波の電圧最大値
SIN_V_MIN = -5.0; # sin波の電圧最小値
SIN_V_AMP = 10.0; # sin波の電圧振幅
SIN_FREQ = 10.0; # sin波の周波数

# A/D変換のパラメータ定数
SAMPLING_FREQ = 1000.0; # サンプリング周波数
SAMPLING_TIME = 1.0; # サンプリング時間
QUANTUM_BIT = 8; # 量子化ビット数

# 計算に必要な変数
tau = 1.0 / SAMPLING_FREQ; # サンプリング周期
n = SAMPLING_TIME / tau; # データ個数
e = 2 ** QUANTUM_BIT; # 2^量子化ビット数
w = SIN_V_AMP / e; # 量子化幅
sf = Array.new(n); # sin波の標本化データを格納する配列
qf = Array.new(n); # sin波の量子化データを格納する配列
ef = Array.new(n); # sin波の符号化データを格納する配列

# 標本化
SamplingModule.sampling(sf, n, SIN_V_MAX, SIN_FREQ, tau);
# 量子化
QuantizeModule.quantize(sf, qf, n, SIN_V_MAX, SIN_V_MIN, w, e);
# 符号化
EncodeModule.encode(qf, ef, n, QUANTUM_BIT);

# データをファイルへ出力
fileName = OutputModule.getFileName();
OutputModule.writeFile(fileName, sf, qf, ef, n, tau);