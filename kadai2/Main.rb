# 文字コードの指定(UTF8)
#! ruby -Ku
# ロードパスの指定
$LOAD_PATH.push("F:/5I_kouki_Memory/SignalProcessing/Programming");
# 外部ファイル読み込み
require './SinWaveParameterReader';
require './SinWaveParameter';
require './SamplingParameterReader';
require './SamplingParameter';
require './WhiteNoiseParameterReader';
require './WhiteNoiseParameter';
require './ADConverter';
require './ResultWriter';

# ファイルからsin波のデータを読み込み
sinWaveParameterReader = SinWaveParameterReader.new();
sinWaveParameterReader.readSinWaveParameter();
# ファイルからサンプリングのパラメータを読み込み
samplingParameterReader = SamplingParameterReader.new();
samplingParameterReader.readSamplingParameter();
# ファイルからホワイトノイズのパラメータを読み込み
whiteNoiseParameterReader = WhiteNoiseParameterReader.new();
whiteNoiseParameterReader.readWhiteNoiseParameter();

# sin波パラメータ生成
vMax = sinWaveParameterReader.sinWaveParameter[0];
vMin = sinWaveParameterReader.sinWaveParameter[1];
vAmplitude = sinWaveParameterReader.sinWaveParameter[2];
waveFrequency = sinWaveParameterReader.sinWaveParameter[3];
sinWaveParameter = SinWaveParameter.new(vMax, vMin, vAmplitude, waveFrequency);
sinWaveParameter.displaySinWaveParameter();
# サンプリングパラメータ生成
samplingFrequency = samplingParameterReader.samplingParameter[0];
samplingTime = samplingParameterReader.samplingParameter[1];
quantizationBit = samplingParameterReader.samplingParameter[2];
samplingParameter = SamplingParameter.new(samplingFrequency, samplingTime, quantizationBit);
samplingParameter.displaySamplingParameter();
# ホワイトノイズパラメータ生成
noiseMax = whiteNoiseParameterReader.whiteNoiseParameter[0];
noiseMin = whiteNoiseParameterReader.whiteNoiseParameter[1];
noiseAmplitude = whiteNoiseParameterReader.whiteNoiseParameter[2];
whiteNoiseParameter = WhiteNoiseParameter.new(noiseMax, noiseMin, noiseAmplitude);
whiteNoiseParameter.displayWhiteNoiseParameter();

# A/Dコンバータ生成, A/D変換
vMax = sinWaveParameter.vMax;
vMin = sinWaveParameter.vMin;
vAmplitude = sinWaveParameter.vAmplitude;
waveFrequency = sinWaveParameter.waveFrequency;
samplingTime = samplingParameter.samplingTime;
samplingCycle = samplingParameter.samplingCycle;
quantizationBit = samplingParameter.quantizationBit;
noiseMax = whiteNoiseParameter.noiseMax;
noiseMin = whiteNoiseParameter.noiseMin;
adConverter = ADConverter.new();
adConverter.sampling(vMax, waveFrequency, samplingTime, samplingCycle, noiseMax, noiseMin);
adConverter.quantize(vMin, vAmplitude, samplingTime, samplingCycle, quantizationBit);
adConverter.encoding(samplingTime, samplingCycle);

# A/D変換の結果をファイルに書き込み
samplingData = adConverter.samplingData;
quantizationData = adConverter.quantizationData;
encodingData = adConverter.encodingData;
resultWriter = ResultWriter.new();
resultWriter.writeSamplingData(samplingData);
resultWriter.writeQuantizationData(quantizationData);
resultWriter.writeEncodingData(encodingData);