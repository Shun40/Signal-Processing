# 文字コードの指定(UTF8)
#! ruby -Ku
# ロードパスの指定
$LOAD_PATH.unshift("F:/5I_kouki_Memory/SignalProcessing/Programming");
# 外部ファイル読み込み
require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ADConverter/ADConverter.rb';

# A/Dコンバータ生成
adConverter = ADConverter.new();
# サンプリングパラメータの表示
adConverter.displaySamplingParameter();
# A/D変換
adConverter.sampling();
adConverter.quantize();
adConverter.encoding();
# 平滑化パラメータの表示
adConverter.displayMovingAverageParameter();
# 平滑化処理付きA/D変換
adConverter.filteredSampling();
adConverter.filteredQuantize();
adConverter.filteredEncoding();
# 変換結果出力
adConverter.writeSamplingData();
adConverter.writeQuantizationData();
adConverter.writeEncodingData();
# 平滑化処理付き変換結果出力
adConverter.writeFilteredSamplingData();
adConverter.writeFilteredQuantizationData();
adConverter.writeFilteredEncodingData();
# 変換結果出力ファイルの表示
adConverter.displaySamplingDataFile();
adConverter.displayQuantizationDataFile();
adConverter.displayEncodingDataFile();
# 平滑化処理付き変換結果出力ファイルの表示
adConverter.displayFilteredSamplingDataFile();
adConverter.displayFilteredQuantizationDataFile();
adConverter.displayFilteredEncodingDataFile();