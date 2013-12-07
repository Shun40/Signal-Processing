class SamplingParameter
	# 外部ファイル読み込み
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai1/ADConverter/SamplingParameter/SamplingParameterReader.rb';

	# コンストラクタ
	def initialize()
		reader = SamplingParameterReader.new();
		@samplingFrequency = reader.parameter[0]; # サンプリング周波数[Hz]
		@samplingTime = reader.parameter[1]; # サンプリング時間[sec]
		@samplingCycle = 1.0 / @samplingFrequency; # サンプリング周期[sec]
		@quantizationBit = reader.parameter[2]; # 量子化ビット数[bit]
	end

	# アクセスメソッド
	attr_reader :samplingFrequency;
	attr_reader :samplingTime;
	attr_reader :samplingCycle;
	attr_reader :quantizationBit;
end