class WhiteNoiseParameter
	# 外部ファイル読み込み
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/WhiteNoise/WhiteNoiseParameterReader.rb';

	# コンストラクタ
	def initialize()
		reader = WhiteNoiseParameterReader.new();
		@noiseMax = reader.parameter[0]; # ノイズ電圧最大値[V]
		@noiseMin = reader.parameter[1]; # ノイズ電圧最小値[V]
		@noiseAmplitude = reader.parameter[2]; # ノイズ振幅[V]
	end

	# アクセスメソッド
	attr_reader :noiseMax;
	attr_reader :noiseMin;
	attr_reader :noiseAmplitude;
end