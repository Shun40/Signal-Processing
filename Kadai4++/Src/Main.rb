# 添付資料4(1) #

# 文字コードの指定(UTF8)
#! ruby -Ku
# ロードパスの指定
$LOAD_PATH.unshift("F:/5I_kouki_Memory/SignalProcessing/Programming/");

# モジュールの読み込み
require "F:/5IKoukiMemory/SignalProcessing/Program/Kadai4++/Src/DFTModule.rb";
require "F:/5IKoukiMemory/SignalProcessing/Program/Kadai4++/Src/FFTModule.rb";
require "F:/5IKoukiMemory/SignalProcessing/Program/Kadai4++/Src/InputModule.rb";
require "F:/5IKoukiMemory/SignalProcessing/Program/Kadai4++/Src/OutputModule.rb";

# 計算に必要な変数
f = Array.new(); # 入力波形のデータを格納する配列
dftRe = Array.new(); # DFT出力波形の実部データを格納する配列
dftIm = Array.new(); # DFT出力波形の虚部データを格納する配列
fftRe = Array.new(); # FFT出力波形の実部データを格納する配列
fftIm = Array.new(); # FFT出力波形の虚部データを格納する配列

# データをファイルから読み込み
fileName = InputModule.getFileName();
InputModule.readFile(fileName, f);

n = f.length; # データの個数

# DFT実行
DFTModule.dft(f, dftRe, dftIm);
# FFT実行
FFTModule.fft(f, fftRe, fftIm);

# データをファイルへ出力
fileName = OutputModule.getFileName();
OutputModule.writeFile(fileName, dftRe, dftIm, fftRe, fftIm, n);